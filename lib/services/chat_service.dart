import 'dart:typed_data';

import 'package:lukerieff/global_client.dart';
import 'package:lukerieff/protocol/channel.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pbenum.dart';
import 'package:lukerieff/services/messages/chat_service_messages.pbserver.dart';

class ChatService {
  static Future<void> newDirect(final int otherUserId) async {
    final GlobalClient globalClient = GlobalClient();
    final Channel primaryChannel =
        globalClient.client.getChannelByIdentifier(0)!;

    final C2SChatServiceNewDirectRequestMessage requestMessage =
        C2SChatServiceNewDirectRequestMessage(otherUserId: otherUserId);
    final Uint8List requestMessageBuffer = requestMessage.writeToBuffer();

    final Uint8List? responseBody = await primaryChannel.request(
      FrameChanneledRequestMessage_ServiceNo.C2S_CHAT_SERVICE__NEW_DIRECT,
      body: requestMessageBuffer,
    );

    assert(responseBody == null);
  }
}
