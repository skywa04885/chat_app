import 'package:lukerieff/networking/protocol/channel/services/request.dart';
import 'package:lukerieff/networking/protocol/channel/services/response.dart';

abstract class PendingRequest {
  final Request request;

  const PendingRequest(this.request);

  void onResponse(final Response response);
}