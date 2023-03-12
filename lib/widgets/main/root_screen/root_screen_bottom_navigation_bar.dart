import 'package:flutter/material.dart';
import 'package:lukerieff/screen/main/root_screen.dart';

class RootScreenBottomNavigationBar extends StatelessWidget {
  final RootScreenSelectedPage page;
  final void Function(RootScreenSelectedPage) onPageSelected;

  const RootScreenBottomNavigationBar({
    Key? key,
    required this.page,
    required this.onPageSelected,
  }) : super(key: key);

  List<NavigationDestination> _buildDestinations() {
    return RootScreenSelectedPage.values
        .map((final RootScreenSelectedPage rootScreenPage) {
      return NavigationDestination(
        icon: Icon(rootScreenPage.icon),
        label: rootScreenPage.label,
      );
    }).toList();
  }

  void _onSelected(final int index) {
    final RootScreenSelectedPage page = RootScreenSelectedPage.values[index];

    onPageSelected(page);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: _onSelected,
      selectedIndex: page.index,
      destinations: _buildDestinations(),
    );
  }
}
