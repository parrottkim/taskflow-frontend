import 'package:flutter/material.dart';
import 'package:super_editor/super_editor.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/accommodation_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/daily_expense_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/editor_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/local_transportation_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/other_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/transportation_widget.dart';

class ReportItemWidget extends StatelessWidget {
  final int projectId;
  final int? reportId;
  final String? step;
  final ReportFormState value;
  final MutableDocument document;

  const ReportItemWidget({
    super.key,
    required this.projectId,
    this.reportId,
    this.step,
    required this.value,
    required this.document,
  });

  @override
  Widget build(BuildContext context) {
    return switch (step) {
      'transportation' => TransportationWidget(
          projectId: projectId,
          reportId: reportId,
          schedule: value.schedule!,
          expenses: value.expenses,
        ),
      'local_transportation' => LocalTransportationWidget(
          projectId: projectId,
          reportId: reportId,
          schedule: value.schedule!,
          expenses: value.expenses,
        ),
      'accommodation' => AccommodationWidget(
          projectId: projectId,
          reportId: reportId,
          schedule: value.schedule!,
          expenses: value.expenses,
          rates: value.rates,
        ),
      'daily_expense' => DailyExpenseWidget(
          projectId: projectId,
          reportId: reportId,
          schedule: value.schedule!,
          rates: value.rates,
          isDeducted: value.isDeducted,
        ),
      'other' => OtherWidget(
          projectId: projectId,
          reportId: reportId,
          schedule: value.schedule!,
          expenses: value.expenses,
          fuel: value.fuel,
        ),
      'description' => EditorWidget(
          projectId: projectId,
          reportId: reportId,
          content: value.content,
          attachments: value.attachments,
          files: value.files,
          document: document,
        ),
      _ => const Center(child: Text('알 수 없는 단계입니다.')),
    };
  }
}
