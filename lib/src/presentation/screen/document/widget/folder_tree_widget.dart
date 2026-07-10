import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class FolderTreeWidget extends ConsumerWidget {
  const FolderTreeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folder = ref.watch(documentOptionsControllerProvider);
    final filter = ref.watch(documentFilterControllerProvider);

    return SizedBox(
      width: 280.0,
      child: switch ((folder, filter)) {
        (AsyncData(value: final folder), AsyncData(value: final filter)) =>
          _DesktopWidget(items: folder.folderItems, filter: filter),
        (AsyncError(:final error, :final stackTrace), _) ||
        (
          _,
          AsyncError(:final error, :final stackTrace),
        ) => ErrorContainerWidget(error: error, stackTrace: stackTrace),
        _ => Skeletonizer(
          child: _DesktopWidget(items: [], filter: DocumentFilterState()),
        ),
      },
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final List<DocumentFolder> items;
  final DocumentFilterState filter;

  const _DesktopWidget({required this.items, required this.filter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);

    final folders = _buildFolderTree(items);

    final controller = useTextEditingController(text: filter.search);
    final keyword = useValueListenable(controller);

    return Column(
      children: [
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Spacer(),
              CustomSvgIconButton(
                onTap: () => context.pushNamed(
                  RouteNames.documentNew,
                  queryParameters: {
                    ...GoRouterState.of(context).uri.queryParameters,
                    'folder_id': filter.folderId.toString(),
                  },
                ),
                width: 20.0,
                height: 20.0,
                asset: 'assets/icons/add-file.svg',
              ),
              if (auth is AuthAuthenticated && auth.user.isAdmin)
                CustomSvgIconButton(
                  onTap: () => context.pushNamed(
                    RouteNames.documentFolderNew,
                    queryParameters: {
                      ...GoRouterState.of(context).uri.queryParameters,
                      'folder_id': filter.folderId.toString(),
                    },
                  ),
                  width: 20.0,
                  height: 20.0,
                  asset: 'assets/icons/add-folder.svg',
                ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextField(
            controller: controller,
            style: textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: Intl.message('document_search'),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 13.0, right: 2.0),
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  width: 16.0,
                  height: 16.0,
                  colorFilter: ColorFilter.mode(
                    colorScheme.onSurface.withValues(alpha: 0.7),
                    BlendMode.srcIn,
                  ),
                  semanticsLabel: 'Search Icon',
                ),
              ),
            ),
            onSubmitted: (_) {
              final nextSearch = keyword.text.trim().isEmpty
                  ? null
                  : keyword.text.trim();

              ref
                  .read(documentFilterControllerProvider.notifier)
                  .setSearch(search: nextSearch);

              context.goNamed(
                RouteNames.document,
                queryParameters: {
                  'folder_id': filter.folderId.toString(),
                  'sort': filter.sort.key,
                  'order': filter.order.key,
                  'search': ?nextSearch,
                },
              );
            },
          ),
        ),
        SizedBox(height: 16.0),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: folders.length,
            itemBuilder: (context, index) {
              return _FolderTreeItemWidget(
                key: ValueKey(folders[index].id),
                folder: folders[index],
                filter: filter,
              );
            },
          ),
        ),
      ],
    );
  }

  List<DocumentFolder> _buildFolderTree(List<DocumentFolder> folders) {
    if (folders.every((folder) => folder.parentId == null)) {
      return _sortFolders(folders);
    }

    final childrenByParentId = <int?, List<DocumentFolder>>{};
    for (final folder in folders) {
      childrenByParentId.putIfAbsent(folder.parentId, () => []).add(folder);
    }

    List<DocumentFolder> attachChildren(int? parentId) {
      final children = _sortFolders(childrenByParentId[parentId] ?? []);

      return children.map((folder) {
        final nestedChildren = attachChildren(folder.id);
        return folder.copyWith(
          children: nestedChildren.isEmpty
              ? _sortFolders(folder.children)
              : nestedChildren,
        );
      }).toList();
    }

    return attachChildren(null);
  }

  List<DocumentFolder> _sortFolders(List<DocumentFolder> folders) {
    final sorted = [...folders];
    sorted.sort((a, b) {
      if (a.fixed != b.fixed) return a.fixed ? -1 : 1;

      final sortCompare = a.sort.compareTo(b.sort);
      if (sortCompare != 0) return sortCompare;

      return a.name.compareTo(b.name);
    });

    return sorted;
  }
}

class _FolderTreeItemWidget extends HookConsumerWidget {
  final DocumentFolder folder;
  final int depth;
  final DocumentFilterState filter;

  const _FolderTreeItemWidget({
    super.key,
    required this.folder,
    this.depth = 0,
    required this.filter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expanded = useState(depth < 1);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final hasChildren = folder.children.isNotEmpty;
    final selected = folder.id == filter.folderId;

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
                  .setFolderId(id: folder.id);

              context.goNamed(
                RouteNames.document,
                queryParameters: {
                  'folder_id': folder.id.toString(),
                  'sort': filter.sort.key,
                  'order': filter.order.key,
                  if (filter.search != null) 'search': filter.search,
                },
              );
            },
            child: SizedBox(
              height: 34.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: selected
                      ? colorScheme.primary.withValues(alpha: 0.08)
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
                                borderRadius: BorderRadius.circular(4.0),
                                onTap: () {
                                  expanded.value = !expanded.value;
                                },
                                child: Icon(
                                  expanded.value
                                      ? Symbols.keyboard_arrow_down_rounded
                                      : Symbols.keyboard_arrow_right_rounded,
                                  size: 18.0,
                                  color: colorScheme.onSurface.withValues(
                                    alpha: 0.55,
                                  ),
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
                            : colorScheme.onSurface.withValues(alpha: 0.7),
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
                                : colorScheme.onSurface.withValues(alpha: 0.7),
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
            _FolderTreeItemWidget(
              key: ValueKey(child.id),
              folder: child,
              depth: depth + 1,
              filter: filter,
            ),
      ],
    );
  }
}
