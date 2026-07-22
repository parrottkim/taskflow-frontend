import 'package:flutter/material.dart' hide DateRangePickerDialog;
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class DateRangeSelectWidget extends ConsumerWidget {
  const DateRangeSelectWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(workReportFilterControllerProvider);

    return ElevatedButton.icon(
      onPressed: () async {
        final result = await showDialog(
          context: context,
          builder: (_) => DateRangePickerDialog(
            startDate: filter.start,
            endDate: filter.end,
          ),
        );

        if (result != null) {
          final startDate = result['start'] as DateTime;
          final endDate = result['end'] as DateTime;

          ref
              .read(workReportFilterControllerProvider.notifier)
              .setDateRange(start: startDate, end: endDate);

          context.goNamed(
            RouteNames.work,
            queryParameters: context.buildQueryParameters(
              updates: {
                'start': DateFormat('yyyy-MM-dd').format(startDate),
                'end': DateFormat('yyyy-MM-dd').format(endDate),
              },
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 12.0,
          top: 16.0,
          bottom: 16.0,
        ),
      ),
      icon: Icon(Symbols.date_range_rounded),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (filter.start == null || filter.end == null)
            Text(Intl.message('schedule_form_date_select'))
          else
            Text(
              '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(filter.start!)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(filter.end!)}',
            ),
          SizedBox(width: 8.0),
          if (filter.start == null && filter.end == null)
            Icon(Symbols.chevron_right_rounded)
          else
            InkWell(
              onTap: () {
                ref
                    .read(workReportFilterControllerProvider.notifier)
                    .setDateRange(start: null, end: null);

                context.goNamed(
                  RouteNames.work,
                  queryParameters: context.buildQueryParameters(
                    updates: {'start': null, 'end': null},
                  ),
                );
              },
              borderRadius: BorderRadius.circular(4.0),
              child: const Icon(Symbols.close_rounded),
            ),
        ],
      ),
    );
  }
}
