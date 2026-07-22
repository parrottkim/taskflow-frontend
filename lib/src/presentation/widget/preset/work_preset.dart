part of '../widget.dart';

enum WorkSegment {
  project('project', 'work_segment_1'),
  issue('issue', 'work_segment_2'),
  report('report', 'work_segment_3');

  final String key;
  final String labelKey;

  const WorkSegment(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory WorkSegment.fromKey(String key) => WorkSegment.values.firstWhere(
    (e) => e.key == key,
    orElse: () => WorkSegment.project,
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

enum WorkProjectSort {
  updated('updated', 'work_project_sort_1'),
  created('created', 'work_project_sort_2'),
  code('code', 'work_project_sort_3'),
  name('name', 'work_project_sort_4');

  final String key;
  final String labelKey;

  const WorkProjectSort(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory WorkProjectSort.formKey(String key) => WorkProjectSort.values
      .firstWhere((e) => e.key == key, orElse: () => WorkProjectSort.updated);
}

enum WorkIssueSort {
  updated('updated', 'work_issue_sort_1'),
  created('created', 'work_issue_sort_2'),
  category('category', 'work_issue_sort_3');

  final String key;
  final String labelKey;

  const WorkIssueSort(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory WorkIssueSort.fromKey(String key) => WorkIssueSort.values.firstWhere(
    (e) => e.key == key,
    orElse: () => WorkIssueSort.updated,
  );
}

enum WorkReportSort {
  updated('updated', 'work_report_sort_1'),
  created('created', 'work_report_sort_2'),
  category('category', 'work_report_sort_3'),
  schedule('schedule', 'work_report_sort_4');

  final String key;
  final String labelKey;

  const WorkReportSort(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory WorkReportSort.fromKey(String key) => WorkReportSort.values
      .firstWhere((e) => e.key == key, orElse: () => WorkReportSort.updated);
}
