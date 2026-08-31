import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/report_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DescriptionWidget extends HookConsumerWidget {
  final EditorState editorState;
  final List<ReportAttachment>? attachments;
  final List<XFile>? files;

  const DescriptionWidget({
    super.key,
    required this.editorState,
    this.attachments,
    this.files,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final validation = ref.watch(reportValidationControllerProvider);
    final isDescriptionInvalid = validation.contentInvalid;
    final formController = ReportFormScope.of(context).controller(ref);

    return SingleChildScrollView(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichTextEditor(
            editorState: editorState,
            onChanged: (value) => formController.setContent(content: value),
          ),
          ValidationErrorMessage(
            visible: isDescriptionInvalid,
            text: Intl.message('report_form_invalid_5'),
          ),
          SizedBox(height: 24.0),
          AttachmentUploadWidget<ReportAttachment>(
            title: Intl.message('report_form_attachment'),
            path: 'report',
            attachments: attachments ?? [],
            files: files ?? [],
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
