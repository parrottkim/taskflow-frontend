import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class FileItemWidget extends HookConsumerWidget {
  final XFile file;

  const FileItemWidget({super.key, required this.file});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formController = IssueFormScope.of(context).controller(ref);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // 이제 이 위젯의 build 메서드 안에서 useFuture를 안전하게 호출할 수 있습니다.
    final lengthFuture = useMemoized(() => file.length(), [file]);
    final length = useFuture(lengthFuture).data;

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
              if (extension(file.name).isNotEmpty)
                Positioned(
                  bottom: 4.0,
                  child: Container(
                    width: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: colorScheme.primary.strong,
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
              color: colorScheme.onSurface.strong,
            ),
          ),
          SizedBox(width: 8.0),
          AppIconButton(
            onTap: () {
              formController.removeFile(file: file);
            },
            icon: Icon(Symbols.delete_rounded, size: 20.0),
          ),
        ],
      ),
    );
  }
}
