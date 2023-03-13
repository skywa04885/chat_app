import 'package:flutter/material.dart';
import 'package:lukerieff/services/user_service/user_service_search_response.dart';

class UserSearchScreenResultsHead extends StatelessWidget {
  final UserServiceSearchResponse searchResponse;

  const UserSearchScreenResultsHead({
    Key? key,
    required this.searchResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: 8.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Icon(
              Icons.query_builder,
              size: 16.0,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Text(
                "Found ${searchResponse.entries.length} ${searchResponse.entries.length == 1 ? "result" : "results"}"
                " in ${searchResponse.queryDuration.inMilliseconds} milliseconds.",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
