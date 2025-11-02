import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class AttachmentItemWidget extends HookConsumerWidget {
  final int categoryId;
  final int projectId;
  final int? issueId;
  final IssueAttachment attachment;

  const AttachmentItemWidget({
    super.key,
    required this.categoryId,
    required this.projectId,
    this.issueId,
    required this.attachment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
              Positioned(
                bottom: 4.0,
                child: Container(
                  width: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    color: colorScheme.primary.withValues(alpha: 0.7),
                  ),
                  child: Text(
                    extension(attachment.name).substring(1),
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
          Text(
            attachment.name,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          // 파일 크기 표시
          Text(
            formatBytes(attachment.size),
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(width: 8.0),
          CustomIconButton(
            onTap: () {
              ref
                  .read(issueFormControllerProvider(
                          categoryId: categoryId,
                          projectId: projectId,
                          issueId: issueId)
                      .notifier)
                  .removeAttachment(attachment);
            },
            icon: Icon(
              Symbols.delete_rounded,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
