part of '../widget.dart';

enum AccountSection {
  user('user', 'account_segment_1');

  final String key;
  final String labelKey;

  const AccountSection(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory AccountSection.fromKey(String key) => AccountSection.values
      .firstWhere((e) => e.key == key, orElse: () => AccountSection.user);
}
