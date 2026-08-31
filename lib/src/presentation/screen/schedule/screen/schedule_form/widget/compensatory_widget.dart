import 'package:flutter/material.dart' hide DatePickerDialog;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class CompensatoryWidget extends HookConsumerWidget {
  final int categoryId;
  final int? scheduleId;
  final DateTime? start;
  final DateTime? end;
  final bool showValidation;

  const CompensatoryWidget({
    super.key,
    required this.categoryId,
    this.scheduleId,
    this.start,
    this.end,
    this.showValidation = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = scheduleHolidayFormControllerProvider(
      categoryId: categoryId,
      scheduleId: scheduleId,
      start: start,
      end: end,
    );
    final form = ref.watch(provider);
    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );
    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );
    final today = DateUtils.dateOnly(DateTime.now());
    final scheduleStart = start == null ? null : DateUtils.dateOnly(start!);
    final scheduleEnd = end == null ? null : DateUtils.dateOnly(end!);
    final isVisible = switch (form) {
      AsyncData(:final value) => value.isNotEmpty,
      _ => false,
    };

    useEffect(() {
      if (isVisible && start != null && end != null) {
        opacityController.forward();
        sizeController.forward();
      } else {
        opacityController.reverse();
        sizeController.reverse();
      }

      return null;
    }, [isVisible]);

    return switch (form) {
      AsyncData(:final value) when value.isEmpty => const SizedBox.shrink(),
      AsyncData(:final value) => FadeTransition(
        opacity: CurvedAnimation(
          parent: opacityController,
          curve: Curves.easeOut,
        ),
        child: SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: sizeController,
            curve: Curves.easeOut,
          ),
          axisAlignment: -1.0,
          child: _DesktopWidget(
            items: value,
            onTravelOnlyChanged: (date, isTravelOnly) => ref
                .read(provider.notifier)
                .setTravelOnly(date: date, isTravelOnly: isTravelOnly),
            onCompensatoryLeaveDateChanged: (date, compensatoryLeaveDate) => ref
                .read(provider.notifier)
                .setCompensatoryLeaveDate(
                  date: date,
                  compensatoryLeaveDate: compensatoryLeaveDate,
                ),
            isDateInvalid:
                showValidation &&
                value.any(
                  (holiday) =>
                      holiday.compensatoryLeaveDate == null ||
                      DateUtils.dateOnly(
                        holiday.compensatoryLeaveDate!,
                      ).isBefore(today) ||
                      holiday.compensatoryLeaveDate!.weekday ==
                          DateTime.saturday ||
                      holiday.compensatoryLeaveDate!.weekday ==
                          DateTime.sunday ||
                      (scheduleStart != null &&
                          scheduleEnd != null &&
                          !DateUtils.dateOnly(
                            holiday.compensatoryLeaveDate!,
                          ).isBefore(scheduleStart) &&
                          !DateUtils.dateOnly(
                            holiday.compensatoryLeaveDate!,
                          ).isAfter(scheduleEnd)),
                ),
            isDuplicateInvalid:
                showValidation &&
                _hasDuplicateCompensatoryLeaveDates(
                  value.map((holiday) => holiday.compensatoryLeaveDate),
                ),
            scheduleStart: scheduleStart,
            scheduleEnd: scheduleEnd,
          ),
        ),
      ),
      AsyncError(:final error, :final stackTrace) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ErrorStateView(error: error, stackTrace: stackTrace),
      ),
      _ => const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: LinearProgressIndicator(),
      ),
    };
  }
}

class _DesktopWidget extends StatelessWidget {
  final List<ScheduleHolidayFormState> items;
  final void Function(DateTime date, bool isTravelOnly) onTravelOnlyChanged;
  final void Function(DateTime date, DateTime? compensatoryLeaveDate)
  onCompensatoryLeaveDateChanged;
  final bool isDateInvalid;
  final bool isDuplicateInvalid;
  final DateTime? scheduleStart;
  final DateTime? scheduleEnd;

  const _DesktopWidget({
    required this.items,
    required this.onTravelOnlyChanged,
    required this.onCompensatoryLeaveDateChanged,
    required this.isDateInvalid,
    required this.isDuplicateInvalid,
    required this.scheduleStart,
    required this.scheduleEnd,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intl.message('schedule_form_holidays'),
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          ContentContainer(
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(8.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (_, _) => const Divider(height: 1.0),
              itemBuilder: (context, index) {
                final item = items[index];
                final unavailableDates = <DateTime>{
                  if (scheduleStart != null && scheduleEnd != null)
                    for (
                      var date = scheduleStart!;
                      !date.isAfter(scheduleEnd!);
                      date = DateTime(date.year, date.month, date.day + 1)
                    )
                      date,
                  for (
                    var otherIndex = 0;
                    otherIndex < items.length;
                    otherIndex++
                  )
                    if (otherIndex != index &&
                        items[otherIndex].compensatoryLeaveDate != null)
                      DateUtils.dateOnly(
                        items[otherIndex].compensatoryLeaveDate!,
                      ),
                };

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        [
                          DateFormat.yMMMd(
                            Intl.getCurrentLocale(),
                          ).format(item.date),
                          if (item.name != null) item.name!,
                        ].join(' · '),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      AppToggleButton(
                        alignButtonToEnd: true,
                        value: item.isTravelOnly,
                        onChanged: (value) =>
                            onTravelOnlyChanged(item.date, value),
                        child: Text(Intl.message('schedule_form_travel_only')),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () async {
                              final selectedDate = await showDialog<DateTime>(
                                context: context,
                                builder: (_) => DatePickerDialog(
                                  initialDate: item.compensatoryLeaveDate,
                                  minimumDate: DateUtils.dateOnly(
                                    DateTime.now(),
                                  ),
                                  selectableDatePredicate: (date) =>
                                      date.weekday != DateTime.saturday &&
                                      date.weekday != DateTime.sunday &&
                                      !unavailableDates.contains(
                                        DateUtils.dateOnly(date),
                                      ),
                                  title: Intl.message(
                                    'schedule_form_compensatory_leave',
                                  ),
                                ),
                              );

                              if (selectedDate == null) return;

                              onCompensatoryLeaveDateChanged(
                                item.date,
                                selectedDate,
                              );
                            },
                            icon: const Icon(Symbols.event_rounded),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.compensatoryLeaveDate == null
                                      ? Intl.message(
                                          'schedule_form_compensatory_leave',
                                        )
                                      : DateFormat.yMMMd(
                                          Intl.getCurrentLocale(),
                                        ).format(item.compensatoryLeaveDate!),
                                ),
                                SizedBox(width: 8.0),
                                if (item.compensatoryLeaveDate == null)
                                  Icon(Symbols.chevron_right_rounded)
                                else
                                  InkWell(
                                    onTap: () {
                                      onCompensatoryLeaveDateChanged(
                                        item.date,
                                        null,
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: const Icon(Symbols.close_rounded),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
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
      ),
    );
  }
}

bool _hasDuplicateCompensatoryLeaveDates(Iterable<DateTime?> dates) {
  final normalizedDates = dates
      .whereType<DateTime>()
      .map(DateUtils.dateOnly)
      .toList();
  return normalizedDates.toSet().length != normalizedDates.length;
}
