import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/report_draft_recovery_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/progress_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/report_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SummaryWidget extends StatelessWidget {
  final int currentIndex;
  final ReportFormStep currentStep;
  final List<ReportFormStep> steps;
  final ReportFormState value;
  final ValueChanged<String> onDraftSelected;

  const SummaryWidget({
    super.key,
    required this.currentIndex,
    required this.currentStep,
    required this.steps,
    required this.value,
    required this.onDraftSelected,
  });

  @override
  Widget build(BuildContext context) {
    final projectId = ReportFormScope.of(context).projectId;

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 320.0, maxWidth: 320.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (currentStep != ReportFormStep.schedule)
              ContentContainer(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: ProgressWidget(currentIndex: currentIndex, steps: steps),
              ),
            if (currentStep != ReportFormStep.schedule &&
                value.hasTripSchedule) ...[
              const SizedBox(height: 16.0),
              ScheduleSummaryCard(schedule: value.schedule!),
            ],
            ReportDraftRecoveryWidget(
              projectId: projectId,
              onSelected: onDraftSelected,
            ),
          ],
        ),
      ),
    );
  }
}
