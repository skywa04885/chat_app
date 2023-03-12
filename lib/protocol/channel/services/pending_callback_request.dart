import 'package:lukerieff/protocol/channel/services/request_error.dart';
import 'package:lukerieff/protocol/channel/services/pending_request.dart';
import 'package:lukerieff/protocol/channel/services/response.dart';

typedef PendingCallbackRequestSuccessCallback = void Function(Response);
typedef PendingCallbackRequestErrorCallback = void Function(RequestError);

class PendingCallbackRequest extends PendingRequest {
  final PendingCallbackRequestSuccessCallback successCallback;
  final PendingCallbackRequestErrorCallback errorCallback;
  
  PendingCallbackRequest(super.request, this.successCallback, this.errorCallback);

  @override
  void onResponse(final Response response) {
    successCallback(response);
  }

  @override
  void onError(final RequestError requestError) {
    errorCallback(requestError);
  }
}