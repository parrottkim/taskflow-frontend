import 'package:flutter/material.dart';
import 'package:taskflow/src/shared/theme/color_extension.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/router/router.dart';

class FolderTreeItemWidget extends HookConsumerWidget {
  final DocumentFolder folder;
  final List<int> path;
  final int depth;

  const FolderTreeItemWidget({
    super.key,
    required this.folder,
    required this.path,
    this.depth = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final filter = ref.watch(documentFilterControllerProvider);

    final expanded = useState(depth < 1 || filter.folders.contains(folder.id));
    final hasChildren = folder.children.isNotEmpty;
    final selected = folder.id == filter.folderId;

    useEffect(() {
      if (filter.folders.contains(folder.id)) {
        expanded.value = true;
      }

      return null;
    }, [filter.folders]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(6.0),
            onTap: () {
              if (folder.id == filter.folderId) {
                return;
              }

              ref
                  .read(documentFilterControllerProvider.notifier)
                  .setFolders(folders: path);

              context.goNamed(
                RouteNames.document,
                queryParameters: context.buildQueryParameters(
                  updates: {'folders': path.join(',')},
                ),
              );
            },
            child: SizedBox(
              height: 34.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: selected
                      ? colorScheme.primary.faint
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 4.0 + depth * 16.0,
                    right: 8.0,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: hasChildren
                            ? InkWell(
                                overlayColor: WidgetStatePropertyAll(
                                  Colors.transparent,
                                ),
                                splashFactory: NoSplash.splashFactory,
                                borderRadius: BorderRadius.circular(4.0),
                                onTap: () {
                                  expanded.value = !expanded.value;
                                },
                                child: Icon(
                                  expanded.value
                                      ? Symbols.keyboard_arrow_down_rounded
                                      : Symbols.keyboard_arrow_right_rounded,
                                  size: 18.0,
                                  color: colorScheme.onSurface.strong,
                                ),
                              )
                            : null,
                      ),
                      SizedBox(width: 2.0),
                      Icon(
                        hasChildren && expanded.value
                            ? Symbols.folder_open_rounded
                            : Symbols.folder_rounded,
                        size: 18.0,
                        color: selected
                            ? colorScheme.primary
                            : colorScheme.onSurface.strong,
                        weight: selected ? 600 : 400,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          folder.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyMedium?.copyWith(
                            color: selected
                                ? colorScheme.primary
                                : colorScheme.onSurface.strong,
                            fontWeight: selected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (expanded.value)
          for (final child in folder.children)
            FolderTreeItemWidget(
              key: ValueKey(child.id),
              folder: child,
              path: [...path, child.id],
              depth: depth + 1,
            ),
      ],
    );
  }
}
