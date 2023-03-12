import 'package:lukerieff/protocol/client/pending_command.dart';
import 'package:lukerieff/protocol/client/replies/reply.dart';

typedef PendingCallbackCommandCallback = void Function(Reply);

class PendingCallbackCommand extends PendingCommand {
  final PendingCallbackCommandCallback _callback;

  const PendingCallbackCommand(
    super.command,
    this._callback,
  );

  @override
  void onReply(final Reply reply) {
    _callback(reply);
  }
}
