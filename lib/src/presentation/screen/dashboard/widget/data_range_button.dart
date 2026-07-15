import 'package:flutter/material.dart' hide DateRangePickerDialog;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DateRangeButton extends ConsumerWidget {
  const DateRangeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateSelection = ref.watch(dateSelectionControllerProvider);

    return ElevatedButton(
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
              .dataSelectionChange(start: startDate, end: endDate);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 4.0),
          Text(
            '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(dateSelection.start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(dateSelection.end)}',
          ),
          SizedBox(width: 4.0),
          Icon(Symbols.expand_more_rounded),
        ],
      ),
    );
  }
}
