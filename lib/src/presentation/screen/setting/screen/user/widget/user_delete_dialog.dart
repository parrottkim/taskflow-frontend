import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class UserDeleteDialog extends StatelessWidget {
  const UserDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BaseDialog(
      title: Intl.message('setting_user_delete_dialog_1'),
      content: ContainerWidget(
        borderRadius: BorderRadius.circular(8.0),
        color: colorScheme.errorContainer,
        borderColor: colorScheme.error,
        child: Row(
          children: [
            Icon(Symbols.warning_rounded, size: 20.0, color: colorScheme.error),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                Intl.message('setting_user_delete_dialog_2'),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.error,
                ),
              ),
            ),
          ],
        ),
      ),
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
            foregroundColor: colorScheme.onError,
            backgroundColor: colorScheme.error,
          ),
          child: Text(
            Intl.message('common_delete'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
