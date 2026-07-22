part of '../controller.dart';

@freezed
abstract class ScheduleListState with _$ScheduleListState {
  factory ScheduleListState({
    @Default([]) List<ScheduleGroup> items,
    @Default(false) bool hasNext,
    @Default(false) bool hasPrevious,
    required DateTime start,
    required DateTime end,
  }) = _ScheduleListState;
}

extension ScheduleListStateExtension on ScheduleListState {
  List<Schedule> get flattenedItems {
    final seenIds = <int>{};
    final flattenedItems = <Schedule>[];

    for (final group in items) {
      for (final schedule in group.items) {
        if (seenIds.add(schedule.id)) {
          flattenedItems.add(schedule);
        }
      }
    }

    return flattenedItems..sort((a, b) {
      final start = a.start.compareTo(b.start);
      return start == 0 ? a.id.compareTo(b.id) : start;
    });
  }
}
