import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_scope.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/contract_form_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/issue_draft_recovery_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/kickoff_form_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/procurement_form_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/summary_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/transaction_form_item.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class IssueFormWidget extends StatelessWidget {
  final IssueFormState value;
  final EditorState editorState;
  final ValueChanged<String> onDraftSelected;

  const IssueFormWidget({
    super.key,
    required this.value,
    required this.editorState,
    required this.onDraftSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _DesktopLayout(
        form: _FormWidget(value: value, editorState: editorState),
        summary: SummaryWidget(onDraftSelected: onDraftSelected),
      ),
      mobile: _MobileLayout(
        draftRecovery: IssueDraftRecoveryWidget(onSelected: onDraftSelected),
        form: _FormWidget(value: value, editorState: editorState),
      ),
    );
  }
}

class _FormWidget extends ConsumerWidget {
  final IssueFormState value;
  final EditorState editorState;

  const _FormWidget({required this.value, required this.editorState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formController = IssueFormScope.of(context).controller(ref);
    final validation = ref.watch(issueValidationControllerProvider);
    final validationController = ref.read(
      issueValidationControllerProvider.notifier,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichTextEditor(
            editorState: editorState,
            onChanged: (content) {
              validationController.clearContent();
              formController.setContent(content: content);
            },
          ),
          ValidationErrorMessage(
            visible: validation.contentInvalid,
            text: Intl.message('issue_form_invalid_1'),
          ),
          const SizedBox(height: 24.0),
          switch (value.category) {
            IssueContract() => ContractFormItem(
              contractItems: value.contractItems,
              transactionItems: value.transactionItems,
            ),
            IssueKickoff() => KickoffFormItem(kickoffDate: value.kickoffDate),
            IssueProcurement() => ProcurementFormItem(
              items: value.procurementItems,
              requests: value.requests,
            ),
            IssueTransaction() => TransactionFormItem(
              currency: value.currency,
              items: value.transactionItems,
            ),
            _ => const SizedBox.shrink(),
          },
          AttachmentUploadWidget(
            title: Intl.message('issue_form_attachment'),
            attachments: value.attachments,
            files: value.files,
            path: 'issue',
            onAddFile: (file) => formController.addFile(file: file),
            onRemoveFile: (file) => formController.removeFile(file: file),
            onRemoveAttachment: (attachment) =>
                formController.removeAttachment(attachment: attachment),
          ),
        ],
      ),
    );
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
  final Widget draftRecovery;
  final Widget form;

  const _MobileLayout({required this.draftRecovery, required this.form});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: draftRecovery,
        ),
        Expanded(child: form),
      ],
    );
  }
}
