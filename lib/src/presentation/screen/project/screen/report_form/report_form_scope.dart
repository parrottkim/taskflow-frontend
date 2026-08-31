import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';

class ReportFormScope extends InheritedWidget {
  final int projectId;
  final int? reportId;
  final int? scheduleId;

  const ReportFormScope({
    super.key,
    required this.projectId,
    this.reportId,
    this.scheduleId,
    required super.child,
  });

  static ReportFormScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ReportFormScope>();
    assert(scope != null, 'No ReportFormScope found in context');
    return scope!;
  }

  ReportFormController controller(WidgetRef ref) {
    return ref.read(
      reportFormControllerProvider(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
      ).notifier,
    );
  }

  @override
  bool updateShouldNotify(ReportFormScope oldWidget) {
    return projectId != oldWidget.projectId ||
        reportId != oldWidget.reportId ||
        scheduleId != oldWidget.scheduleId;
  }
}
