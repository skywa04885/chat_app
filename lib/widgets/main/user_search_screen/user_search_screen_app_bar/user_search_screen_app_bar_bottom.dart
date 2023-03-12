import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/main/user_search_screen/user_search_screen_app_bar/user_search_screen_app_bar_bottom/user_search_screen_app_bar_bottom_form.dart';

class UserSearchScreenAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  static const double _linearProgressIndicatorHeight = 4.0;

  final void Function(String) onSearchQuery;
  final bool loading;

  const UserSearchScreenAppBarBottom({
    Key? key,
    required this.onSearchQuery,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 16.0 - _linearProgressIndicatorHeight,
          ),
          child: UserSearchAppBarBottomForm(
            onSearchQuery: onSearchQuery,
            loading: loading,
          ),
        ),
        SizedBox(
          height: _linearProgressIndicatorHeight,
          child: Visibility(
            visible: loading,
            child: LinearProgressIndicator(
              color: Theme.of(context).colorScheme.onBackground,
              backgroundColor:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120.0);
}
