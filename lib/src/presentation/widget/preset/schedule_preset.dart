part of '../widget.dart';

enum ScheduleSegment {
  timeline('timeline', 'schedule_segment_1'),
  mine('mine', 'schedule_segment_2');

  final String key;
  final String labelKey;

  const ScheduleSegment(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory ScheduleSegment.fromKey(String key) => ScheduleSegment.values
      .firstWhere((e) => e.key == key, orElse: () => ScheduleSegment.timeline);
}
