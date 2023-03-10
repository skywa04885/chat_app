import 'package:lukerieff/networking/protocol/channel/services/pending_request.dart';
import 'package:lukerieff/networking/protocol/channel/services/response.dart';

class RequestManager {
  final Map<int, PendingRequest> _pending = {};

  void add(final PendingRequest pendingRequest) {
    if (_pending.containsKey(pendingRequest.request.reqNo)) {
      throw Exception("Cannot add request to request manager because the request number is already used.");
    }

    _pending[pendingRequest.request.reqNo] = pendingRequest;
  }

  void onResponse(final Response response) {
    final PendingRequest? pendingRequest = _pending[response.reqNo];

    if (pendingRequest == null) {
      throw Exception("Cannot handle response with reqNo ${response.reqNo} because it is not pending!");
    }

    _pending.remove(response.reqNo);

    pendingRequest.onResponse(response);
  }
}