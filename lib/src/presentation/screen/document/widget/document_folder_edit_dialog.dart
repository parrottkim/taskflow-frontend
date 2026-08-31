import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class DocumentFolderEditDialog extends ConsumerWidget {
  const DocumentFolderEditDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(documentOptionsControllerProvider);

    return switch (options) {
      AsyncData(:final value) => _DialogWidget(
        initialFolders: value.folderItems,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorDialog(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(child: _DialogWidget(initialFolders: const [])),
    };
  }
}

class _DialogWidget extends HookConsumerWidget {
  final List<DocumentFolder> initialFolders;

  const _DialogWidget({required this.initialFolders});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final folders = useState(_sortFolders(initialFolders));
    final isAddingFolder = useState(false);
    final activeAddParentId = useState<int?>(null);
    final activeEditFolderId = useState<int?>(null);
    final dropTarget = useState<_FolderDropTarget?>(null);

    void openAddFolder(int? parentId) {
      activeAddParentId.value = parentId;
      isAddingFolder.value = true;
      activeEditFolderId.value = null;
    }

    void createFolder(String name) {
      final folder = DocumentFolder(
        id: -DateTime.now().microsecondsSinceEpoch,
        name: name,
        parentId: activeAddParentId.value,
      );

      folders.value = _addFolder(folders.value, folder);
      isAddingFolder.value = false;
      activeAddParentId.value = null;
    }

    void openEditFolder(DocumentFolder folder) {
      isAddingFolder.value = false;
      activeAddParentId.value = null;
      activeEditFolderId.value = folder.id;
    }

    void updateFolderName(DocumentFolder folder, String name) {
      folders.value = _renameFolder(folders.value, folder.id, name);
      activeEditFolderId.value = null;
    }

    void moveFolder(DocumentFolder dragged, _FolderDropTarget target) {
      folders.value = _moveFolderTo(
        folders.value,
        folderId: dragged.id,
        parentId: target.parentId,
        beforeId: target.beforeId,
      );
      dropTarget.value = null;
    }

    Future<void> deleteFolder(DocumentFolder folder) async {
      if (folder.fixed) return;

      final result = await showDialog<bool>(
        context: context,
        builder: (_) => DeleteDialog(
          title: Intl.message('document_folder_delete_dialog_1'),
          content: Intl.message('document_folder_delete_dialog_2'),
        ),
      );

      if (result != true) return;

      folders.value = _removeFolder(folders.value, folder.id);

      if (activeAddParentId.value == folder.id) {
        isAddingFolder.value = false;
        activeAddParentId.value = null;
      }

      if (activeEditFolderId.value == folder.id) {
        activeEditFolderId.value = null;
      }
    }

    Future<void> save() async {
      final nextFolders = _applySortIndexes(folders.value);

      await ref
          .read(documentSubmitControllerProvider.notifier)
          .syncFolders(folders: nextFolders);
    }

    final rows = _flattenFolders(folders.value);

    Widget buildDialog({required bool fullScreen}) => BaseDialog(
      title: Intl.message('document_folder_edit_title'),
      maxWidth: 560.0,
      maxHeight: 720.0,
      fullScreen: fullScreen,
      showTitle: !fullScreen,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: fullScreen ? double.infinity : 420.0,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          itemBuilder: (context, index) {
            if (index == rows.length) {
              return Column(
                key: const ValueKey('folder-add-root'),
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FolderDropLine(
                    target: const _FolderDropTarget(parentId: null),
                    activeTarget: dropTarget.value,
                    canAccept: (dragged) => _canMoveFolderTo(
                      folders.value,
                      folderId: dragged.id,
                      parentId: null,
                    ),
                    onEntered: (target) => dropTarget.value = target,
                    onExited: () => dropTarget.value = null,
                    onAccept: moveFolder,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 40.0,
                      child: Row(
                        children: [
                          const SizedBox(width: 24.0),
                          const SizedBox(width: 8.0),
                          AppIconButton(
                            onTap: () => openAddFolder(null),
                            padding: 3.0,
                            icon: const Icon(Symbols.add_rounded, size: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _FolderNameInput(
                    visible:
                        isAddingFolder.value && activeAddParentId.value == null,
                    depth: 0,
                    onSubmit: createFolder,
                    onCancel: () {
                      isAddingFolder.value = false;
                      activeAddParentId.value = null;
                    },
                  ),
                ],
              );
            }

            final row = rows[index];
            final folder = row.folder;
            final canManage = !folder.fixed;
            final childDropTarget = _FolderDropTarget(parentId: folder.id);

            return Column(
              key: ValueKey('folder-${folder.id}'),
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FolderDropLine(
                  target: _FolderDropTarget(
                    parentId: folder.parentId,
                    beforeId: folder.id,
                  ),
                  activeTarget: dropTarget.value,
                  canAccept: (dragged) => _canMoveFolderTo(
                    folders.value,
                    folderId: dragged.id,
                    parentId: folder.parentId,
                    beforeId: folder.id,
                  ),
                  onEntered: (target) => dropTarget.value = target,
                  onExited: () => dropTarget.value = null,
                  onAccept: moveFolder,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.0 + row.depth * 18.0,
                    right: 16.0,
                  ),
                  child: DragTarget<DocumentFolder>(
                    onWillAcceptWithDetails: (details) => _canMoveFolderTo(
                      folders.value,
                      folderId: details.data.id,
                      parentId: folder.id,
                    ),
                    onMove: (_) => dropTarget.value = childDropTarget,
                    onLeave: (_) => dropTarget.value = null,
                    onAcceptWithDetails: (details) =>
                        moveFolder(details.data, childDropTarget),
                    builder: (context, _, _) {
                      final isChildDropActive =
                          dropTarget.value == childDropTarget;

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: isChildDropActive
                              ? colorScheme.primaryContainer.muted
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: SizedBox(
                          height: 40.0,
                          child: Row(
                            children: [
                              _FolderDragHandle(
                                folder: folder,
                                enabled: canManage,
                              ),
                              const SizedBox(width: 8.0),
                              Icon(
                                folder.children.isEmpty
                                    ? Symbols.folder_rounded
                                    : Symbols.folder_open_rounded,
                                fill: 1.0,
                                size: 18.0,
                                color: colorScheme.onSurface.strong,
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        folder.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    if (folder.fixed) ...[
                                      const SizedBox(width: 4.0),
                                      Icon(
                                        Symbols.lock_rounded,
                                        size: 14.0,
                                        color: colorScheme.onSurface.muted,
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              AppIconButton(
                                onTap: () => openAddFolder(folder.id),
                                padding: 3.0,
                                icon: const Icon(
                                  Symbols.add_rounded,
                                  size: 16.0,
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              MenuAnchor(
                                alignmentOffset: const Offset(-112.0, 0.0),
                                builder: (context, controller, child) {
                                  return AppIconButton(
                                    onTap: canManage
                                        ? () {
                                            if (controller.isOpen) {
                                              controller.close();
                                            } else {
                                              controller.open();
                                            }
                                          }
                                        : null,
                                    padding: 3.0,
                                    icon: const Icon(
                                      Symbols.more_vert_rounded,
                                      size: 16.0,
                                    ),
                                  );
                                },
                                menuChildren: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: MenuItemButton(
                                      onPressed: canManage
                                          ? () => openEditFolder(folder)
                                          : null,
                                      leadingIcon: const Icon(
                                        Symbols.edit_square_rounded,
                                        size: 18.0,
                                      ),
                                      child: Text(Intl.message('common_edit')),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: MenuItemButton(
                                      onPressed: canManage
                                          ? () async =>
                                                await deleteFolder(folder)
                                          : null,
                                      leadingIcon: Icon(
                                        Symbols.delete_rounded,
                                        size: 18.0,
                                        color: canManage
                                            ? colorScheme.error
                                            : null,
                                      ),
                                      child: Text(
                                        Intl.message('common_delete'),
                                        style: TextStyle(
                                          color: canManage
                                              ? colorScheme.error
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                _FolderNameInput(
                  visible:
                      isAddingFolder.value &&
                      activeAddParentId.value == folder.id,
                  depth: row.depth + 1,
                  onSubmit: createFolder,
                  onCancel: () {
                    isAddingFolder.value = false;
                    activeAddParentId.value = null;
                  },
                ),
                _FolderNameInput(
                  visible: activeEditFolderId.value == folder.id,
                  depth: row.depth,
                  initialName: folder.name,
                  onSubmit: (name) => updateFolderName(folder, name),
                  onCancel: () {
                    activeEditFolderId.value = null;
                  },
                ),
              ],
            );
          },
          itemCount: rows.length + 1,
        ),
      ),
      actions: [
        Skeleton.unite(
          child: ElevatedButton(
            onPressed: () => context.pop(),
            child: Text(Intl.message('common_cancel')),
          ),
        ),
        Skeleton.unite(
          child: ElevatedButton(
            onPressed: save,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
            ),
            child: Text(
              Intl.message('저장', name: 'common_save'),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );

    return Responsive(
      desktop: buildDialog(fullScreen: false),
      mobile: FullScreenDialogLayout(
        title: Intl.message('document_folder_edit_title'),
        child: buildDialog(fullScreen: true),
      ),
    );
  }

  static Widget _buildFolderDragFeedback(
    BuildContext context,
    DocumentFolder folder,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(4.0),
      color: colorScheme.surface,
      child: Container(
        width: 220.0,
        height: 40.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Icon(
              folder.children.isEmpty
                  ? Symbols.folder_rounded
                  : Symbols.folder_open_rounded,
              fill: 1.0,
              size: 18.0,
              color: colorScheme.onSurface.strong,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                folder.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static List<DocumentFolder> _sortFolders(List<DocumentFolder> folders) {
    final sorted = [...folders]..sort(_compareFolder);

    return sorted
        .map(
          (folder) => folder.copyWith(children: _sortFolders(folder.children)),
        )
        .toList();
  }

  static int _compareFolder(DocumentFolder a, DocumentFolder b) {
    if (a.fixed != b.fixed) return a.fixed ? -1 : 1;

    final sortCompare = a.sort.compareTo(b.sort);
    if (sortCompare != 0) return sortCompare;

    return a.name.compareTo(b.name);
  }

  static List<_FolderRow> _flattenFolders(List<DocumentFolder> folders) {
    final rows = <_FolderRow>[];

    void visit(DocumentFolder folder, int depth) {
      rows.add(_FolderRow(folder: folder, depth: depth));

      for (final child in folder.children) {
        visit(child, depth + 1);
      }
    }

    for (final folder in folders) {
      visit(folder, 0);
    }

    return rows;
  }

  static List<DocumentFolder> _addFolder(
    List<DocumentFolder> folders,
    DocumentFolder folder,
  ) {
    if (folder.parentId == null) {
      return [...folders, folder.copyWith(sort: folders.length)];
    }

    return folders.map((item) {
      if (item.id == folder.parentId) {
        return item.copyWith(
          children: [
            ...item.children,
            folder.copyWith(sort: item.children.length),
          ],
        );
      }

      return item.copyWith(children: _addFolder(item.children, folder));
    }).toList();
  }

  static List<DocumentFolder> _removeFolder(
    List<DocumentFolder> folders,
    int folderId,
  ) {
    return folders
        .where((folder) => folder.id != folderId || folder.fixed)
        .map(
          (folder) => folder.copyWith(
            children: _removeFolder(folder.children, folderId),
          ),
        )
        .toList();
  }

  static List<DocumentFolder> _renameFolder(
    List<DocumentFolder> folders,
    int folderId,
    String name,
  ) {
    return folders.map((folder) {
      if (folder.id == folderId) {
        if (folder.fixed) return folder;

        return folder.copyWith(name: name);
      }

      return folder.copyWith(
        children: _renameFolder(folder.children, folderId, name),
      );
    }).toList();
  }

  static List<DocumentFolder> _moveFolderTo(
    List<DocumentFolder> folders, {
    required int folderId,
    required int? parentId,
    int? beforeId,
  }) {
    if (!_canMoveFolderTo(
      folders,
      folderId: folderId,
      parentId: parentId,
      beforeId: beforeId,
    )) {
      return folders;
    }

    final dragged = _findFolder(folders, folderId);
    if (dragged == null) return folders;

    final withoutDragged = _removeFolder(folders, folderId);
    final targetSiblings = _siblingsOf(withoutDragged, parentId);
    final nextSiblings = [...targetSiblings];
    var insertIndex = beforeId == null
        ? nextSiblings.length
        : nextSiblings.indexWhere((folder) => folder.id == beforeId);

    if (insertIndex < 0) insertIndex = nextSiblings.length;

    final fixedCount = nextSiblings.takeWhile((folder) => folder.fixed).length;
    insertIndex = insertIndex.clamp(fixedCount, nextSiblings.length);

    nextSiblings.insert(insertIndex, dragged.copyWith(parentId: parentId));

    return _replaceSiblings(withoutDragged, parentId, nextSiblings);
  }

  static bool _canMoveFolderTo(
    List<DocumentFolder> folders, {
    required int folderId,
    required int? parentId,
    int? beforeId,
  }) {
    final dragged = _findFolder(folders, folderId);

    if (dragged == null || dragged.fixed) return false;
    if (beforeId == folderId) return false;
    if (parentId == dragged.parentId && beforeId == folderId) return false;
    if (parentId != null && _containsFolderId(dragged, parentId)) return false;

    final beforeFolder = beforeId == null
        ? null
        : _findFolder(folders, beforeId);
    if (beforeFolder?.fixed == true) return false;

    return true;
  }

  static DocumentFolder? _findFolder(List<DocumentFolder> folders, int id) {
    for (final folder in folders) {
      if (folder.id == id) return folder;

      final child = _findFolder(folder.children, id);
      if (child != null) return child;
    }

    return null;
  }

  static bool _containsFolderId(DocumentFolder folder, int id) {
    if (folder.id == id) return true;

    for (final child in folder.children) {
      if (_containsFolderId(child, id)) return true;
    }

    return false;
  }

  static List<DocumentFolder> _siblingsOf(
    List<DocumentFolder> folders,
    int? parentId,
  ) {
    if (parentId == null) return folders;

    for (final folder in folders) {
      if (folder.id == parentId) return folder.children;

      final nested = _siblingsOf(folder.children, parentId);
      if (nested.isNotEmpty) return nested;
    }

    return const [];
  }

  static List<DocumentFolder> _replaceSiblings(
    List<DocumentFolder> folders,
    int? parentId,
    List<DocumentFolder> siblings,
  ) {
    if (parentId == null) return siblings;

    return folders.map((folder) {
      if (folder.id == parentId) {
        return folder.copyWith(children: siblings);
      }

      return folder.copyWith(
        children: _replaceSiblings(folder.children, parentId, siblings),
      );
    }).toList();
  }

  static List<DocumentFolder> _applySortIndexes(List<DocumentFolder> folders) {
    return folders.indexed.map((entry) {
      final (index, folder) = entry;

      return folder.copyWith(
        sort: folder.fixed ? folder.sort : index,
        children: _applySortIndexes(folder.children),
      );
    }).toList();
  }
}

class _FolderRow {
  final DocumentFolder folder;
  final int depth;

  const _FolderRow({required this.folder, required this.depth});
}

class _FolderDropTarget {
  final int? parentId;
  final int? beforeId;

  const _FolderDropTarget({required this.parentId, this.beforeId});

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _FolderDropTarget &&
            parentId == other.parentId &&
            beforeId == other.beforeId;
  }

  @override
  int get hashCode => Object.hash(parentId, beforeId);
}

class _FolderDropLine extends StatelessWidget {
  final _FolderDropTarget target;
  final _FolderDropTarget? activeTarget;
  final bool Function(DocumentFolder folder) canAccept;
  final ValueChanged<_FolderDropTarget> onEntered;
  final VoidCallback onExited;
  final void Function(DocumentFolder folder, _FolderDropTarget target) onAccept;

  const _FolderDropLine({
    required this.target,
    required this.activeTarget,
    required this.canAccept,
    required this.onEntered,
    required this.onExited,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isActive = activeTarget == target;

    return DragTarget<DocumentFolder>(
      onWillAcceptWithDetails: (details) => canAccept(details.data),
      onMove: (_) => onEntered(target),
      onLeave: (_) => onExited(),
      onAcceptWithDetails: (details) => onAccept(details.data, target),
      builder: (context, _, _) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          height: isActive ? 10.0 : 6.0,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            height: isActive ? 2.0 : 0.0,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(999.0),
            ),
          ),
        );
      },
    );
  }
}

class _FolderDragHandle extends StatelessWidget {
  final DocumentFolder folder;
  final bool enabled;

  const _FolderDragHandle({required this.folder, required this.enabled});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final icon = Icon(
      Symbols.drag_indicator_rounded,
      size: 18.0,
      color: enabled
          ? colorScheme.onSurface.strong
          : colorScheme.onSurface.subtle,
    );

    if (!enabled) {
      return SizedBox(width: 24.0, child: icon);
    }

    return LongPressDraggable<DocumentFolder>(
      data: folder,
      delay: const Duration(milliseconds: 160),
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: _DialogWidget._buildFolderDragFeedback(context, folder),
      childWhenDragging: Opacity(opacity: 0.32, child: icon),
      child: SizedBox(width: 24.0, child: icon),
    );
  }
}

class _FolderNameInput extends HookWidget {
  final bool visible;
  final int depth;
  final String? initialName;
  final ValueChanged<String> onSubmit;
  final VoidCallback onCancel;

  const _FolderNameInput({
    required this.visible,
    required this.depth,
    this.initialName,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    useListenable(controller);
    final hasError = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 180),
      initialValue: visible ? 1.0 : 0.0,
    );
    final animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    useEffect(() {
      if (visible) {
        controller.text = initialName ?? '';
        controller.selection = TextSelection.collapsed(
          offset: controller.text.length,
        );
        hasError.value = false;
        animationController.forward();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (focusNode.canRequestFocus) focusNode.requestFocus();
        });
      } else {
        animationController.reverse();
      }

      return null;
    }, [visible]);

    void submit() {
      final name = controller.text.trim();
      hasError.value = name.isEmpty;

      if (hasError.value) return;

      onSubmit(name);
    }

    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: -1.0,
      child: FadeTransition(
        opacity: animation,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0 + depth * 18.0,
            right: 16.0,
            bottom: hasError.value ? 8.0 : 0.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: hasError.value
                          ? colorScheme.error
                          : colorScheme.outline.faint,
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 40.0,
                  child: Row(
                    children: [
                      const SizedBox(width: 24.0),
                      const SizedBox(width: 8.0),
                      Icon(
                        Symbols.folder_rounded,
                        fill: 1.0,
                        size: 18.0,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            if (controller.text.isEmpty)
                              Text(
                                Intl.message('document_folder_name_hint'),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurface.muted,
                                ),
                              ),
                            EditableText(
                              controller: controller,
                              focusNode: focusNode,
                              style:
                                  textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ) ??
                                  TextStyle(
                                    color: colorScheme.onSurface,
                                    fontWeight: FontWeight.w500,
                                  ),
                              cursorColor: colorScheme.primary,
                              backgroundCursorColor: colorScheme.primary.subtle,
                              textInputAction: TextInputAction.done,
                              maxLines: 1,
                              onChanged: (_) {
                                if (hasError.value) hasError.value = false;
                              },
                              onSubmitted: (_) => submit(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      AppIconButton(
                        onTap: submit,
                        padding: 3.0,
                        icon: Icon(
                          Symbols.check_rounded,
                          size: 16.0,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      AppIconButton(
                        onTap: onCancel,
                        padding: 3.0,
                        icon: const Icon(Symbols.close_rounded, size: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 140),
                child: hasError.value
                    ? Padding(
                        key: const ValueKey('folder-name-error'),
                        padding: const EdgeInsets.only(left: 58.0, top: 4.0),
                        child: Text(
                          Intl.message('document_folder_name_required'),
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.error,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
