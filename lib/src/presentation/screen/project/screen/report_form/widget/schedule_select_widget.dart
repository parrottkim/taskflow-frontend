import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/schedule_select_dialog.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/report_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ScheduleSelectWidget extends HookWidget {
  final Schedule? schedule;
  final ValueNotifier<bool> isScheduleInvalid;
  final ValueChanged<Schedule> onSelected;

  const ScheduleSelectWidget({
    super.key,
    required this.schedule,
    required this.isScheduleInvalid,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final projectId = ReportFormScope.of(context).projectId;
    useListenable(isScheduleInvalid);

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
            onPressed: () async {
              final selected = await showDialog<Schedule>(
                context: context,
                builder: (_) => ScheduleSelectDialog(projectId: projectId),
              );

              if (selected == null) return;

              isScheduleInvalid.value = false;
              onSelected(selected);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 12.0,
                top: 16.0,
                bottom: 16.0,
              ),
            ),
            icon: Icon(Symbols.work_rounded),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(Intl.message('report_form_schedule_search')),
                SizedBox(width: 8.0),
                Icon(Symbols.chevron_right_rounded),
              ],
            ),
          ),
        ),
        ValidationErrorMessage(
          visible: isScheduleInvalid.value,
          text: Intl.message('report_form_invalid_1'),
        ),
        if (schedule != null)
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: sizeController,
                curve: Curves.easeInQuad,
              ),
              child: FadeTransition(
                opacity: opacityController,
                child: ScheduleSummaryCard(schedule: schedule!),
              ),
            ),
          ),
      ],
    );
  }
}
