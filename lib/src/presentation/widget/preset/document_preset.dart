part of '../widget.dart';

enum DocumentSort {
  recent('recent', 'document_sort_2', Symbols.schedule_rounded),
  title('title', 'document_sort_1', Symbols.sort_by_alpha_rounded);

  final String key;
  final String labelKey;
  final IconData icon;

  const DocumentSort(this.key, this.labelKey, this.icon);

  String get label => Intl.message(labelKey);

  factory DocumentSort.fromKey(String key) => DocumentSort.values.firstWhere(
    (e) => e.key == key,
    orElse: () => DocumentSort.recent,
  );
}
