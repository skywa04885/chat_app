import 'dart:async';

import 'package:logger/logger.dart';
import 'package:lukerieff/protocol/channel/services/pending_callback_request.dart';
import 'package:lukerieff/protocol/channel/services/pending_completer_request.dart';
import 'package:lukerieff/protocol/channel/services/pending_request.dart';
import 'package:lukerieff/protocol/channel/services/request.dart';
import 'package:lukerieff/protocol/channel/services/request_error.dart';
import 'package:lukerieff/protocol/channel/services/request_error_type.dart';
import 'package:lukerieff/protocol/channel/services/response.dart';

class PendingRequests {
  static const Duration defaultTimeoutDuration = Duration(seconds: 2);
  static final Logger logger = Logger();

  final Map<int, PendingRequest> _pending = {};

  /// Adds the pending request to the map and creates the timer timeout.
  void _add(
    final PendingRequest pendingRequest,
    final Duration timeoutDuration,
  ) {
    assert(!_pending.containsKey(pendingRequest.request.reqNo));
    logger.d(
        "Adding pending request with request number ${pendingRequest.request.reqNo}"
        " for service ${pendingRequest.request.serviceNo} and timing out in $timeoutDuration."
        " A total of ${_pending.length + 1} will be pending after.");

    // Adds the pending request to the map.
    _pending[pendingRequest.request.reqNo] = pendingRequest;

    // Creates the timeout timer for the pending request. This timer will trigger
    //  the callback once the request took a significant amount of time.
    pendingRequest.timeoutTimer = Timer(timeoutDuration, () {
      logger.d(
          "Pending request with request number ${pendingRequest.request.reqNo}"
          " for service ${pendingRequest.request.serviceNo} timed out"
          " after $timeoutDuration.");

      // Sends the timeout error to the pending request.
      pendingRequest.onError(RequestError(
        RequestErrorType.responseTimeout,
        message: "Request (${pendingRequest.request.reqNo}) timed out "
            "after $timeoutDuration",
      ));

      // Removes the request from the map of pending requests.
      _pending.remove(pendingRequest.request.reqNo);
    });
  }

  /// Adds a new completer pending request.
  Completer<Response> addRequestWithCompleter(
    final Request request, {
    final Duration timeoutDuration = defaultTimeoutDuration,
  }) {
    logger.d(
        "Adding new completer pending request with request number ${request.reqNo}"
        "for service ${request.serviceNo} and timing out in $timeoutDuration");

    // Creates the new completer pending request.
    final PendingCompleterRequest pendingRequest =
        PendingCompleterRequest(request);

    // Adds the pending request.
    _add(pendingRequest, timeoutDuration);

    // Returns the completer from the pending request.
    return pendingRequest.completer;
  }

  /// Adds a new callback completing request./**/
  void addRequestWithCallback(
    final Request request,
    final PendingCallbackRequestSuccessCallback successCallback,
    final PendingCallbackRequestErrorCallback errorCallback, {
    final Duration timeoutDuration = defaultTimeoutDuration,
  }) {
    logger.d(
        "Adding new callback pending request with request number ${request.reqNo}"
        "for service ${request.serviceNo} and timing out in $timeoutDuration");

    // Creates the new callback pending request.
    final PendingCallbackRequest pendingRequest =
        PendingCallbackRequest(request, successCallback, errorCallback);

    // Adds the pending request.
    _add(pendingRequest, timeoutDuration);
  }

  /// Ends all the requests with the given error.
  void endAllRequestWithError(final RequestError requestError) {
    logger.d(
        "Ending ${_pending.length} pending requests with error $requestError}");

    // Loops over all the pending requests and triggers errors for each.
    for (final PendingRequest pendingRequest in _pending.values) {
      assert(pendingRequest.hasTimeoutTimer());

      // Cancels the timeout timer.
      pendingRequest.timeoutTimer.cancel();

      // Sends the error to the pending request.
      pendingRequest.onError(requestError);
    }

    _pending.clear();
  }

  /// Gets called once a response has been received for one of the requests.
  void onResponse(final Response response) {
    logger.d("Received response for request with number ${response.reqNo}");

    // Gets the pending request associated with the response number.
    //  if not found, log an error, and ignore the response.
    final PendingRequest? pendingRequest = _pending[response.reqNo];
    if (pendingRequest == null) {
      logger.wtf(
          "Received response for non-pending request of number ${response.reqNo}");

      return;
    }

    // Cancels the timeout timer in the pending request.
    assert(pendingRequest.hasTimeoutTimer());
    pendingRequest.timeoutTimer.cancel();

    // Calls the onResponse method inside the pending request to complete it.
    pendingRequest.onResponse(response);

    // Removes the pending request
    _pending.remove(response.reqNo);
  }
}
