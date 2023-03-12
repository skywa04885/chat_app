import 'dart:typed_data';

import 'package:lukerieff/datatypes/pair.dart';
import 'package:lukerieff/entities/UserEntity.dart';
import 'package:lukerieff/entities/messages/user_messages.pb.dart';
import 'package:lukerieff/global_client.dart';
import 'package:lukerieff/protocol/channel.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';
import 'package:lukerieff/services/messages/user_service_messages.pb.dart';
import 'package:lukerieff/services/user_service/user_service_search_response.dart';
import 'package:lukerieff/services/user_service/user_service_search_response/user_service_search_response_entry.dart';

class UserService {
  static Future<UserEntity> me() async {
    final GlobalClient globalClient = GlobalClient();
    final Channel primaryChannel = globalClient.client.getChannelByIdentifier(0)!;

    final Uint8List? responseBody = await primaryChannel.request(
      FrameChanneledRequestMessage_ServiceNo.C2S_USER_SERVICE__ME,
    );

    final MeResponseMessage meResponse =
        MeResponseMessage.fromBuffer(responseBody!);

    final UserMessage userMessage = meResponse.user;
    final UserEntity userEntity = UserEntity.decode(userMessage);

    return userEntity;
  }

  static Future<UserServiceSearchResponse> search(
    final String searchQuery,
    final int limit,
  ) async {
    final GlobalClient globalClient = GlobalClient();
    final Channel primaryChannel = globalClient.client.getChannelByIdentifier(0)!;

    final SearchRequestMessage searchRequest = SearchRequestMessage(
      searchQuery: searchQuery,
      limit: limit,
    );

    final Uint8List searchRequestBuffer = searchRequest.writeToBuffer();

    final Uint8List? responseBody = await primaryChannel.request(
      FrameChanneledRequestMessage_ServiceNo.C2S_USER_SERVICE__SEARCH,
      body: searchRequestBuffer,
    );

    final SearchResponseMessage responseMessage =
        SearchResponseMessage.fromBuffer(responseBody!);

    return UserServiceSearchResponse.decode(responseMessage);
  }
}
