import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:url_launcher/url_launcher.dart';

/// Generic attachment widget for uploading and managing attachments
/// Used in both Issue and Report forms
class AttachmentUploadWidget<T> extends HookConsumerWidget {
  final String title;
  final List<T>? attachments;
  final List<XFile>? files;
  final Function(XFile) onAddFile;
  final Function(XFile) onRemoveFile;
  final Function(T) onRemoveAttachment;
  final String path; // 'issue' or 'report'

  const AttachmentUploadWidget({
    super.key,
    required this.title,
    required this.attachments,
    required this.files,
    required this.onAddFile,
    required this.onRemoveFile,
    required this.onRemoveAttachment,
    required this.path,
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

        onAddFile(file);
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
            title,
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
                      ? colorScheme.primary.withValues(alpha: 0.2)
                      : colorScheme.outline.withValues(alpha: 0.2),
                ),
                color: dragged.value
                    ? colorScheme.tertiaryContainer.withValues(alpha: 0.5)
                    : colorScheme.surface,
              ),
              child: Column(
                children: [
                  Stack(
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
                  SizedBox(height: 12.0),
                  Text(
                    Intl.message('issue_form_attachment_drop'),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Skeleton.unite(
                    child: ElevatedButton(
                      onPressed: () async {
                        final result = await openFiles(
                          acceptedTypeGroups: [],
                        );
                        processFile(result);
                      },
                      child: Text(Intl.message('issue_form_attachment_upload')),
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
                physics: NeverScrollableScrollPhysics(),
                itemCount: attachments!.length,
                separatorBuilder: (context, index) => SizedBox(height: 8.0),
                itemBuilder: (context, index) => AttachmentItemWidget<T>(
                  attachment: attachments![index],
                  onRemove: () => onRemoveAttachment(attachments![index]),
                ),
              ),
            ),
          if (files != null && files!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: files!.length,
                separatorBuilder: (context, index) => SizedBox(height: 8.0),
                itemBuilder: (context, index) => FileItemWidget(
                  file: files![index],
                  onRemove: () => onRemoveFile(files![index]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Display-only attachment list widget
/// Used in Issue and Report list/detail views
class AttachmentListWidget<T> extends ConsumerWidget {
  final List<T> attachments;
  final bool showPadding;

  const AttachmentListWidget({
    super.key,
    required this.attachments,
    this.showPadding = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: showPadding ? const EdgeInsets.only(top: 24.0) : EdgeInsets.zero,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: attachments.length,
        separatorBuilder: (context, index) => SizedBox(height: 8.0),
        itemBuilder: (context, index) => AttachmentItemWidget<T>(
          attachment: attachments[index],
          isReadOnly: true,
        ),
      ),
    );
  }
}

/// Individual attachment item widget (for already uploaded attachments)
class AttachmentItemWidget<T> extends HookConsumerWidget {
  final T attachment;
  final VoidCallback? onRemove;
  final bool isReadOnly;

  const AttachmentItemWidget({
    super.key,
    required this.attachment,
    this.onRemove,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Extract common properties from different attachment types
    final filename = _getFilename(attachment);
    final size = _getSize(attachment);
    final effectivePath = _getPath(attachment);

    return ContainerWidget(
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      borderRadius: BorderRadius.circular(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Icon(
                Symbols.draft_rounded,
                size: 24.0,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              if (extension(filename).isNotEmpty)
                Positioned(
                  bottom: 4.0,
                  child: Container(
                    width: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: colorScheme.primary.withValues(alpha: 0.7),
                    ),
                    child: Text(
                      extension(filename).substring(1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              filename,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            formatBytes(size),
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(width: 8.0),
          if (isReadOnly && effectivePath != null) ...[
            CustomIconButton(
              onTap: () async {
                final uri = Uri(
                  scheme: Uri.base.scheme,
                  host: Uri.base.host,
                  port: Uri.base.hasPort ? Uri.base.port : null,
                  path: Routes.download,
                  queryParameters: {
                    'path': effectivePath,
                    'filename': filename,
                  },
                );

                await Clipboard.setData(ClipboardData(text: uri.toString()));

                ref.read(toastProvider).showToast(
                      child: Toast(
                        type: ToastType.standard,
                        message: Intl.message('project_detail_share_link'),
                      ),
                    );
              },
              icon: Icon(Symbols.share_rounded, size: 20.0),
            ),
            SizedBox(width: 4.0),
            CustomIconButton(
              onTap: () async {
                final uri = Uri(
                  scheme: Uri.base.scheme,
                  host: Uri.base.host,
                  port: Uri.base.hasPort ? Uri.base.port : null,
                  path: Routes.download,
                  queryParameters: {
                    'path': effectivePath,
                    'filename': filename,
                  },
                );

                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              icon: Icon(Symbols.download_rounded, size: 20.0),
            ),
          ] else if (onRemove != null)
            CustomIconButton(
              onTap: onRemove,
              icon: Icon(Symbols.delete_rounded, size: 20.0),
            ),
        ],
      ),
    );
  }

  String _getFilename(dynamic attachment) {
    if (attachment is Map) {
      return attachment['filename'] ?? '';
    }
    return (attachment as dynamic).filename ?? '';
  }

  int _getSize(dynamic attachment) {
    if (attachment is Map) {
      return attachment['size'] ?? 0;
    }
    return (attachment as dynamic).size ?? 0;
  }

  String? _getPath(dynamic attachment) {
    if (attachment is Map) {
      return attachment['path'] as String?;
    }

    return (attachment as dynamic).path as String?;
  }
}

/// Individual file item widget (for files not yet uploaded)
class FileItemWidget extends HookConsumerWidget {
  final XFile file;
  final VoidCallback onRemove;

  const FileItemWidget({
    super.key,
    required this.file,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final lengthFuture = useMemoized(() => file.length(), [file]);
    final length = useFuture(lengthFuture).data;

    return ContainerWidget(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      borderRadius: BorderRadius.circular(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Icon(
                Symbols.draft_rounded,
                size: 24.0,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              if (extension(file.name).isNotEmpty)
                Positioned(
                  bottom: 4.0,
                  child: Container(
                    width: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: colorScheme.primary.withValues(alpha: 0.7),
                    ),
                    child: Text(
                      extension(file.name).substring(1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              file.name,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            formatBytes(length ?? 0),
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(width: 8.0),
          CustomIconButton(
            onTap: onRemove,
            icon: Icon(Symbols.delete_rounded, size: 20.0),
          ),
        ],
      ),
    );
  }
}
