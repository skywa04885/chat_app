import 'package:lukerieff/entities/embeddable/UserProfileEmbeddable.dart';
import 'package:lukerieff/entities/embeddable/user_meta_data_embeddable.dart';
import 'package:lukerieff/entities/messages/user_messages.pb.dart';

class UserEntity {
  final int id;
  String username;
  String email;
  UserMetaDataEmbeddable metaData;
  UserProfileEmbeddable profile;
  String? phone;

  UserEntity(
    this.id,
    this.username,
    this.email,
    this.metaData,
    this.profile, {
    this.phone,
  });

  static UserEntity decode(
    final UserMessage userMessage,
  ) {
    return UserEntity(
      userMessage.id,
      userMessage.username,
      userMessage.email,
      UserMetaDataEmbeddable.decode(userMessage.metadata),
      UserProfileEmbeddable.decode(userMessage.profile),
      phone: userMessage.hasPhone() ? userMessage.phone : null,
    );
  }
}
