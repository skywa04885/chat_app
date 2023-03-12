import 'package:lukerieff/services/messages/user_service_messages.pb.dart';
import 'package:lukerieff/services/user_service/user_service_search_response/user_service_search_response_entry.dart';

class UserServiceSearchResponse {
  final Duration queryDuration;
  final List<UserServiceSearchResponseEntry> entries;

  const UserServiceSearchResponse(
    this.queryDuration,
    this.entries,
  );

  static UserServiceSearchResponse decode(
    final SearchResponseMessage responseMessage,
  ) {
    final Duration queryDuration = Duration(
      milliseconds: responseMessage.queryTime.toInt(),
    );

    final List<UserServiceSearchResponseEntry> entries = responseMessage.entries
        .map((final SearchResponseMessage_EntryMessage entry) =>
            UserServiceSearchResponseEntry.decode(entry))
        .toList();

    return UserServiceSearchResponse(queryDuration, entries);
  }
}
