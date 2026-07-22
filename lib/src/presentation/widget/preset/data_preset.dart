part of '../widget.dart';

enum DataSegment {
  user('user', 'data_segment_1'),
  supplier('supplier', 'data_segment_2');

  final String key;
  final String labelKey;

  const DataSegment(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory DataSegment.fromKey(String key) => DataSegment.values.firstWhere(
    (e) => e.key == key,
    orElse: () => DataSegment.user,
  );
}
