import 'package:flutter/material.dart' hide DatePickerDialog;
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class HolidayOptionsWidget extends StatelessWidget {
  final List<ScheduleHoliday> holidays;
  final DateTime scheduleStart;
  final DateTime scheduleEnd;
  final bool isDateInvalid;
  final bool isDuplicateInvalid;
  final void Function(int index, bool value) onTravelOnlyChanged;
  final void Function(int index, DateTime? value)
  onCompensatoryLeaveDateChanged;

  const HolidayOptionsWidget({
    super.key,
    required this.holidays,
    required this.scheduleStart,
    required this.scheduleEnd,
    required this.isDateInvalid,
    required this.isDuplicateInvalid,
    required this.onTravelOnlyChanged,
    required this.onCompensatoryLeaveDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Intl.message('schedule_form_holidays'),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8.0),
        ContentContainer(
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(8.0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: holidays.length,
            separatorBuilder: (_, _) => const Divider(height: 1.0),
            itemBuilder: (context, index) => _HolidayItem(
              holiday: holidays[index],
              unavailableDates: _unavailableDatesFor(index),
              onTravelOnlyChanged: (value) => onTravelOnlyChanged(index, value),
              onCompensatoryLeaveDateChanged: (value) =>
                  onCompensatoryLeaveDateChanged(index, value),
            ),
          ),
        ),
        ValidationErrorMessage(
          visible: isDateInvalid,
          text: Intl.message('schedule_form_invalid_5'),
        ),
        ValidationErrorMessage(
          visible: isDuplicateInvalid,
          text: Intl.message('bad_request_compensatory_leave_date_duplicate'),
        ),
      ],
    );
  }

  Set<DateTime> _unavailableDatesFor(int index) => {
    for (
      var date = scheduleStart;
      !date.isAfter(scheduleEnd);
      date = DateTime(date.year, date.month, date.day + 1)
    )
      date,
    for (var otherIndex = 0; otherIndex < holidays.length; otherIndex++)
      if (otherIndex != index &&
          holidays[otherIndex].compensatoryLeaveDate != null)
        DateUtils.dateOnly(holidays[otherIndex].compensatoryLeaveDate!),
  };
}

class _HolidayItem extends StatelessWidget {
  final ScheduleHoliday holiday;
  final Set<DateTime> unavailableDates;
  final ValueChanged<bool> onTravelOnlyChanged;
  final ValueChanged<DateTime?> onCompensatoryLeaveDateChanged;

  const _HolidayItem({
    required this.holiday,
    required this.unavailableDates,
    required this.onTravelOnlyChanged,
    required this.onCompensatoryLeaveDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    final compensatoryLeaveDate = holiday.compensatoryLeaveDate;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            [
              DateFormat.yMMMd(Intl.getCurrentLocale()).format(holiday.date),
              if (holiday.name != null) holiday.name!,
            ].join(' · '),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8.0),
          AppToggleButton(
            alignButtonToEnd: true,
            value: holiday.isTravelOnly,
            onChanged: onTravelOnlyChanged,
            child: Text(Intl.message('schedule_form_travel_only')),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton.icon(
            onPressed: () => _selectDate(context),
            icon: const Icon(Symbols.event_rounded),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  compensatoryLeaveDate == null
                      ? Intl.message('schedule_form_compensatory_leave')
                      : DateFormat.yMMMd(
                          Intl.getCurrentLocale(),
                        ).format(compensatoryLeaveDate),
                ),
                const SizedBox(width: 8.0),
                if (compensatoryLeaveDate == null)
                  const Icon(Symbols.chevron_right_rounded)
                else
                  InkWell(
                    onTap: () => onCompensatoryLeaveDateChanged(null),
                    borderRadius: BorderRadius.circular(4.0),
                    child: const Icon(Symbols.close_rounded),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDialog<DateTime>(
      context: context,
      builder: (_) => DatePickerDialog(
        initialDate: holiday.compensatoryLeaveDate,
        minimumDate: DateUtils.dateOnly(DateTime.now()),
        selectableDatePredicate: (date) =>
            date.weekday != DateTime.saturday &&
            date.weekday != DateTime.sunday &&
            !unavailableDates.contains(DateUtils.dateOnly(date)),
        title: Intl.message('schedule_form_compensatory_leave'),
      ),
    );

    if (selectedDate != null) onCompensatoryLeaveDateChanged(selectedDate);
  }
}
