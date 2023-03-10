import 'dart:async';

import 'package:lukerieff/networking/protocol/client/pending_command.dart';
import 'package:lukerieff/networking/protocol/client/replies/reply.dart';

class PendingCompleterCommand extends PendingCommand {
  final Completer<Reply> _completer = Completer<Reply>();

  PendingCompleterCommand(
    super.command,
  );

  Completer<Reply> get completer {
    return _completer;
  }

  Future<Reply> get future {
    return _completer.future;
  }

  @override
  void onReply(final Reply reply) {
    _completer.complete(reply);
  }
}
