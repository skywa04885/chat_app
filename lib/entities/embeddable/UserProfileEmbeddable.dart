import 'package:lukerieff/entities/messages/user_messages.pb.dart';

class UserProfileEmbeddable {
  String? _fullName;
  String? _status;

  UserProfileEmbeddable({
    String? fullName,
    String? status,
  }) {
    _fullName = fullName;
    _status = status;
  }

  bool hasFullName() {
    return _fullName != null;
  }

  String get fullName {
    return _fullName!;
  }

  set fullName(final String? fullName) {
    _fullName = fullName;
  }

  bool hasStatus() {
    return _status != null;
  }

  String get status {
    return _status!;
  }

  set status(final String? status) {
    _status = status;
  }

  static UserProfileEmbeddable decode(
    final UserMessage_ProfileMessage profileMessage,
  ) {
    return UserProfileEmbeddable(
      fullName: profileMessage.hasFullName() ? profileMessage.fullName : null,
      status: profileMessage.hasStatus() ? profileMessage.status : null,
    );
  }
}
