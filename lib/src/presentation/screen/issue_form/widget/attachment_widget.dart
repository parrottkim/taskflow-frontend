import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/issue_form/widget/file_item_widget.dart';
import 'package:taskflow/src/presentation/screen/issue_form/widget/attachment_item_widget.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class AttachmentWidget extends HookConsumerWidget {
  final int categoryId;
  final int projectId;
  final int? issueId;
  final List<IssueAttachment>? attachments;
  final List<XFile>? files;

  const AttachmentWidget({
    super.key,
    required this.categoryId,
    required this.projectId,
    this.issueId,
    required this.attachments,
    required this.files,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final maxImageSize = Functions(context).maxImageSize;

    final dragged = useState(false);

    Future<void> processFile(List<XFile> files) async {
      for (var file in files) {
        if (await file.length() > maxImageSize) {
          ref.read(toastProvider).showToast(
                child: Toast(
                  type: ToastType.alert,
                  message: Intl.message(
                    'issue_form_file_size_limit',
                    args: [file.name, maxImageSize ~/ (1024 * 1024)],
                  ),
                ),
              );
          continue;
        }

        ref
            .read(issueFormControllerProvider(
                    categoryId: categoryId,
                    projectId: projectId,
                    issueId: issueId)
                .notifier)
            .addFile(file);
      }
    }

    return Container(
      padding: const EdgeInsets.only(top: 24.0),
      constraints: BoxConstraints(maxWidth: 600.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intl.message('issue_form_attachment'),
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.0),
          DropTarget(
            onDragDone: (details) => processFile(details.files),
            onDragEntered: (details) => dragged.value = true,
            onDragExited: (details) => dragged.value = false,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInQuad,
              padding: EdgeInsets.symmetric(vertical: 32.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: dragged.value
                      ? Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.2)
                      : Theme.of(context)
                          .colorScheme
                          .outline
                          .withValues(alpha: 0.2),
                ),
                color: dragged.value
                    ? Theme.of(context)
                        .colorScheme
                        .tertiaryContainer
                        .withValues(alpha: 0.5)
                    : Theme.of(context).colorScheme.surface,
              ),
              child: Column(
                children: [
                  Skeleton.unite(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Symbols.folder_rounded,
                            size: 36.0,
                            color: colorScheme.primary,
                          ),
                        ),
                        Positioned(
                          bottom: 4.0,
                          right: 4.0,
                          child: Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: colorScheme.primary,
                            ),
                            child: Icon(
                              Symbols.upload_rounded,
                              size: 14.0,
                              weight: 700.0,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    Intl.message('issue_form_attachment_drop'),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 12.0),
                  Skeleton.unite(
                    child: ElevatedButton(
                      onPressed: () async {
                        final files =
                            await openFiles(acceptedTypeGroups: <XTypeGroup>[]);

                        if (files.isEmpty) return;

                        processFile(files);
                      },
                      child: Text(
                        Intl.message('issue_form_attachment_upload'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (attachments != null && attachments!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: attachments!.length,
                itemBuilder: (context, index) => AttachmentItemWidget(
                  categoryId: categoryId,
                  projectId: projectId,
                  issueId: issueId,
                  attachment: attachments![index],
                ),
                separatorBuilder: (_, __) => SizedBox(height: 8.0),
              ),
            ),
          if (files != null && files!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: files!.length,
                itemBuilder: (context, index) => FileItemWidget(
                  categoryId: categoryId,
                  projectId: projectId,
                  issueId: issueId,
                  file: files![index],
                ),
                separatorBuilder: (_, __) => SizedBox(height: 8.0),
              ),
            ),
        ],
      ),
    );
  }
}
