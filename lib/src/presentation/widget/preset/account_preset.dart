part of '../widget.dart';

enum AccountSegment {
  user('user', 'account_segment_1');

  final String key;
  final String labelKey;

  const AccountSegment(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory AccountSegment.fromKey(String key) => AccountSegment.values
      .firstWhere((e) => e.key == key, orElse: () => AccountSegment.user);
}
