import 'package:flutter/material.dart';
import 'package:lukerieff/entities/UserEntity.dart';
import 'package:lukerieff/providers/me_provider.dart';
import 'package:lukerieff/screen/main/profile_screen.dart';
import 'package:lukerieff/widgets/main/root_screen/root_screen_drawer/root_screen_drawer_list_tile.dart';
import 'package:lukerieff/widgets/shared/account_picture.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

class RootScreenDrawer extends StatefulWidget {
  const RootScreenDrawer({Key? key}) : super(key: key);

  @override
  State<RootScreenDrawer> createState() => _RootScreenDrawerState();
}

class _RootScreenDrawerState extends State<RootScreenDrawer> {
  void _onAboutPressed() {
    showAboutDialog(
      context: context,
      applicationName: 'Hannah & Luke chat',
    );
  }

  Future<void> _onDevelopmentPressed() async {
    Navigator.of(context).pushNamed("/main/development");
  }

  Future<void> _onProfilePressed() async {
    final UserEntity me = context.read<MeProvider>().me;

    final MaterialPageRoute<ProfileScreen> materialPageRoute =
        MaterialPageRoute<ProfileScreen>(builder: (final BuildContext context) {
      return ProfileScreen(me);
    });

    await Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    final UserEntity me = context.watch<MeProvider>().me;

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(me.profile.hasFullName() ? me.profile.fullName : "@${me.username}"),
            accountEmail: Text(me.email),
            currentAccountPicture: AccountPicture(
              name: me.username,
              size: 48.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            arrowColor: Theme.of(context).colorScheme.onPrimary,
          ),
          RootScreenDrawerListTile(
            onPressed: _onProfilePressed,
            iconData: Icons.account_circle_outlined,
            title: 'Profile',
            subtitle: 'Your current profile.',
          ),
          RootScreenDrawerListTile(
            onPressed: () {},
            iconData: Icons.logout,
            title: 'Sign out',
            subtitle: 'Remove the currently JWT token.',
          ),
          const Divider(),
          RootScreenDrawerListTile(
            onPressed: () {},
            iconData: Icons.settings_applications,
            title: 'Settings',
            subtitle: 'Modifier the behavior of the app.',
          ),
          RootScreenDrawerListTile(
            onPressed: _onDevelopmentPressed,
            iconData: Icons.developer_board,
            title: 'Development',
            subtitle: 'Exposes the workings of the app.',
          ),
          const Divider(),
          RootScreenDrawerListTile(
            onPressed: _onAboutPressed,
            iconData: Icons.info_outline,
            title: 'About',
            subtitle: 'General information about the app',
          ),
        ],
      ),
    );
  }
}
