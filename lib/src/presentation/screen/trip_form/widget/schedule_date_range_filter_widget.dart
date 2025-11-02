import 'package:flutter/material.dart' hide DateRangePickerDialog;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/dialog.dart';

class ScheduleDateRangeFilterWidget extends HookConsumerWidget {
  const ScheduleDateRangeFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = useState<DateTime?>(null);
    final endDate = useState<DateTime?>(null);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: ElevatedButton.icon(
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (_) => DateRangePickerDialog(
              startDate: startDate.value,
              endDate: endDate.value,
            ),
          );

          if (result != null) {
            startDate.value = result['start'] as DateTime;
            endDate.value = result['end'] as DateTime;

            ref
                .read(scheduleFilterControllerProvider.notifier)
                .setDateRange(start: startDate.value, end: endDate.value);
          }
        },
        icon: Icon(
          Symbols.date_range_rounded,
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (startDate.value == null || endDate.value == null)
              Text(
                Intl.message('schedule_form_date_select'),
              )
            else
              Text(
                  '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(startDate.value!)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(endDate.value!)}'),
            SizedBox(width: 8.0),
            if (startDate.value == null && endDate.value == null)
              Icon(
                Symbols.chevron_right_rounded,
              )
            else
              InkWell(
                onTap: () {
                  startDate.value = null;
                  endDate.value = null;

                  ref
                      .read(scheduleFilterControllerProvider.notifier)
                      .setDateRange(start: startDate.value, end: endDate.value);
                },
                borderRadius: BorderRadius.circular(4.0),
                child: const Icon(Symbols.close_rounded),
              ),
          ],
        ),
      ),
    );
  }
}
