import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class UserAdminToggleDialog extends StatelessWidget {
  const UserAdminToggleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BaseDialog(
      title: Intl.message('setting_user_admin_dialog_1'),
      content: Text(Intl.message('setting_user_admin_dialog_2')),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(false),
          child: Text(
            Intl.message('common_cancel'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        ElevatedButton(
          onPressed: () => context.pop(true),
          style: ElevatedButton.styleFrom(
            foregroundColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primary,
          ),
          child: Text(
            Intl.message('common_apply'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
