import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DocumentFolderSelectorWidget extends ConsumerWidget {
  final int? folderId;
  final int? excludeFolderId;
  final String? label;
  final ValueNotifier<bool>? isFolderEmpty;
  final ValueChanged<int?>? onChanged;

  const DocumentFolderSelectorWidget({
    super.key,
    this.folderId,
    this.excludeFolderId,
    this.label,
    this.isFolderEmpty,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(documentOptionsControllerProvider);

    return switch (options) {
      AsyncData(:final value) => _DesktopWidget(
        folderId: folderId,
        excludeFolderId: excludeFolderId,
        label: label,
        folders: value.folderItems,
        isFolderEmpty: isFolderEmpty,
        onChanged: onChanged,
      ),
      _ => Skeletonizer(
        ignoreContainers: true,
        child: _DesktopWidget(
          label: label,
          excludeFolderId: excludeFolderId,
          isFolderEmpty: isFolderEmpty,
          onChanged: onChanged,
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int? folderId;
  final int? excludeFolderId;
  final String? label;
  final List<DocumentFolder> folders;
  final ValueNotifier<bool>? isFolderEmpty;
  final ValueChanged<int?>? onChanged;

  const _DesktopWidget({
    this.folderId,
    this.excludeFolderId,
    this.label,
    this.folders = const [],
    this.isFolderEmpty,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folderItems = useMemoized(() => _flattenFolders(folders), [folders]);
    final selectableFolderItems = useMemoized(
      () => _excludeFolders(folderItems, excludeFolderId),
      [folderItems, excludeFolderId],
    );
    final selectedPath = useState<List<DocumentFolder>>(
      _getSelectedPath(folderId, selectableFolderItems),
    );

    useEffect(() {
      selectedPath.value = _getSelectedPath(folderId, selectableFolderItems);
      return null;
    }, [folderId, selectableFolderItems]);

    return BreadcrumbDropdownButton<DocumentFolder>(
      items: selectableFolderItems,
      selectedPath: selectedPath,
      label: label ?? Intl.message('document_folder_select'),
      icon: const Icon(Symbols.folder_rounded),
      itemBuilder: (item) => Text(item.name),
      getNextLevelItems: (currentPath, allItems) =>
          _getNextLevelItems(currentPath, allItems),
      getParentItem: (currentPath, allItems, selectedItem) =>
          _getParentItem(currentPath, allItems, selectedItem),
      onChanged: (newPath) {
        selectedPath.value = newPath;

        final selectedFolder = newPath.lastOrNull;
        if (selectedFolder == null) {
          onChanged?.call(null);
          return;
        }

        onChanged?.call(selectedFolder.id);
        isFolderEmpty?.value = false;
      },
    );
  }

  List<DocumentFolder> _flattenFolders(List<DocumentFolder> folders) {
    final result = <DocumentFolder>[];

    void visit(DocumentFolder folder) {
      result.add(folder);

      final children = [...folder.children]..sort(_compareFolder);
      for (final child in children) {
        visit(child);
      }
    }

    final sortedFolders = [...folders]..sort(_compareFolder);
    for (final folder in sortedFolders) {
      visit(folder);
    }

    return result;
  }

  List<DocumentFolder> _excludeFolders(
    List<DocumentFolder> folders,
    int? excludeFolderId,
  ) {
    if (excludeFolderId == null) return folders;

    final excludedIds = <int>{excludeFolderId};
    var changed = true;

    while (changed) {
      changed = false;

      for (final folder in folders) {
        if (folder.parentId != null &&
            excludedIds.contains(folder.parentId) &&
            excludedIds.add(folder.id)) {
          changed = true;
        }
      }
    }

    return folders.where((folder) => !excludedIds.contains(folder.id)).toList();
  }

  List<DocumentFolder> _getSelectedPath(
    int? selectedFolderId,
    List<DocumentFolder> folderItems,
  ) {
    if (selectedFolderId == null || folderItems.isEmpty) return [];

    final foldersById = {for (final item in folderItems) item.id: item};
    final path = <DocumentFolder>[];
    var current = foldersById[selectedFolderId];

    while (current != null) {
      path.insert(0, current);
      current = current.parentId == null ? null : foldersById[current.parentId];
    }

    return path;
  }

  List<DocumentFolder> _getNextLevelItems(
    List<DocumentFolder> currentPath,
    List<DocumentFolder> allItems,
  ) {
    final parentId = currentPath.isEmpty ? null : currentPath.last.id;
    return allItems.where((item) => item.parentId == parentId).toList()
      ..sort(_compareFolder);
  }

  DocumentFolder? _getParentItem(
    List<DocumentFolder> currentPath,
    List<DocumentFolder> allItems,
    DocumentFolder selectedItem,
  ) {
    final index = currentPath.indexWhere((item) => item.id == selectedItem.id);
    if (index > 0) return currentPath[index - 1];

    return selectedItem.parentId == null
        ? null
        : allItems.firstWhereOrNull((item) => item.id == selectedItem.parentId);
  }

  int _compareFolder(DocumentFolder a, DocumentFolder b) {
    if (a.fixed != b.fixed) return a.fixed ? -1 : 1;

    final sortCompare = a.sort.compareTo(b.sort);
    if (sortCompare != 0) return sortCompare;

    return a.name.compareTo(b.name);
  }
}
