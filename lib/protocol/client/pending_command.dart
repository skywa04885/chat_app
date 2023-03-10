import 'package:lukerieff/protocol/client/commands/command.dart';
import 'package:lukerieff/protocol/client/replies/reply.dart';

abstract class PendingCommand {
  final Command command;

  const PendingCommand(this.command);

  void onReply(final Reply reply);
}