import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ScheduleListItemWidget extends ConsumerWidget {
  const ScheduleListItemWidget({
    super.key,
    required this.schedule,
    required this.isPast,
    required this.selectedSchedule,
  });

  final Schedule schedule;
  final bool isPast;
  final ValueNotifier<Schedule?> selectedSchedule;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final isReported = schedule.reportId != null;
    final categoryColor = Functions(
      context,
    ).generateColorFromId(schedule.category.id);

    final period =
        '${DateFormat('MM/dd').format(schedule.start)}'
        ' - '
        '${DateFormat('MM/dd').format(schedule.end)}';

    void openEditPage() {
      context.pushNamed(
        RouteNames.scheduleEdit,
        pathParameters: {'schedule_id': schedule.id.toString()},
        queryParameters: {'category': schedule.category.id.toString()},
      );
    }

    Future<void> deleteSchedule() async {
      final result = await showDialog<bool>(
        context: context,
        builder: (_) => DeleteDialog(
          title: Intl.message('schedule_form_delete_dialog_1'),
          content: Intl.message('schedule_form_delete_dialog_2'),
        ),
      );

      if (result != true || !context.mounted) {
        return;
      }

      await ref
          .read(scheduleSubmitControllerProvider.notifier)
          .deleteSchedule(scheduleId: schedule.id);

      if (selectedSchedule.value == schedule) {
        selectedSchedule.value = null;
      }
    }

    return ValueListenableBuilder<Schedule?>(
      valueListenable: selectedSchedule,
      builder: (context, selectedValue, child) {
        final isSelected = selectedValue == schedule;

        return Tooltip(
          message: isReported ? Intl.message('schedule_form_reported') : '',
          triggerMode: isReported
              ? TooltipTriggerMode.longPress
              : TooltipTriggerMode.manual,
          child: Stack(
            children: [
              InkWell(
                onTap: isReported
                    ? null
                    : () {
                        selectedSchedule.value = schedule;
                      },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 12.0,
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      Skeleton.unite(
                        child: Opacity(
                          opacity: isPast || isReported ? 0.4 : 1.0,
                          child: Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 2.0,
                            ),
                            decoration: ShapeDecoration(
                              shape: StadiumBorder(
                                side: BorderSide(color: categoryColor),
                              ),
                              color: categoryColor.subtle,
                            ),
                            child: Text(
                              schedule.category.name,
                              style: textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: categoryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                schedule.summary,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: isPast
                                      ? colorScheme.onSurface.muted
                                      : colorScheme.onSurface,
                                ),
                              ),
                            ),
                            if (isReported)
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Icon(
                                  Symbols.check_circle,
                                  fill: 1.0,
                                  size: 16.0,
                                  color: colorScheme.onSurface.muted,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          period,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.strong,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: !isSelected,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isSelected ? 1.0 : 0.0,
                    child: ColoredBox(
                      color: Colors.black87.subtle,
                      child: InkWell(
                        onTap: () {
                          selectedSchedule.value = null;
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Spacer(),
                              ElevatedIconButton(
                                onTap: isReported ? null : openEditPage,
                                padding: const EdgeInsets.all(4.0),
                                borderRadius: BorderRadius.circular(4.0),
                                icon: Symbols.edit_square_rounded,
                                size: 16.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: ElevatedIconButton(
                                  onTap: isReported ? null : deleteSchedule,
                                  padding: const EdgeInsets.all(4.0),
                                  borderRadius: BorderRadius.circular(4.0),
                                  icon: Symbols.delete_rounded,
                                  size: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
