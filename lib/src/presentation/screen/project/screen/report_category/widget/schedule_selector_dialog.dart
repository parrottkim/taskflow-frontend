import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_category/widget/schedule_list_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ScheduleSelectorDialog extends HookConsumerWidget {
  final int projectId;
  final ValueNotifier<Schedule?> selectedSchedule;
  final DateTime? start;
  final DateTime? end;

  const ScheduleSelectorDialog({
    super.key,
    required this.projectId,
    required this.selectedSchedule,
    this.start,
    this.end,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final auth = ref.watch(authControllerProvider);

    if (auth is! AuthAuthenticated) {
      return const SizedBox.shrink();
    }

    final userId = auth.user.id;

    final schedule = ref.watch(
      scheduleListControllerProvider(
        scope: ScheduleFilterScope.scheduleSelectorDialog,
        projectId: projectId,
        userId: userId,
      ),
    );

    final searchController = useTextEditingController();

    return Dialog(
      child: ContainerWidget(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(8.0),
        constraints: BoxConstraints(maxWidth: 430.0, maxHeight: 600.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: Intl.message('report_form_schedule_search'),
                contentPadding: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 14.0),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 2.0),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 20.0,
                    height: 20.0,
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSurface.withValues(alpha: 0.7),
                      BlendMode.srcIn,
                    ),
                    semanticsLabel: 'Search Icon',
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              onChanged: (value) => ref
                  .read(
                    scheduleFilterControllerProvider(
                      ScheduleFilterScope.scheduleSelectorDialog,
                    ).notifier,
                  )
                  .setSearch(search: value),
            ),
            Divider(),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16.0),
                  ),
                ),
                child: switch (schedule) {
                  AsyncData(:final value) => ScheduleListWidget(
                    projectId: projectId,
                    scope: ScheduleFilterScope.scheduleSelectorDialog,
                    userId: userId,
                    selectedSchedule: selectedSchedule,
                    items: value.items,
                    hasNext: value.hasNext,
                    hasPrevious: value.hasPrevious,
                  ),
                  AsyncError(:final error, :final stackTrace) =>
                    ErrorContainerWidget(error: error, stackTrace: stackTrace),
                  _ => Skeletonizer(
                    child: ScheduleListWidget(
                      projectId: projectId,
                      scope: ScheduleFilterScope.scheduleSelectorDialog,
                      userId: userId,
                      selectedSchedule: selectedSchedule,
                      items: List.filled(30, ScheduleGroup.dummy()),
                    ),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
