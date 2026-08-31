import 'package:flutter/material.dart' hide DateRangePickerDialog;
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class MobileDateRangeFilterWidget extends StatelessWidget {
  final ValueNotifier<DateTime?> selectedStartDate;
  final ValueNotifier<DateTime?> selectedEndDate;

  const MobileDateRangeFilterWidget({
    super.key,
    required this.selectedStartDate,
    required this.selectedEndDate,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final start = selectedStartDate.value;
    final end = selectedEndDate.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            Intl.message('schedule_form_date'),
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 8.0),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              final result = await showDialog<Map<String, DateTime>>(
                context: context,
                builder: (_) =>
                    DateRangePickerDialog(startDate: start, endDate: end),
              );

              if (result == null) return;

              selectedStartDate.value = result['start'];
              selectedEndDate.value = result['end'];
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 10.0,
                top: 6.0,
                bottom: 6.0,
              ),
              child: Row(
                children: [
                  Icon(
                    start == null || end == null
                        ? Symbols.calendar_today_rounded
                        : Symbols.event_available_rounded,
                    color: start == null || end == null
                        ? colorScheme.onSurface.strong
                        : colorScheme.onSurface,
                    size: 20.0,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: start == null || end == null
                        ? Text(Intl.message('schedule_form_date_select'))
                        : Text(
                            '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(end)}',
                          ),
                  ),
                  SizedBox(width: 8.0),
                  start == null && end == null
                      ? Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Symbols.chevron_right_rounded,
                            size: 20.0,
                            color: colorScheme.onSurface.strong,
                          ),
                        )
                      : AppIconButton(
                          onTap: () {
                            selectedStartDate.value = null;
                            selectedEndDate.value = null;
                          },
                          icon: const Icon(Symbols.close_rounded, size: 20.0),
                        ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
