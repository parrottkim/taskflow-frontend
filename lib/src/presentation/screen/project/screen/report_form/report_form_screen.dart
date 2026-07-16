import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/progress_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/report_form_section.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/core/core.dart';

class ReportFormScreen extends HookConsumerWidget {
  final int projectId;
  final int? reportId;
  final int? scheduleId;

  const ReportFormScreen({
    super.key,
    required this.projectId,
    this.reportId,
    this.scheduleId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
      reportFormControllerProvider(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
      ),
    );

    return switch (form) {
      AsyncData(:final value) => _DesktopWidget(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
        value: value,
      ),
      AsyncError(:final error, :final stackTrace) => BranchLayout(
        child: ErrorContainerWidget(error: error, stackTrace: stackTrace),
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          projectId: projectId,
          reportId: reportId,
          scheduleId: scheduleId,
          value: ReportFormState(schedule: Schedule.dummy()),
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int projectId;
  final int? reportId;
  final int? scheduleId;
  final ReportFormState value;

  const _DesktopWidget({
    required this.projectId,
    this.reportId,
    this.scheduleId,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final steps = value.steps;

    final currentIndex = useState(0);
    final currentStep = steps[currentIndex.value];
    final isLastStep = currentIndex.value == steps.length - 1;

    final editorState = useMemoized(() {
      return value.content == null
          ? EditorState.blank(withInitialText: true)
          : EditorState(document: markdownToDocument(value.content!));
    }, []);

    ref.listen(reportSubmitControllerProvider, (_, state) {
      if (state is ReportSubmitPending) {
        LoadingOverlay.show(context);
        return;
      }

      LoadingOverlay.hide();

      switch (state) {
        case ReportSubmitCreated(:final report) ||
            ReportSubmitUpdated(:final report):
          final isCreated = state is ReportSubmitCreated;

          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message(
                    isCreated ? 'report_form_created' : 'report_form_updated',
                  ),
                ),
              );

          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': projectId.toString()},
            queryParameters: {'view': 'report', 'report': report.id.toString()},
          );

        case ReportSubmitDeleted():
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('report_form_deleted'),
                ),
              );
          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': projectId.toString()},
          );

        default:
          break;
      }
    });

    return BranchLayout(
      title: Text(
        Intl.message(
          value.schedule == null ||
                  value.schedule is! ScheduleDomestic ||
                  value.schedule is! ScheduleOverseas
              ? 'report_form_title'
              : 'report_form_title_${value.schedule!.category.id}',
        ),
      ),
      onTap: () {
        if (steps.length > 1 && isLastStep) {
          if (ref.watch(reportValidationControllerProvider).contentInvalid) {
            return;
          }
        }
        if (currentIndex.value > 0) {
          final isAllValid = ref
              .read(reportValidationControllerProvider.notifier)
              .isValid();

          if (!isAllValid) {
            return;
          }

          currentIndex.value = currentIndex.value - 1;
        } else {
          context.pop();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (value.hasTripSchedule)
                  ProgressWidget(
                    currentIndex: currentIndex.value,
                    steps: steps,
                  ),
                Expanded(
                  child: ReportFormSection(
                    projectId: projectId,
                    reportId: reportId,
                    scheduleId: scheduleId,
                    step: currentStep,
                    value: value,
                    editorState: editorState,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 16.0,
              bottom: 32.0,
            ),
            constraints: BoxConstraints(maxWidth: 430.0),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () async {
                      ref
                          .read(reportValidationControllerProvider.notifier)
                          .setContentValid(editorState.document.isEmpty);

                      // Update validation status from current form data
                      ref
                          .read(reportValidationControllerProvider.notifier)
                          .updateAllValidationStatus(
                            projectId: projectId,
                            reportId: reportId,
                            scheduleId: scheduleId,
                          );

                      // If validation fails, navigate to the first invalid step (if available)
                      final isAllValid = ref
                          .read(reportValidationControllerProvider.notifier)
                          .isValid();

                      if (!isAllValid) {
                        return;
                      }

                      // All valid — proceed to next step or submit
                      if (isLastStep) {
                        if (ref
                            .watch(reportValidationControllerProvider)
                            .contentInvalid) {
                          return;
                        }

                        if (reportId == null) {
                          ref
                              .read(reportSubmitControllerProvider.notifier)
                              .createReport(
                                projectId: projectId,
                                scheduleId: scheduleId,
                                editorState: editorState,
                              );
                          return;
                        } else {
                          ref
                              .read(reportSubmitControllerProvider.notifier)
                              .updateReport(
                                projectId: projectId,
                                reportId: reportId!,
                                scheduleId: scheduleId,
                                editorState: editorState,
                              );
                          return;
                        }
                      } else {
                        // 다음 단계로 이동
                        currentIndex.value = currentIndex.value + 1;
                      }
                    },
                    child: Text(
                      isLastStep
                          ? reportId == null
                                ? Intl.message('common_post')
                                : Intl.message('common_edit')
                          : Intl.message('common_next'),
                    ),
                  ),
                ),
                if (reportId != null)
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: FilledButton(
                      onPressed: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (_) => DeleteDialog(
                            title: Intl.message('report_form_delete_dialog_1'),
                            content: Intl.message(
                              'report_form_delete_dialog_2',
                            ),
                          ),
                        );

                        if (result) {
                          await ref
                              .read(reportSubmitControllerProvider.notifier)
                              .deleteReport(
                                projectId: projectId,
                                reportId: reportId!,
                              );
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.error,
                        iconColor: colorScheme.onError,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(Symbols.delete_rounded, size: 19.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
