import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lukerieff/protocol/channel/services/request_error.dart';
import 'package:lukerieff/protocol/channel/services/request_error_type.dart';
import 'package:lukerieff/services/user_service.dart';
import 'package:lukerieff/services/user_service/user_service_search_response.dart';
import 'package:lukerieff/widgets/main/user_search_screen/user_search_screen_app_bar.dart';
import 'package:lukerieff/widgets/main/user_search_screen/user_search_screen_initial_card.dart';
import 'package:lukerieff/widgets/main/user_search_screen/user_search_screen_results_list.dart';
import 'package:lukerieff/widgets/main/user_search_screen/user_search_screen_results_head.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({Key? key}) : super(key: key);

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  UserServiceSearchResponse? _searchResponse;
  bool _loading = false;

  /// Gets called once a search query has to be performed.
  Future<void> _onSearchQuery(String query) async {
    setState(() {
      _loading = true;
    });

    try {
      final UserServiceSearchResponse searchResponse =
          await UserService.search(query, 100);

      setState(() {
        _searchResponse = searchResponse;
        _loading = false;
      });
    } on RequestError catch (requestError) {
      if (!mounted) return;

      showDialog(
        context: context,
        builder: (final BuildContext context) {
          return AlertDialog(
            icon: const Icon(Icons.error_outline),
            title: Text(requestError.type.description),
          );
        },
      );

      setState(() => _loading = false);
    }
  }

  /// Gets called once a user has been pressed.
  Future<void> _onUserPressed(final int userId) async  {
    await HapticFeedback.vibrate();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pop<int>(userId);
    });
  }

  /// Builds the slivers.
  List<Widget> _buildSlivers() {
    List<Widget> slivers = [
      UserSearchScreenAppBar(
        loading: _loading,
        onSearchQuery: _onSearchQuery,
      ),
    ];

    if (_searchResponse == null) {
      slivers.add(const UserSearchScreenInitialCard());
    } else {
      slivers.addAll([
        UserSearchScreenResultsHead(
          searchResponse: _searchResponse!,
        ),
        UserSearchScreenResultsList(
          entries: _searchResponse?.entries ?? [],
          onUserPressed: _onUserPressed,
        ),
      ]);
    }

    return slivers;
  }

  /// Builds the user search screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: _buildSlivers(),
      ),
    );
  }
}
