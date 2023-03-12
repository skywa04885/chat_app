import 'package:lukerieff/services/messages/user_service_messages.pb.dart';

class UserServiceSearchResponseEntry {
  final int id;
  final String username;
  final String email;
  final String? fullName;

  const UserServiceSearchResponseEntry(
    this.id,
    this.username,
    this.email, {
    this.fullName,
  });

  static UserServiceSearchResponseEntry decode(final SearchResponseMessage_EntryMessage entry) {
    return UserServiceSearchResponseEntry(
      entry.id,
      entry.username,
      entry.email,
      fullName: entry.hasFullName() ? entry.fullName : null,
    );
  }
}
