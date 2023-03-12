import 'dart:async';

import 'package:lukerieff/protocol/client/pending_command.dart';
import 'package:lukerieff/protocol/client/replies/reply.dart';

class CommandManager {
  final Map<int, PendingCommand> _pending = {};

  void add(final PendingCommand pendingCommand) {
    if (_pending.containsKey(pendingCommand.command.commandNo)) {
      throw Exception("Cannot add pending command since the command number ${pendingCommand.command.commandNo} is already in use.");
    }

    _pending[pendingCommand.command.commandNo] = pendingCommand;
  }

  void onReply(final Reply reply) {
    final PendingCommand? pendingCommand = _pending[reply.commandNo];

    if (pendingCommand == null) {
      throw Exception("Cannot handle reply because there is no pending command.");
    }

    _pending.remove(reply.commandNo);

    pendingCommand.onReply(reply);
  }
}
