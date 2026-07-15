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
import 'package:taskflow/src/presentation/screen/document/widget/folder_tree_item_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class FolderTreeWidget extends ConsumerWidget {
  const FolderTreeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folder = ref.watch(documentOptionsControllerProvider);

    return switch (folder) {
      AsyncData(value: final folder) => Responsive(
        desktop: _DesktopWidget(items: folder.folderItems),
        mobile: _MobileWidget(items: folder.folderItems),
      ),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: Responsive(
          desktop: _DesktopWidget(items: []),
          mobile: _MobileWidget(items: []),
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final List<DocumentFolder> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final filter = ref.watch(documentFilterControllerProvider);
    final auth = ref.watch(authControllerProvider);

    final folders = _buildFolderTree(items);

    final controller = useTextEditingController(text: filter.search);
    final keyword = useValueListenable(controller);

    return SizedBox(
      width: 280.0,
      child: Column(
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
                    queryParameters: buildQueryParameters(
                      context,
                      updates: {'folders': filter.folders.join(',')},
                    ),
                  ),
                  padding: 2.0,
                  width: 20.0,
                  height: 20.0,
                  asset: 'assets/icons/add-file.svg',
                ),
                if (auth is AuthAuthenticated && auth.user.isAdmin)
                  CustomSvgIconButton(
                    onTap: () => context.pushNamed(
                      RouteNames.documentFolderNew,
                      queryParameters: buildQueryParameters(
                        context,
                        updates: {'folders': filter.folders.join(',')},
                      ),
                    ),
                    padding: 2.0,
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
                suffixIcon: controller.text.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: CustomIconButton(
                          onTap: () {
                            controller.clear();

                            ref
                                .read(documentFilterControllerProvider.notifier)
                                .setSearch(search: null);

                            context.goNamed(
                              RouteNames.document,
                              queryParameters: buildQueryParameters(
                                context,
                                updates: {'search': null},
                              ),
                            );
                          },
                          padding: 0.0,
                          size: 16.0,
                          icon: Icon(Symbols.close_rounded),
                        ),
                      )
                    : null,
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
                  queryParameters: buildQueryParameters(
                    context,
                    updates: {'search': nextSearch},
                  ),
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
                return FolderTreeItemWidget(
                  key: ValueKey(folders[index].id),
                  folder: folders[index],
                  path: [folders[index].id],
                );
              },
            ),
          ),
        ],
      ),
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

class _MobileWidget extends HookConsumerWidget {
  final List<DocumentFolder> items;

  const _MobileWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final filter = ref.watch(documentFilterControllerProvider);
    final auth = ref.watch(authControllerProvider);

    final folders = _buildFolderTree(items);

    final foldersById = _getFoldersById(items);
    final selectedFolders = filter.folders
        .map((id) => foldersById[id])
        .nonNulls
        .toList();

    final controller = useTextEditingController(text: filter.search);
    final keyword = useValueListenable(controller);

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final expanded = useState(false);

    useEffect(() {
      if (expanded.value) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
      return null;
    }, [expanded.value]);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 22.0),
          child: Row(
            children: [
              Expanded(
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
                    suffixIcon: controller.text.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: CustomIconButton(
                              onTap: () {
                                controller.clear();

                                ref
                                    .read(
                                      documentFilterControllerProvider.notifier,
                                    )
                                    .setSearch(search: null);

                                context.goNamed(
                                  RouteNames.document,
                                  queryParameters: buildQueryParameters(
                                    context,
                                    updates: {'search': null},
                                  ),
                                );
                              },
                              padding: 0.0,
                              size: 16.0,
                              icon: Icon(Symbols.close_rounded),
                            ),
                          )
                        : null,
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
                      queryParameters: buildQueryParameters(
                        context,
                        updates: {'search': nextSearch},
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 8.0),
              CustomSvgIconButton(
                onTap: () => context.pushNamed(
                  RouteNames.documentNew,
                  queryParameters: buildQueryParameters(
                    context,
                    updates: {'folders': filter.folders.join(',')},
                  ),
                ),
                padding: 2.0,
                width: 20.0,
                height: 20.0,
                asset: 'assets/icons/add-file.svg',
              ),
              if (auth is AuthAuthenticated && auth.user.isAdmin)
                CustomSvgIconButton(
                  onTap: () => context.pushNamed(
                    RouteNames.documentFolderNew,
                    queryParameters: buildQueryParameters(
                      context,
                      updates: {'folders': filter.folders.join(',')},
                    ),
                  ),
                  padding: 2.0,
                  width: 20.0,
                  height: 20.0,
                  asset: 'assets/icons/add-folder.svg',
                ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 16.0),
          child: Row(
            children: [
              Icon(Symbols.folder_rounded, size: 16.0),
              SizedBox(width: 6.0),
              for (final (index, folder) in selectedFolders.indexed) ...[
                if (index > 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Icon(
                      Symbols.chevron_right_rounded,
                      size: 16.0,
                      color: colorScheme.outline,
                    ),
                  ),
                InkWell(
                  borderRadius: BorderRadius.circular(4.0),
                  onTap: index == selectedFolders.length - 1
                      ? null
                      : () {
                          final folders = filter.folders
                              .take(index + 1)
                              .toList();

                          ref
                              .read(documentFilterControllerProvider.notifier)
                              .setFolders(folders: folders);

                          context.goNamed(
                            RouteNames.document,
                            queryParameters: buildQueryParameters(
                              context,
                              updates: {'folders': folders.join(',')},
                            ),
                          );
                        },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      folder.name,
                      style: TextStyle(
                        fontWeight: selectedFolders.last == folder
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: selectedFolders.last == folder
                            ? colorScheme.onSurface
                            : colorScheme.outline,
                      ),
                    ),
                  ),
                ),
              ],
              Spacer(),
              CustomIconButton(
                onTap: () {
                  expanded.value = !expanded.value;
                },
                padding: 2.0,
                size: 16.0,
                icon: Icon(
                  expanded.value
                      ? Symbols.keyboard_arrow_up_rounded
                      : Symbols.keyboard_arrow_down_rounded,
                ),
              ),
            ],
          ),
        ),
        SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: sizeController,
            curve: Curves.easeInQuad,
          ),
          child: FadeTransition(
            opacity: opacityController,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: folders.length,
              itemBuilder: (context, index) {
                return FolderTreeItemWidget(
                  key: ValueKey(folders[index].id),
                  folder: folders[index],
                  path: [folders[index].id],
                );
              },
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  Map<int, DocumentFolder> _getFoldersById(List<DocumentFolder> folders) {
    final result = <int, DocumentFolder>{};

    void visit(DocumentFolder folder) {
      result[folder.id] = folder;
      folder.children.forEach(visit);
    }

    folders.forEach(visit);
    return result;
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
