part of '../widget.dart';

enum ProjectStatusFilter {
  all('all', 'project_segment_1'),
  preexecuted('preexecuted', 'project_segment_2'),
  active('active', 'project_segment_3'),
  closed('closed', 'project_segment_4');

  final String key;
  final String labelKey;

  const ProjectStatusFilter(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory ProjectStatusFilter.fromKey(String key) => ProjectStatusFilter.values
      .firstWhere((e) => e.key == key, orElse: () => ProjectStatusFilter.all);
}

enum ProjectSortOption {
  updated('update', 'project_sort_1'),
  created('created', 'project_sort_2'),
  code('code', 'project_sort_3'),
  name('name', 'project_sort_4');

  final String key;
  final String labelKey;

  const ProjectSortOption(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory ProjectSortOption.fromKey(String key) => ProjectSortOption.values
      .firstWhere((e) => e.key == key, orElse: () => ProjectSortOption.updated);
}

enum ProjectDetailTab {
  contract('contract', 'project_detail_segment_1'),
  approval('approval', 'project_detail_segment_2'),
  procurement('procurement', 'project_detail_segment_3'),
  report('report', 'project_detail_segment_4'),
  timeline('timeline', 'project_detail_segment_5');

  final String key;
  final String labelKey;

  const ProjectDetailTab(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory ProjectDetailTab.fromKey(String key) => ProjectDetailTab.values
      .firstWhere((e) => e.key == key, orElse: () => ProjectDetailTab.contract);
}
