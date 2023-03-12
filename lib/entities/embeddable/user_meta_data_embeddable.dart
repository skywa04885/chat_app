import 'package:lukerieff/entities/messages/user_messages.pb.dart';

class UserMetaDataEmbeddable {
  final DateTime creationDate;

  UserMetaDataEmbeddable(this.creationDate);

  static UserMetaDataEmbeddable decode(
    final UserMessage_MetaDataMessage metaDataMessage,
  ) {
    return UserMetaDataEmbeddable(
      DateTime.fromMillisecondsSinceEpoch(metaDataMessage.creationDate.toInt()),
    );
  }
}
