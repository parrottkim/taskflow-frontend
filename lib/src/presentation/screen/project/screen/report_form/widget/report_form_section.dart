import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/accommodation_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/daily_expense_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/description_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/local_transportation_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/other_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/transportation_widget.dart';

class ReportFormSection extends StatelessWidget {
  final int projectId;
  final int? reportId;
  final int? scheduleId;
  final String? step;
  final ReportFormState value;
  final EditorState editorState;

  const ReportFormSection({
    super.key,
    required this.projectId,
    this.reportId,
    this.scheduleId,
    this.step,
    required this.value,
    required this.editorState,
  });

  @override
  Widget build(BuildContext context) {
    return switch (step) {
      'transportation' => TransportationWidget(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
        schedule: value.schedule!,
        expenses: value.expenses,
      ),
      'local_transportation' => LocalTransportationWidget(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
        schedule: value.schedule!,
        expenses: value.expenses,
      ),
      'accommodation' => AccommodationWidget(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
        schedule: value.schedule!,
        expenses: value.expenses,
        rates: value.rates,
      ),
      'daily_expense' => DailyExpenseWidget(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
        schedule: value.schedule!,
        rates: value.rates,
        isDeducted: value.isDeducted,
      ),
      'other' => OtherWidget(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
        schedule: value.schedule!,
        fuel: value.fuel,
        expenses: value.expenses,
      ),
      'description' => DescriptionWidget(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
        editorState: editorState,
        attachments: value.attachments,
        files: value.files,
      ),
      _ => const Center(child: Text('알 수 없는 단계입니다.')),
    };
  }
}
