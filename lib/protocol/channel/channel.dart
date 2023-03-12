import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'dart:typed_data';

import 'package:lukerieff/protocol/channel/events/event.dart';
import 'package:lukerieff/protocol/channel/events/event_listeners.dart';
import 'package:lukerieff/protocol/channel/services/pending_callback_request.dart';
import 'package:lukerieff/protocol/channel/services/pending_completer_request.dart';
import 'package:lukerieff/protocol/channel/services/request.dart';
import 'package:lukerieff/protocol/channel/services/request_error.dart';
import 'package:lukerieff/protocol/channel/services/request_error_type.dart';
import 'package:lukerieff/protocol/channel/services/pending_requests.dart';
import 'package:lukerieff/protocol/channel/services/response.dart';
import 'package:lukerieff/protocol/client/protocol_client.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

class Channel {
  final ProtocolClient client;
  final int identifier;
  final EventListeners _eventListeners = EventListeners();
  final PendingRequests _pendingRequests = PendingRequests();
  int _nextRequestNumber = 0;

  /// Constructs a new channel.
  Channel(
    this.client,
    this.identifier,
  );

  /// Handles a new event message.
  void _onEventMessage(final FrameChanneledEventMessage eventMsg) {
    // Decodes the event.
    final Event event = Event.decode(eventMsg);

    // Emits the event.
    _eventListeners.onEvent(event);
  }

  /// Handles a new request message.
  void _onRequestMessage(final FrameChanneledRequestMessage requestMsg) {}

  /// Handles a new response message.
  void _onResponseMessage(final FrameChanneledResponseMessage responseMsg) {
    final Response response = Response.decode(responseMsg);

    _pendingRequests.onResponse(response);
  }

  /// Handles a new channeled message.
  void onChanneledMessage(final FrameChanneledMessage channeledMsg) {
    switch (channeledMsg.whichChild()) {
      case FrameChanneledMessage_Child.event:
        _onEventMessage(channeledMsg.event);
        break;
      case FrameChanneledMessage_Child.request:
        _onRequestMessage(channeledMsg.request);
        break;
      case FrameChanneledMessage_Child.response:
        _onResponseMessage(channeledMsg.response);
        break;
      case FrameChanneledMessage_Child.notSet:
        break;
    }
  }

  /// Emits the given event.
  Future<void> emit(final Event event) async {
    // Sends the event frame.
    await client.sendFrame(
      FrameMessage(
        channeled: FrameChanneledMessage(
          channel: identifier,
          event: event.encode(),
        ),
      ),
    );
  }

  /// Builds a request for the given service with the (possibly) given body.
  Request _buildRequest(
    final FrameChanneledRequestMessage_ServiceNo serviceNo, {
    final Uint8List? body,
  }) {
    final DateTime currentDateTime = DateTime.now();

    final int requestNumber = _nextRequestNumber++;
    final int requestTimestamp = currentDateTime.millisecondsSinceEpoch;

    return Request(
      serviceNo,
      requestNumber,
      requestTimestamp,
      body: body,
    );
  }

  FrameMessage _buildChanneledRequestMessage(final FrameChanneledRequestMessage requestMessage,) {
    return FrameMessage(
      channeled: FrameChanneledMessage(
        channel: identifier,
        request: requestMessage,
      ),
    );
  }

  Future<void> requestWithCallback(
    final FrameChanneledRequestMessage_ServiceNo serviceNo,
    final PendingCallbackRequestSuccessCallback successCallback,
    final PendingCallbackRequestErrorCallback errorCallback, {
    final Uint8List? body,
  }) async {
    // Builds the request to send.
    final Request request = _buildRequest(
      serviceNo,
      body: body,
    );

    // Adds the request with the given callbacks.
    _pendingRequests.addRequestWithCallback(
      request,
      successCallback,
      errorCallback,
    );

    // Builds the request message and sends it.
    final FrameChanneledRequestMessage requestMessage = request.encode();
    await client.sendFrame(_buildChanneledRequestMessage(requestMessage));
  }

  Future<Uint8List?> request(
    final FrameChanneledRequestMessage_ServiceNo serviceNo, {
    final Uint8List? body,
  }) async {
    // Builds the request to send.
    final Request request = _buildRequest(
      serviceNo,
      body: body,
    );

    // Adds the request and gets the completer.
    final Completer<Response> responseCompleter =
      _pendingRequests.addRequestWithCompleter(request);

    // Builds the request message and sends it.
    final FrameChanneledRequestMessage requestMessage = request.encode();
    await client.sendFrame(_buildChanneledRequestMessage(requestMessage));

    // Waits for the response, and throws the server error if present.
    final Response response = await responseCompleter.future;
    if (response.hasError()) {
      throw response.error;
    }

    // Returns the (maybe null) response body.
    return response.body;
  }

  /// Closes the channel due to the loss of connection.
  void closeDueToConnectionLoss() {
    _pendingRequests.endAllRequestWithError(const RequestError(
      RequestErrorType.connectionLost,
    ));
  }
}
