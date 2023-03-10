import 'package:lukerieff/networking/protocol/channel/services/pending_request.dart';
import 'package:lukerieff/networking/protocol/channel/services/response.dart';

typedef PendingCallbackRequestCallback = void Function(Response);

class PendingCallbackRequest extends PendingRequest {
  final PendingCallbackRequestCallback callback;

  const PendingCallbackRequest(super.request, this.callback);

  @override
  void onResponse(final Response response) {
    callback(response);
  }

}