import 'package:flutter/material.dart' hide DatePickerDialog;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class KickoffFormItem extends ConsumerWidget {
  final DateTime? kickoffDate;

  const KickoffFormItem({super.key, this.kickoffDate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scope = IssueFormScope.of(context);
    final projectId = scope.projectId;
    final categoryId = scope.categoryId;
    final issueId = scope.issueId;
    final validation = ref.watch(issueValidationControllerProvider);
    final validationController = ref.read(
      issueValidationControllerProvider.notifier,
    );
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Intl.message('issue_form_kickoff_1'),
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8.0),
        ElevatedButton.icon(
          onPressed: () async {
            validationController.clearKickoff();

            final result = await showDialog(
              context: context,
              builder: (_) => DatePickerDialog(
                initialDate: kickoffDate,
                title: Intl.message('issue_form_kickoff_2'),
              ),
            );

            if (result != null) {
              ref
                  .read(
                    issueFormControllerProvider(
                      projectId: projectId,
                      categoryId: categoryId,
                      issueId: issueId,
                    ).notifier,
                  )
                  .setKickoffDate(date: result);
            }
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 12.0,
              top: 16.0,
              bottom: 16.0,
            ),
          ),
          icon: Icon(Symbols.event_rounded),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                kickoffDate == null
                    ? Intl.message('issue_form_kickoff_2')
                    : DateFormat.yMMMd(
                        Intl.getCurrentLocale(),
                      ).format(kickoffDate!),
              ),
              SizedBox(width: 8.0),
              Icon(Symbols.chevron_right_rounded),
            ],
          ),
        ),
        ValidationErrorMessage(
          visible: validation.kickoffDateMissing,
          text: Intl.message('issue_form_kickoff_invalid'),
        ),
      ],
    );
  }
}
