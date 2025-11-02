import 'package:flutter/material.dart' hide DateRangePickerDialog;
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/widget/new_project_button.dart';
import 'package:taskflow/src/presentation/screen/project_detail/widget/new_trip_button.dart';
import 'package:taskflow/src/presentation/screen/project_detail/widget/new_issue_button.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/dialog.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class BranchLayout extends ConsumerWidget {
  final Widget child;
  final Widget? title;
  final Function()? onTap;

  const BranchLayout({
    super.key,
    required this.child,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final dateSelection = ref.watch(dateSelectionControllerProvider);

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
                    top: 36.0, left: 24.0, bottom: 10.0, right: 24.0),
                child: Row(
                  children: [
                    if (context.canPop())
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: CustomIconButton(
                          onTap: onTap ?? () => context.pop(),
                          icon: Icon(
                            Symbols.chevron_left,
                            size: 24.0,
                          ),
                        ),
                      ),
                    Expanded(
                      child: DefaultTextStyle(
                        style: textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        child: title != null
                            ? title!
                            : Text(
                                Intl.message(GoRouter.of(context).name),
                              ),
                      ),
                    ),
                    if (GoRouter.of(context).name == RouteNames.dashboard)
                      ElevatedButton(
                        onPressed: () async {
                          final result = await showDialog(
                            context: context,
                            builder: (_) => DateRangePickerDialog(
                              startDate: dateSelection.start,
                              endDate: dateSelection.end,
                            ),
                          );

                          if (result != null) {
                            final startDate = result['start'] as DateTime;
                            final endDate = result['end'] as DateTime;

                            ref
                                .read(dateSelectionControllerProvider.notifier)
                                .dataSelectionChange(
                                    start: startDate, end: endDate);
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 4.0),
                            Text(
                                '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(dateSelection.start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(dateSelection.end)}'),
                            SizedBox(width: 4.0),
                            Icon(Symbols.expand_more_rounded),
                          ],
                        ),
                      ),
                    if (GoRouter.of(context).name == RouteNames.project)
                      NewProjectButton(),
                    if (GoRouter.of(context).name == RouteNames.projectDetail)
                      Row(
                        children: [
                          NewTripButton(),
                          SizedBox(width: 8.0),
                          NewIssueButton(),
                        ],
                      ),
                  ],
                ),
              ),
            Flexible(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
