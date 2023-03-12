import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lukerieff/widgets/main/root_screen/root_screen_modal_bottom_sheet/root_screen_modal_bottom_sheet_item.dart';
import 'package:lukerieff/widgets/main/root_screen/root_screen_modal_bottom_sheet/root_screen_modal_bottom_sheet_title.dart';

class RootScreenModalBottomSheet extends StatelessWidget {
  const RootScreenModalBottomSheet({Key? key}) : super(key: key);

  Future<void> _onDirectCreatePressed(final BuildContext context) async {
    await HapticFeedback.vibrate();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Navigator.of(context).pop();

      await Navigator.of(context).pushNamed("/main/chats/create/direct");
    });
  }

  Future<void> _onGroupCreatePressed(final BuildContext context) async {
    await HapticFeedback.vibrate();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const RootScreenModalBottomSheetTitle(
          title: 'Create new chat',
        ),
        RootScreenModalBottomSheetItem(
          onPressed: () => _onDirectCreatePressed(context),
          title: 'Direct',
          subtitle: 'Private chat with one other person.',
          iconData: Icons.person_add,
        ),
        RootScreenModalBottomSheetItem(
          onPressed: () => _onGroupCreatePressed(context),
          title: 'Group',
          subtitle: 'Public chat with multiple people.',
          iconData: Icons.group_add,
        )
      ],
    );
  }
}
