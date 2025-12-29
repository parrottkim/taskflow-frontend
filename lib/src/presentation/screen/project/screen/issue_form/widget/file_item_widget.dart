import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class FileItemWidget extends HookConsumerWidget {
  final int categoryId;
  final int projectId;
  final int? issueId;
  final XFile file;

  const FileItemWidget({
    super.key,
    required this.categoryId,
    required this.projectId,
    this.issueId,
    required this.file,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // 이제 이 위젯의 build 메서드 안에서 useFuture를 안전하게 호출할 수 있습니다.
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
          // 파일 크기 표시
          Text(
            formatBytes(length ?? 0),
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
                          projectId: projectId,
                          categoryId: categoryId,
                          issueId: issueId)
                      .notifier)
                  .removeFile(file);
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
