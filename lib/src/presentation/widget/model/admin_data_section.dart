part of '../widget.dart';

enum AdminDataSection {
  user('user', 'data_segment_1'),
  supplier('supplier', 'data_segment_2');

  final String key;
  final String labelKey;

  const AdminDataSection(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory AdminDataSection.fromKey(String key) => AdminDataSection.values
      .firstWhere((e) => e.key == key, orElse: () => AdminDataSection.user);
}
