import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/trip_form/widget/schedule_selector_dialog.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ScheduleSelectorWidget extends HookConsumerWidget {
  final int projectId;
  final int? tripId;
  final Schedule? selectedSchedule;
  final DateTime? start;
  final DateTime? end;
  final ValueNotifier<bool> isScheduleInvalid;

  const ScheduleSelectorWidget({
    super.key,
    required this.projectId,
    this.tripId,
    this.selectedSchedule,
    this.start,
    this.end,
    required this.isScheduleInvalid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (selectedSchedule != null) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
      return null;
    }, [selectedSchedule]);

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        constraints: BoxConstraints(maxWidth: 430.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Intl.message('trip_form_schedule'),
              style:
                  textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: () {
                isScheduleInvalid.value = false;
                showDialog(
                  context: context,
                  builder: (_) => ScheduleSelectorDialog(
                    projectId: projectId,
                    tripId: tripId,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                    left: 16.0, right: 12.0, top: 16.0, bottom: 16.0),
              ),
              icon: Icon(Symbols.work_rounded),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(Intl.message('trip_form_schedule_search')),
                  SizedBox(width: 8.0),
                  Icon(Symbols.chevron_right_rounded)
                ],
              ),
            ),
            if (selectedSchedule != null)
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: ContainerWidget(
                  padding: EdgeInsets.all(12.0),
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizeTransition(
                    sizeFactor: CurvedAnimation(
                      parent: sizeController,
                      curve: Curves.easeInQuad,
                    ),
                    child: FadeTransition(
                      opacity: opacityController,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (selectedSchedule!.end
                                  .isBefore(DateTime.now()))
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Skeleton.unite(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 2.0),
                                      decoration: ShapeDecoration(
                                        shape: StadiumBorder(),
                                        color: colorScheme.error,
                                      ),
                                      child: Text(
                                        formatRelativeDate(
                                            selectedSchedule!.end),
                                        style: textTheme.labelMedium?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: colorScheme.onError,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              else if (selectedSchedule!.start
                                      .isBefore(DateTime.now()) &&
                                  selectedSchedule!.end.isAfter(DateTime.now()))
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Skeleton.unite(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 2.0),
                                      decoration: ShapeDecoration(
                                        shape: StadiumBorder(),
                                        color: colorScheme.primary,
                                      ),
                                      child: Text(
                                        Intl.message(
                                            'trip_form_schedule_in_progress'),
                                        style: textTheme.labelMedium?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: colorScheme.onPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              else
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Skeleton.unite(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 2.0),
                                      decoration: ShapeDecoration(
                                        shape: StadiumBorder(),
                                        color:
                                            colorScheme.surfaceContainerHighest,
                                      ),
                                      child: Text(
                                        Intl.message(
                                            'trip_form_schedule_scheduled'),
                                        style: textTheme.labelMedium?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Skeleton.unite(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 2.0),
                                  decoration: ShapeDecoration(
                                    shape: StadiumBorder(
                                      side: BorderSide(
                                        color: Functions(context)
                                            .generateColorFromId(
                                                selectedSchedule!.category.id),
                                      ),
                                    ),
                                    color: Functions(context)
                                        .generateColorFromId(
                                            selectedSchedule!.category.id)
                                        .withValues(alpha: 0.2),
                                  ),
                                  child: Text(
                                    selectedSchedule!.category.name,
                                    style: textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Functions(context)
                                          .generateColorFromId(
                                              selectedSchedule!.category.id),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(selectedSchedule!.start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(selectedSchedule!.end)}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            selectedSchedule!.summary,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                          Text(
                            selectedSchedule!.description == null ||
                                    selectedSchedule!.description!.isEmpty
                                ? Intl.message(
                                    'trip_form_schedule_description_empty')
                                : selectedSchedule!.description!,
                            maxLines: 1,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            InvalidWidget(
              visible: isScheduleInvalid.value,
              text: Intl.message('trip_form_invalid_1'),
            ),
          ],
        ),
      ),
    );
  }
}
