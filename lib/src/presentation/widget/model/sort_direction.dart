part of '../widget.dart';

enum SortDirection {
  asc('asc', Symbols.arrow_drop_up_rounded, 'filter_ascending'),
  desc('desc', Symbols.arrow_drop_down_rounded, 'filter_descending');

  final String key;
  final IconData icon;
  final String labelKey;

  const SortDirection(this.key, this.icon, this.labelKey);

  String get label => Intl.message(labelKey);

  factory SortDirection.fromKey(String key) {
    return SortDirection.values.firstWhere(
      (order) => order.key == key,
      orElse: () => SortDirection.asc,
    );
  }

  SortDirection get toggled =>
      this == SortDirection.asc ? SortDirection.desc : SortDirection.asc;
}
