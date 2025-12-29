import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_category/widget/schedule_selector_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ScheduleSelectorWidget extends HookConsumerWidget {
  final int projectId;
  final int? reportId;
  final Schedule? schedule;
  final ValueNotifier<bool> isScheduleInvalid;

  const ScheduleSelectorWidget({
    super.key,
    required this.projectId,
    this.reportId,
    this.schedule,
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
      if (schedule != null) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
      return null;
    }, [schedule]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Intl.message('report_form_schedule'),
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8.0),
        Skeleton.unite(
          child: ElevatedButton.icon(
            onPressed: () {
              isScheduleInvalid.value = false;
              showDialog(
                context: context,
                builder: (_) => ScheduleSelectorDialog(
                  projectId: projectId,
                  reportId: reportId,
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
                Text(Intl.message('report_form_schedule_search')),
                SizedBox(width: 8.0),
                Icon(Symbols.chevron_right_rounded)
              ],
            ),
          ),
        ),
        SizedBox(height: 24.0),
        CustomTextButton(
          onPressed: () {
            final path = GoRouter.of(context).location();

            context.pushNamed(RouteNames.scheduleNewChoose, queryParameters: {
              'redirect_to': path,
            });
          },
          text: Intl.message('report_form_schedule_add'),
        ),
        if (schedule != null)
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
                          if (schedule!.end.isBefore(DateTime.now()))
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
                                    formatRelativeDate(schedule!.end),
                                    style: textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colorScheme.onError,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else if (schedule!.start.isBefore(DateTime.now()) &&
                              schedule!.end.isAfter(DateTime.now()))
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
                                        'report_form_schedule_in_progress'),
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
                                    color: colorScheme.surfaceContainerHighest,
                                  ),
                                  child: Text(
                                    Intl.message(
                                        'report_form_schedule_scheduled'),
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
                                            schedule!.category.id),
                                  ),
                                ),
                                color: Functions(context)
                                    .generateColorFromId(schedule!.category.id)
                                    .withValues(alpha: 0.2),
                              ),
                              child: Text(
                                schedule!.category.name,
                                style: textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Functions(context).generateColorFromId(
                                      schedule!.category.id),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule!.start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule!.end)}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        schedule!.summary,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                      Text(
                        schedule!.description == null ||
                                schedule!.description!.isEmpty
                            ? Intl.message(
                                'report_form_schedule_description_empty')
                            : schedule!.description!,
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
      ],
    );
  }
}
