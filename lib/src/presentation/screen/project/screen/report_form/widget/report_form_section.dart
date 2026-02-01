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
  final String? step;
  final ReportFormState value;
  final EditorState editorState;

  const ReportFormSection({
    super.key,
    this.step,
    required this.value,
    required this.editorState,
  });

  @override
  Widget build(BuildContext context) {
    return switch (step) {
      'transportation' => TransportationWidget(
        schedule: value.schedule!,
        expenses: value.expenses,
      ),
      'local_transportation' => LocalTransportationWidget(
        schedule: value.schedule!,
        expenses: value.expenses,
      ),
      'accommodation' => AccommodationWidget(
        schedule: value.schedule!,
        expenses: value.expenses,
        rates: value.rates,
      ),
      'daily_expense' => DailyExpenseWidget(
        schedule: value.schedule!,
        rates: value.rates,
        isDeducted: value.isDeducted,
      ),
      'other' => OtherWidget(
        schedule: value.schedule!,
        fuel: value.fuel,
        expenses: value.expenses,
      ),
      'description' => DescriptionWidget(
        editorState: editorState!,
        attachments: value.attachments,
        files: value.files,
      ),
      _ => const Center(child: Text('알 수 없는 단계입니다.')),
    };
  }
}
