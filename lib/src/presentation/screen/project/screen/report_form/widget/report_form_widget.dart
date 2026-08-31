import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/report_form_scope.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/daily_expense_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/description_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/report_draft_recovery_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/progress_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/report_schedule_step.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/summary_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/trip_expense_step_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ReportFormWidget extends StatelessWidget {
  final int currentIndex;
  final ReportFormStep currentStep;
  final List<ReportFormStep> steps;
  final ReportFormState value;
  final EditorState editorState;
  final ValueNotifier<bool> isScheduleInvalid;
  final ValueChanged<Schedule> onScheduleSelected;
  final VoidCallback onWithoutSchedule;
  final ValueChanged<String> onDraftSelected;

  const ReportFormWidget({
    super.key,
    required this.currentIndex,
    required this.currentStep,
    required this.steps,
    required this.value,
    required this.editorState,
    required this.isScheduleInvalid,
    required this.onScheduleSelected,
    required this.onWithoutSchedule,
    required this.onDraftSelected,
  });

  @override
  Widget build(BuildContext context) {
    final projectId = ReportFormScope.of(context).projectId;

    return Responsive(
      desktop: _DesktopLayout(
        form: _FormWidget(
          currentStep: currentStep,
          value: value,
          editorState: editorState,
          isScheduleInvalid: isScheduleInvalid,
          onScheduleSelected: onScheduleSelected,
          onWithoutSchedule: onWithoutSchedule,
        ),
        summary: SummaryWidget(
          currentIndex: currentIndex,
          currentStep: currentStep,
          steps: steps,
          value: value,
          onDraftSelected: onDraftSelected,
        ),
      ),
      mobile: _MobileLayout(
        progress: currentStep == ReportFormStep.schedule
            ? null
            : ProgressWidget(currentIndex: currentIndex, steps: steps),
        draftRecovery: ReportDraftRecoveryWidget(
          projectId: projectId,
          onSelected: onDraftSelected,
        ),
        scheduleSummary:
            currentStep != ReportFormStep.schedule && value.hasTripSchedule
            ? ScheduleSummaryCard(schedule: value.schedule!)
            : null,
        form: _FormWidget(
          currentStep: currentStep,
          value: value,
          editorState: editorState,
          isScheduleInvalid: isScheduleInvalid,
          onScheduleSelected: onScheduleSelected,
          onWithoutSchedule: onWithoutSchedule,
        ),
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  final ReportFormStep currentStep;
  final ReportFormState value;
  final EditorState editorState;
  final ValueNotifier<bool> isScheduleInvalid;
  final ValueChanged<Schedule> onScheduleSelected;
  final VoidCallback onWithoutSchedule;

  const _FormWidget({
    required this.currentStep,
    required this.value,
    required this.editorState,
    required this.isScheduleInvalid,
    required this.onScheduleSelected,
    required this.onWithoutSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return switch (currentStep) {
      ReportFormStep.schedule => ReportScheduleStep(
        schedule: value.schedule,
        isScheduleInvalid: isScheduleInvalid,
        onSelected: onScheduleSelected,
        onWithoutSchedule: onWithoutSchedule,
      ),
      ReportFormStep.transportation ||
      ReportFormStep.localTransportation ||
      ReportFormStep.accommodation ||
      ReportFormStep.other => TripExpenseStepWidget(
        step: currentStep,
        form: value,
      ),
      ReportFormStep.dailyExpense => DailyExpenseWidget(
        schedule: value.schedule!,
        expenses: value.expenses,
        holidays: value.schedule!.holidays,
      ),
      ReportFormStep.description => DescriptionWidget(
        editorState: editorState,
        attachments: value.attachments,
        files: value.files,
      ),
    };
  }
}

class _DesktopLayout extends StatelessWidget {
  final Widget form;
  final Widget summary;

  const _DesktopLayout({required this.form, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: form),
        const SizedBox(width: 16.0),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, right: 24.0, bottom: 24.0),
          child: summary,
        ),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final Widget? progress;
  final Widget draftRecovery;
  final Widget? scheduleSummary;
  final Widget form;

  const _MobileLayout({
    required this.progress,
    required this.draftRecovery,
    required this.scheduleSummary,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ?progress,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: draftRecovery,
        ),
        Expanded(
          child: NestedScrollView(
            headerSliverBuilder: (_, _) => [
              if (scheduleSummary != null)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                      top: 16.0,
                    ),
                    child: scheduleSummary!,
                  ),
                ),
            ],
            body: form,
          ),
        ),
      ],
    );
  }
}
