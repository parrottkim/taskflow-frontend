part of '../widget.dart';

enum ScheduleSection {
  timeline('timeline', 'schedule_segment_1'),
  mine('mine', 'schedule_segment_2');

  final String key;
  final String labelKey;

  const ScheduleSection(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory ScheduleSection.fromKey(String key) => ScheduleSection.values
      .firstWhere((e) => e.key == key, orElse: () => ScheduleSection.timeline);
}
