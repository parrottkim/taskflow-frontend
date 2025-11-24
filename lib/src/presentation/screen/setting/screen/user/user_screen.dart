import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.all(24.0),
        constraints: BoxConstraints(maxWidth: 430.0),
        child: switch (auth) {
          AuthAuthenticated(:final user) => _DesktopWidget(user: user),
          _ => Skeletonizer(
              child: _DesktopWidget(user: User.dummy()),
            ),
        },
      ),
    );
  }
}

class _DesktopWidget extends ConsumerWidget {
  final User user;

  const _DesktopWidget({
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ContainerWidget(
          elevation: 0.0,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor:
                    Functions(context).generateColorFromId(user.id),
                radius: 32.0,
              ),
              SizedBox(width: 16.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    user.position?.name ?? '',
                    style: TextStyle(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  Text(
                    user.department?.name ?? '',
                    style: TextStyle(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        SizedBox(
          width: double.infinity,
          child: Skeleton.unite(
            child: ElevatedButton.icon(
              onPressed: () {
                ref.read(authControllerProvider.notifier).logout();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: colorScheme.error,
                iconColor: colorScheme.error,
              ),
              icon: Icon(Symbols.logout_rounded),
              label: Text(
                Intl.message('logout'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
