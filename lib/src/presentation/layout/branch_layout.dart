import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class BranchLayout extends StatelessWidget {
  final Widget child;
  final Widget? title;
  final List<Widget> actions;
  final Function()? onTap;

  const BranchLayout({
    super.key,
    required this.child,
    this.title,
    this.actions = const [],
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final route = ModalRoute.of(context);
    final routerState = GoRouterState.of(context);
    final currentRouteName = route?.settings.name ?? routerState.name ?? '';
    final canPopRoute = route?.canPop ?? false;

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        constraints: BoxConstraints(minHeight: constraints.maxHeight),
        color: colorScheme.surfaceContainerLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Container(
                padding: const EdgeInsets.only(
                  top: 36.0,
                  left: 24.0,
                  bottom: 10.0,
                  right: 24.0,
                ),
                child: Row(
                  children: [
                    if (canPopRoute)
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: CustomIconButton(
                          onTap: onTap ?? () => context.pop(),
                          icon: Icon(Symbols.chevron_left, size: 24.0),
                        ),
                      ),
                    Expanded(
                      child: DefaultTextStyle(
                        style: textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        child: title != null
                            ? title!
                            : Text(Intl.message(currentRouteName)),
                      ),
                    ),
                    ...actions,
                  ],
                ),
              ),
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}
