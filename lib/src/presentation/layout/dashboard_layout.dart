import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class DashboardLayout extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardLayout({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final path = GoRouter.of(context).routerDelegate.state.matchedLocation;

    return Scaffold(
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              titleTextStyle: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
              leading: Functions(context).canPop(path)
                  ? CustomIconButton(
                      onTap: () {
                        context.pop(context);
                      },
                      icon: Icon(Symbols.chevron_left_rounded),
                    )
                  : null,
              title: Text(Intl.message(GoRouter.of(context).name)),
            )
          : null,
      drawer: !Responsive.isDesktop(context)
          ? DashboardDrawer(navigationShell: navigationShell)
          : null,
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            DashboardDrawer(navigationShell: navigationShell),
          VerticalDivider(),
          Flexible(child: navigationShell),
        ],
      ),
    );
  }
}
