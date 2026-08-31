part of '../widget.dart';

enum WorkSection {
  project('project', 'work_segment_1'),
  issue('issue', 'work_segment_2'),
  report('report', 'work_segment_3');

  final String key;
  final String labelKey;

  const WorkSection(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory WorkSection.fromKey(String key) => WorkSection.values.firstWhere(
    (e) => e.key == key,
    orElse: () => WorkSection.project,
  );
}

enum WorkProjectStatus {
  preexecuted('preexecuted', 'project_segment_2'),
  active('active', 'project_segment_3'),
  closed('closed', 'project_segment_4');

  final String key;
  final String labelKey;

  const WorkProjectStatus(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory WorkProjectStatus.fromProject(ProjectListItem project) {
    if (project.isClosed) return WorkProjectStatus.closed;
    if (project.isPreexecuted) return WorkProjectStatus.preexecuted;
    return WorkProjectStatus.active;
  }

  factory WorkProjectStatus.fromKey(String key) => WorkProjectStatus.values
      .firstWhere((e) => e.key == key, orElse: () => WorkProjectStatus.active);
}

enum WorkProjectSortOption {
  updated('updated', 'work_project_sort_1'),
  created('created', 'work_project_sort_2'),
  code('code', 'work_project_sort_3'),
  name('name', 'work_project_sort_4');

  final String key;
  final String labelKey;

  const WorkProjectSortOption(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory WorkProjectSortOption.formKey(String key) =>
      WorkProjectSortOption.values.firstWhere(
        (e) => e.key == key,
        orElse: () => WorkProjectSortOption.updated,
      );
}

enum WorkIssueSortOption {
  updated('updated', 'work_issue_sort_1'),
  created('created', 'work_issue_sort_2'),
  category('category', 'work_issue_sort_3');

  final String key;
  final String labelKey;

  const WorkIssueSortOption(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory WorkIssueSortOption.fromKey(String key) =>
      WorkIssueSortOption.values.firstWhere(
        (e) => e.key == key,
        orElse: () => WorkIssueSortOption.updated,
      );
}

enum WorkReportSortOption {
  updated('updated', 'work_report_sort_1'),
  created('created', 'work_report_sort_2'),
  category('category', 'work_report_sort_3'),
  schedule('schedule', 'work_report_sort_4');

  final String key;
  final String labelKey;

  const WorkReportSortOption(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory WorkReportSortOption.fromKey(String key) =>
      WorkReportSortOption.values.firstWhere(
        (e) => e.key == key,
        orElse: () => WorkReportSortOption.updated,
      );
}
