import 'dart:async';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/report_form_actions.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/report_form_scope.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/report_form_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class ReportFormScreen extends ConsumerWidget {
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
      AsyncData(:final value) => _ReportFormView(
        key: const ValueKey('report-form-loaded'),
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
        value: value,
      ),
      AsyncError(:final error, :final stackTrace) => BranchLayout(
        child: ErrorStateView(error: error, stackTrace: stackTrace),
      ),
      _ => Skeletonizer(
        ignoreContainers: true,
        child: _ReportFormView(
          key: const ValueKey('report-form-skeleton'),
          projectId: projectId,
          reportId: reportId,
          scheduleId: scheduleId,
          value: ReportFormState(schedule: Schedule.dummy()),
        ),
      ),
    };
  }
}

class _ReportFormView extends ConsumerStatefulWidget {
  final int projectId;
  final int? reportId;
  final int? scheduleId;
  final ReportFormState value;

  const _ReportFormView({
    super.key,
    required this.projectId,
    this.reportId,
    this.scheduleId,
    required this.value,
  });

  @override
  ConsumerState<_ReportFormView> createState() => _ReportFormViewState();
}

class _ReportFormViewState extends ConsumerState<_ReportFormView> {
  late int _currentIndex;
  late EditorState _editorState;
  late final ValueNotifier<bool> _isScheduleInvalid;
  late final AppLifecycleListener _appLifecycleListener;

