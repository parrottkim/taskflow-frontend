import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class AttachmentItemWidget extends HookConsumerWidget {
  final IssueAttachment attachment;

  const AttachmentItemWidget({super.key, required this.attachment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formController = IssueFormScope.of(context).controller(ref);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ContentContainer(
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
                color: colorScheme.onSurface.strong,
              ),
              Positioned(
                bottom: 4.0,
                child: Container(
                  width: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    color: colorScheme.primary.strong,
                  ),
                  child: Text(
                    extension(attachment.filename).substring(1),
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
            attachment.filename,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          Spacer(),
          // 파일 크기 표시
          Text(
            formatBytes(attachment.size),
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface.strong,
            ),
          ),
          SizedBox(width: 8.0),
          AppIconButton(
            onTap: () {
              formController.removeAttachment(attachment: attachment);
            },
            icon: Icon(Symbols.delete_rounded, size: 20.0),
          ),
        ],
      ),
    );
  }
}
