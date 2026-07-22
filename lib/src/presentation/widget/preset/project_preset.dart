part of '../widget.dart';

enum ProjectSegment {
  all('all', 'project_segment_1'),
  preexecuted('preexecuted', 'project_segment_2'),
  active('active', 'project_segment_3'),
  closed('closed', 'project_segment_4');

  final String key;
  final String labelKey;

  const ProjectSegment(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory ProjectSegment.fromKey(String key) => ProjectSegment.values
      .firstWhere((e) => e.key == key, orElse: () => ProjectSegment.all);
}

enum ProjectSort {
  updated('update', 'project_sort_1'),
  created('created', 'project_sort_2'),
  code('code', 'project_sort_3'),
  name('name', 'project_sort_4');

  final String key;
  final String labelKey;

  const ProjectSort(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory ProjectSort.fromKey(String key) => ProjectSort.values.firstWhere(
    (e) => e.key == key,
    orElse: () => ProjectSort.updated,
  );
}

enum ProjectDetailSegment {
  contract('contract', 'project_detail_segment_1'),
  approval('approval', 'project_detail_segment_2'),
  procurement('procurement', 'project_detail_segment_3'),
  report('report', 'project_detail_segment_4'),
  timeline('timeline', 'project_detail_segment_5');

  final String key;
  final String labelKey;

  const ProjectDetailSegment(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory ProjectDetailSegment.fromKey(String key) =>
      ProjectDetailSegment.values.firstWhere(
        (e) => e.key == key,
        orElse: () => ProjectDetailSegment.contract,
      );
}