  bool get _hasScheduleStep => widget.reportId == null;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.reportId == null && widget.scheduleId != null
        ? 1
        : 0;
    _editorState = widget.value.content == null
        ? EditorState.blank(withInitialText: true)
        : EditorState(document: markdownToDocument(widget.value.content!));
    _isScheduleInvalid = ValueNotifier(false);
    _appLifecycleListener = AppLifecycleListener(
      onInactive: _flushDraft,
      onPause: _flushDraft,
      onHide: _flushDraft,
    );
  }

  @override
  void dispose() {
    _appLifecycleListener.dispose();
    _isScheduleInvalid.dispose();
    _editorState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = reportFormControllerProvider(
      projectId: widget.projectId,
      reportId: widget.reportId,
      scheduleId: widget.scheduleId,
    );
    final draftAutosaveProvider = reportDraftAutosaveControllerProvider(
      projectId: widget.projectId,
      reportId: widget.reportId,
      scheduleId: widget.scheduleId,
    );

    ref.listen(draftAutosaveProvider, (_, next) {
      if (next is! ReportDraftAutosaveSaved) return;

      ref
          .read(toastProvider)
          .showToast(
            child: Toast(
              type: ToastType.saving,
              message: Intl.message('draft_saving'),
            ),
          );
    });

    ref.listen<AsyncValue<ReportFormState>>(formProvider, (previous, next) {
      if (previous == null || !previous.hasValue || !next.hasValue) return;
      if (previous.requireValue == next.requireValue) return;

      ref.read(draftAutosaveProvider.notifier).schedule();
    });

    ref.listen<ReportSubmitState>(
      reportSubmitControllerProvider,
      (_, state) => unawaited(_handleSubmitState(state)),
    );

    final steps = [
      if (_hasScheduleStep) ReportFormStep.schedule,
      ...widget.value.steps,
    ];
    final currentStep = steps[_currentIndex];
    final isLastStep = _currentIndex == steps.length - 1;
    final tripOptions = widget.value.hasTripSchedule
        ? ref.watch(
            tripOptionsProvider(categoryId: widget.value.schedule!.category.id),
          )
        : null;
    final validationSteps = tripOptions?.value?.steps;
    final currentValidationSteps = !widget.value.hasTripSchedule
        ? const <TripStep>[]
        : isLastStep
        ? validationSteps
        : validationSteps
              ?.where((step) => step.categoryId == currentStep.categoryId)
              .toList();

    return PopScope(
      canPop: _currentIndex == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) unawaited(_goBack());
      },
      child: BranchLayout(
        title: Text(
          Intl.message(
            widget.value.hasTripSchedule
                ? 'report_form_title_${widget.value.schedule!.category.id}'
                : 'report_form_title',
          ),
        ),
        onTap: _goBack,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ReportFormScope(
                projectId: widget.projectId,
                reportId: widget.reportId,
                scheduleId: widget.scheduleId,
                child: ReportFormWidget(
                  currentIndex: _currentIndex,
                  currentStep: currentStep,
                  steps: steps,
                  value: widget.value,
                  editorState: _editorState,
                  isScheduleInvalid: _isScheduleInvalid,
                  onScheduleSelected: _selectSchedule,
                  onWithoutSchedule: _continueWithoutSchedule,
                  onDraftSelected: _selectDraft,
                ),
              ),
            ),
            ReportFormActions(
              label: !isLastStep
                  ? Intl.message('common_next')
                  : widget.reportId == null
                  ? Intl.message('common_post')
                  : Intl.message('common_edit'),
              onPressed:
                  currentStep != ReportFormStep.schedule &&
                      currentValidationSteps == null
                  ? null
                  : () => _continueForm(
                      currentStep: currentStep,
                      isLastStep: isLastStep,
                      validationSteps: currentValidationSteps,
                    ),
              onDelete: widget.reportId == null ? null : _deleteReport,
            ),
          ],
        ),
      ),
    );
  }

  void _flushDraft() {
    unawaited(
      ref
          .read(
            reportDraftAutosaveControllerProvider(
              projectId: widget.projectId,
              reportId: widget.reportId,
              scheduleId: widget.scheduleId,
            ).notifier,
          )
          .flush(),
    );
  }

  Future<void> _goBack() async {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
      return;
    }

    await ref
        .read(
          reportDraftAutosaveControllerProvider(
            projectId: widget.projectId,
            reportId: widget.reportId,
            scheduleId: widget.scheduleId,
          ).notifier,
        )
        .flush();
    if (!mounted) return;

    context.pop();
  }

  void _selectSchedule(Schedule? schedule) {
    ref
        .read(
          reportFormControllerProvider(
            projectId: widget.projectId,
            reportId: widget.reportId,
            scheduleId: widget.scheduleId,
          ).notifier,
        )
        .selectSchedule(schedule);
  }

  void _continueWithoutSchedule() {
    _selectSchedule(null);
    _isScheduleInvalid.value = false;
    setState(() => _currentIndex++);
  }

  Future<void> _selectDraft(String draftId) async {
    await ref
        .read(
          reportDraftAutosaveControllerProvider(
            projectId: widget.projectId,
            reportId: widget.reportId,
            scheduleId: widget.scheduleId,
          ).notifier,
        )
        .flush();
    if (!mounted) return;

    final restored = await ref
        .read(draftRestoreControllerProvider.notifier)
        .restoreReport(draftId: draftId, projectId: widget.projectId);
    if (!mounted) return;

    if (restored == null) {
      if (ref.read(draftRestoreControllerProvider) is DraftRestoreInvalid) {
        ref
            .read(toastProvider)
            .showToast(
              child: Toast(
                type: ToastType.alert,
                message: Intl.message('draft_restore_failed'),
              ),
            );
      }
      return;
    }

    ref
        .read(
          reportFormControllerProvider(
            projectId: widget.projectId,
            reportId: widget.reportId,
            scheduleId: widget.scheduleId,
          ).notifier,
        )
        .restoreDraftPayload(restored.payload, files: restored.files);

    final previousEditorState = _editorState;
    setState(() {
      final content = restored.payload.content;
      _editorState = content == null || content.isEmpty
          ? EditorState.blank(withInitialText: true)
          : EditorState(document: markdownToDocument(content));
      _currentIndex = _hasScheduleStep ? 1 : 0;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      previousEditorState.dispose();
    });
  }

  Future<void> _continueForm({
    required ReportFormStep currentStep,
    required bool isLastStep,
    required List<TripStep>? validationSteps,
  }) async {
    if (currentStep == ReportFormStep.schedule) {
      _isScheduleInvalid.value = widget.value.schedule == null;
      if (!_isScheduleInvalid.value) {
        setState(() => _currentIndex++);
      }
      return;
    }

    if (validationSteps == null) return;

    final isValid = ref
        .read(reportValidationControllerProvider.notifier)
        .validate(
          value: widget.value,
          steps: validationSteps,
          validateHolidays:
              currentStep == ReportFormStep.dailyExpense || isLastStep,
          validateContent: isLastStep,
          contentIsEmpty: _editorState.document.isEmpty,
        );

    if (!isValid) return;
    if (!isLastStep) {
      setState(() => _currentIndex++);
      return;
    }

    await ref
        .read(
          reportDraftAutosaveControllerProvider(
            projectId: widget.projectId,
            reportId: widget.reportId,
            scheduleId: widget.scheduleId,
          ).notifier,
        )
        .flush();
    if (!mounted) return;

    if (widget.reportId == null) {
      await ref
          .read(reportSubmitControllerProvider.notifier)
          .createReport(
            projectId: widget.projectId,
            scheduleId: widget.scheduleId,
            editorState: _editorState,
          );
    } else {
      await ref
          .read(reportSubmitControllerProvider.notifier)
          .updateReport(
            projectId: widget.projectId,
            reportId: widget.reportId!,
            scheduleId: widget.scheduleId,
            editorState: _editorState,
          );
    }
  }

  Future<void> _deleteReport() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (_) => DeleteDialog(
        title: Intl.message('report_form_delete_dialog_1'),
        content: Intl.message('report_form_delete_dialog_2'),
      ),
    );

    if (!mounted || shouldDelete != true) return;

    await ref
        .read(reportSubmitControllerProvider.notifier)
        .deleteReport(projectId: widget.projectId, reportId: widget.reportId!);
  }

  Future<void> _handleSubmitState(ReportSubmitState state) async {
    if (state is ReportSubmitPending) {
      LoadingOverlay.show(context);
      return;
    }

    LoadingOverlay.hide();

    if (state is ReportSubmitCreated ||
        state is ReportSubmitUpdated ||
        state is ReportSubmitDeleted) {
      try {
        await ref
            .read(
              reportDraftControllerProvider(
                projectId: widget.projectId,
              ).notifier,
            )
            .deleteCurrent();
      } catch (error, stackTrace) {
        debugPrint('Report draft cleanup failed: $error');
        debugPrintStack(stackTrace: stackTrace);
      }
      if (!mounted) return;
    }

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
          pathParameters: {'project_id': widget.projectId.toString()},
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
          pathParameters: {'project_id': widget.projectId.toString()},
        );
      default:
        break;
    }
  }
}
