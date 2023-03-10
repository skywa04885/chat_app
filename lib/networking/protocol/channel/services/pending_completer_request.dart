import 'dart:async';

import 'package:lukerieff/networking/protocol/channel/services/pending_request.dart';
import 'package:lukerieff/networking/protocol/channel/services/response.dart';

class PendingCompleterRequest extends PendingRequest {
  final Completer<Response> _completer = Completer<Response>();

  PendingCompleterRequest(super.request);

  Completer<Response> get completer {
    return _completer;
  }

  Future<Response> get future {
    return _completer.future;
  }

  @override
  void onResponse(final Response response) {
    _completer.complete(response);
  }
}