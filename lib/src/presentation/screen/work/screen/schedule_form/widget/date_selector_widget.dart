import 'package:flutter/material.dart' hide DateRangePickerDialog;
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DateSelectorWidget extends ConsumerWidget {
  final DateTime? start;
  final DateTime? end;

  const DateSelectorWidget({super.key, this.start, this.end});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final categoryId = int.parse(state.uri.queryParameters['category']!);
    final scheduleId = int.tryParse(state.pathParameters['schedule_id'] ?? '');

    return ElevatedButton.icon(
      onPressed: () async {
        final result = await showDialog(
          context: context,
          builder: (_) => DateRangePickerDialog(startDate: start, endDate: end),
        );

        if (result != null) {
          final startDate = result['start'] as DateTime;
          final endDate = result['end'] as DateTime;

          ref
              .read(
                scheduleFormControllerProvider(
                  categoryId: categoryId,
                  scheduleId: scheduleId,
                ).notifier,
              )
              .setDate(start: startDate, end: endDate);
        }
      },
      icon: Icon(Symbols.date_range_rounded),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (start == null || end == null)
            Text(Intl.message('schedule_form_date_select'))
          else
            Text(
              '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(start!)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(end!)}',
            ),
          SizedBox(width: 8.0),
          if (start == null && end == null)
            Icon(Symbols.chevron_right_rounded)
          else
            InkWell(
              onTap: () {
                ref
                    .read(
                      scheduleFormControllerProvider(
                        categoryId: categoryId,
                        scheduleId: scheduleId,
                      ).notifier,
                    )
                    .setDate(start: null, end: null);
              },
              borderRadius: BorderRadius.circular(4.0),
              child: const Icon(Symbols.close_rounded),
            ),
        ],
      ),
    );
  }
}
