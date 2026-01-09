import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:super_editor/super_editor.dart';
import 'package:super_editor_markdown/super_editor_markdown.dart';
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

  const ReportFormScreen({
    super.key,
    required this.projectId,
    this.reportId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
        reportFormControllerProvider(projectId: projectId, reportId: reportId));

    return switch (form) {
      AsyncData(:final value) => _DesktopWidget(
          projectId: projectId,
          reportId: reportId,
          value: value,
        ),
      AsyncError(:final error, :final stackTrace) =>
        ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(
          child: _DesktopWidget(
            projectId: projectId,
            value: ReportFormState(
              steps: [
                'transportation',
                'local_transportation',
                'accommodation',
                'daily_expense',
                'other',
                'content',
              ],
              schedule: Schedule.dummy(),
            ),
          ),
        ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int projectId;
  final int? reportId;
  final ReportFormState value;

  const _DesktopWidget({
    required this.projectId,
    this.reportId,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final currentIndex = useState(0);
    final currentStep = value.steps[currentIndex.value];
    final isLastStep = currentIndex.value == value.steps.length - 1;

    ref.listen(reportSubmitControllerProvider, (_, state) {
      if (state is ReportSubmitPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();

        if (state is ReportSubmitSuccess) {
          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {
              'project_id': projectId.toString(),
            },
            queryParameters: {
              'view': 'report',
              'report': state.report.id.toString(),
            },
          );
        }

        if (state is ReportSubmitDeleted) {
          ref.read(toastProvider).showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('report_form_delete'),
                ),
              );
          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {
              'project_id': projectId.toString(),
            },
          );
        }
      }
    });

    final document = useRef(value.content == null
            ? MutableDocument(
                nodes: [
                  ParagraphNode(
                    id: Editor.createNodeId(),
                    text: AttributedText(''),
                  ),
                ],
              )
            : deserializeMarkdownToDocument(value.content!))
        .value;

    return BranchLayout(
      title: Text(Intl.message(value.schedule == null ||
              value.schedule is! ScheduleDomestic ||
              value.schedule is! ScheduleOverseas
          ? 'report_form_title'
          : 'report_form_title_${value.schedule!.category.id}')),
      onTap: () {
        if (value.steps.length > 1 && isLastStep) {
          ref
              .read(reportFormControllerProvider(projectId: projectId).notifier)
              .serializeAndSetContent(document: document);

          if (ref.watch(reportValidationControllerProvider).contentInvalid) {
            return;
          }
        }
        if (currentIndex.value > 0) {
          final isAllValid =
              ref.read(reportValidationControllerProvider.notifier).isValid();

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
                if (value.schedule != null &&
                    (value.schedule!.category is ScheduleDomestic ||
                        value.schedule!.category is ScheduleOverseas))
                  ProgressWidget(
                    currentIndex: currentIndex.value,
                    steps: value.steps,
                  ),
                Expanded(
                  child: ReportFormSection(
                    step: currentStep,
                    projectId: projectId,
                    reportId: reportId,
                    value: value,
                    document: document,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(
                left: 24.0, right: 24.0, top: 16.0, bottom: 32.0),
            constraints: BoxConstraints(maxWidth: 430.0),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () async {
                      // Update validation status from current form data
                      ref
                          .read(reportValidationControllerProvider.notifier)
                          .updateAllValidationStatus(
                              projectId: projectId, reportId: reportId);

                      // If validation fails, navigate to the first invalid step (if available)
                      final isAllValid = ref
                          .read(reportValidationControllerProvider.notifier)
                          .isValid();

                      if (!isAllValid) {
                        return;
                      }

                      // All valid — proceed to next step or submit
                      if (isLastStep) {
                        await ref
                            .read(reportFormControllerProvider(
                                    projectId: projectId, reportId: reportId)
                                .notifier)
                            .serializeAndSetContent(document: document);

                        if (ref
                            .watch(reportValidationControllerProvider)
                            .contentInvalid) {
                          return;
                        }

                        if (reportId == null) {
                          ref
                              .read(reportSubmitControllerProvider.notifier)
                              .createReport(projectId: projectId);
                          return;
                        } else {
                          ref
                              .read(reportSubmitControllerProvider.notifier)
                              .updateReport(
                                  projectId: projectId, reportId: reportId!);
                          return;
                        }
                      } else {
                        // 다음 단계로 이동
                        currentIndex.value = currentIndex.value + 1;
                      }

                      // Additional per-step checks (legacy/extra guards)
                      // final form = await ref.watch(
                      //     reportFormControllerProvider(
                      //             projectId: projectId, reportId: reportId)
                      //         .future);

                      // if (step == 'transportation') {
                      //   if (form.expenses.any((item) =>
                      //       item.price == null || item.price!.isEmpty)) {
                      //     return;
                      //   }
                      // }
                      // if (step == 'local_transportation') {
                      //   if (form.expenses.any((item) =>
                      //       item.price == null || item.price!.isEmpty)) {
                      //     return;
                      //   }
                      // }
                    },
                    child: Text(isLastStep
                        ? reportId == null
                            ? Intl.message('common_post')
                            : Intl.message('common_edit')
                        : Intl.message('common_next')),
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
                            content:
                                Intl.message('report_form_delete_dialog_2'),
                          ),
                        );

                        if (result) {
                          await ref
                              .read(reportSubmitControllerProvider.notifier)
                              .deleteReport(
                                  projectId: projectId, reportId: reportId!);
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.error,
                        iconColor: colorScheme.onError,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(
                          Symbols.delete_rounded,
                          size: 19.0,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
