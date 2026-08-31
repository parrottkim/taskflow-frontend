import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class DashboardLayout extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardLayout({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final path = GoRouter.of(context).routerDelegate.state.matchedLocation;
    final branch = navigationShell.route.branches[navigationShell.currentIndex];
    final rootRoute = branch.defaultRoute;

    final currentRouteName = navigationShell.currentRouteName;
    final isSubRoute = rootRoute != null && path != rootRoute.path;

    return Scaffold(
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              titleTextStyle: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
              leading: isSubRoute
                  ? AppIconButton(
                      onTap: () {
                        branch.navigatorKey.currentState?.maybePop();
                      },
                      icon: Icon(Symbols.chevron_left_rounded),
                    )
                  : null,
              title: Text(Intl.message(currentRouteName)),
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
