import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';

class IssueFormScope extends InheritedWidget {
  final int projectId;
  final int categoryId;
  final int? issueId;

  const IssueFormScope({
    super.key,
    required this.projectId,
    required this.categoryId,
    this.issueId,
    required super.child,
  });

  static IssueFormScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<IssueFormScope>();
    assert(scope != null, 'No IssueFormScope found in context');
    return scope!;
  }

  IssueFormController controller(WidgetRef ref) {
    return ref.read(
      issueFormControllerProvider(
        projectId: projectId,
        categoryId: categoryId,
        issueId: issueId,
      ).notifier,
    );
  }

  IssueFormScope wrap({required Widget child}) {
    return IssueFormScope(
      projectId: projectId,
      categoryId: categoryId,
      issueId: issueId,
      child: child,
    );
  }

  @override
  bool updateShouldNotify(IssueFormScope oldWidget) {
    return projectId != oldWidget.projectId ||
        categoryId != oldWidget.categoryId ||
        issueId != oldWidget.issueId;
  }
}
