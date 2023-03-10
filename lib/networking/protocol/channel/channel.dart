import 'package:fixnum/fixnum.dart';
import 'dart:typed_data';

import 'package:lukerieff/networking/protocol/channel/events/event.dart';
import 'package:lukerieff/networking/protocol/channel/events/event_listeners.dart';
import 'package:lukerieff/networking/protocol/channel/services/pending_callback_request.dart';
import 'package:lukerieff/networking/protocol/channel/services/pending_completer_request.dart';
import 'package:lukerieff/networking/protocol/channel/services/request.dart';
import 'package:lukerieff/networking/protocol/channel/services/request_manager.dart';
import 'package:lukerieff/networking/protocol/channel/services/response.dart';
import 'package:lukerieff/networking/protocol/client/client.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class Channel {
  final Client client;
  final int identifier;
  final EventListeners _eventListeners = EventListeners();
  final RequestManager _requestManager = RequestManager();

  /// Constructs a new channel.
  Channel(
    this.client,
    this.identifier,
  );

  /// Handles a new event message.
  void _onEventMessage(final Frame_Channeled_Event eventMsg) {
    // Decodes the event.
    final Event event = Event.decode(eventMsg);

    // Emits the event.
    _eventListeners.onEvent(event);
  }

  /// Handles a new request message.
  void _onRequestMessage(final Frame_Channeled_Request requestMsg) {}

  /// Handles a new response message.
  void _onResponseMessage(final Frame_Channeled_Response responseMsg) {
    final Response response = Response.decode(responseMsg);

    _requestManager.onResponse(response);
  }

  /// Handles a new channeled message.
  void onChanneledMessage(final Frame_Channeled channeledMsg) {
    switch (channeledMsg.whichChild()) {
      case Frame_Channeled_Child.event:
        _onEventMessage(channeledMsg.event);
        break;
      case Frame_Channeled_Child.request:
        _onRequestMessage(channeledMsg.request);
        break;
      case Frame_Channeled_Child.response:
        _onResponseMessage(channeledMsg.response);
        break;
      case Frame_Channeled_Child.notSet:
        break;
    }
  }

  /// Emits the given event.
  Future<void> emit(final Event event) async {
    // Sends the event frame.
    await client.sendFrame(
      Frame(
        channeled: Frame_Channeled(
          channel: identifier,
          event: event.encode(),
        ),
      ),
    );
  }

  /// Sends a callback request and calls the callback once the response has been received.
  Future<void> requestWithCallback(
    final Request request,
    final PendingCallbackRequestCallback callback,
  ) async {
    // Constructs the pending request.
    final PendingCallbackRequest pendingCallbackRequest =
        PendingCallbackRequest(request, callback);

    // Adds the pending request to the manager.
    _requestManager.add(pendingCallbackRequest);

    // Sends the request frame.
    await client.sendFrame(
      Frame(
        channeled: Frame_Channeled(
          channel: identifier,
          request: request.encode(),
        ),
      ),
    );
  }

  /// Sends a completer request and returns the future of the completer.
  Future<Response> request(
    final Request request,
  ) async {
    // Constructs the pending request.
    final PendingCompleterRequest pendingCompleterRequest =
        PendingCompleterRequest(request);

    // Adds the pending request to the manager.
    _requestManager.add(pendingCompleterRequest);

    // Writes the request frame.
    await client.sendFrame(
      Frame(
        channeled: Frame_Channeled(
          channel: identifier,
          request: request.encode(),
        ),
      ),
    );

    // Returns the future.
    return pendingCompleterRequest.future;
  }
}
