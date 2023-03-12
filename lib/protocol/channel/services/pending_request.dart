import 'dart:async';

import 'package:lukerieff/protocol/channel/services/request.dart';
import 'package:lukerieff/protocol/channel/services/request_error.dart';
import 'package:lukerieff/protocol/channel/services/response.dart';

abstract class PendingRequest {
  final Request request;
  Timer? _timeoutTimer;

  PendingRequest(this.request);

  Timer get timeoutTimer {
    return _timeoutTimer!;
  }
  
  set timeoutTimer(final Timer? timeoutTimer) {
    _timeoutTimer = timeoutTimer;
  }

  bool hasTimeoutTimer() {
    return _timeoutTimer != null;
  }
  
  void onResponse(final Response response);

  void onError(final RequestError requestError);
}