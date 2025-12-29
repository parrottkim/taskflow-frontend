part of 'widget.dart';

class ElevatedDropdownButton<T> extends HookWidget {
  final List<T> items;
  final ValueNotifier<T?> selectedItem;
  final Widget label;
  final Widget icon;
  final Widget Function(T) itemBuilder;
  final ValueChanged<T?>? onChanged;
  final FocusNode? focus;
  final bool isExpanded;
  final bool showClose;

  const ElevatedDropdownButton({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.label,
    required this.icon,
    required this.itemBuilder,
    this.onChanged,
    this.focus,
    this.isExpanded = false,
    this.showClose = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final OverlayPortalController overlayController = OverlayPortalController();
    final link = LayerLink();
    final width = useState<double?>(null);

    return CompositedTransformTarget(
      link: link,
      child: Focus(
        focusNode: focus,
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            width.value = context.size?.width;
          }
        },
        child: OverlayPortal(
          controller: overlayController,
          overlayChildBuilder: (BuildContext context) => GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => overlayController.hide(),
            child: CompositedTransformFollower(
              link: link,
              targetAnchor: Alignment.bottomLeft,
              showWhenUnlinked: false,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Material(
                  elevation: 1.0,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: width.value ?? 0,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withValues(alpha: 0.3),
                      ),
                      color: colorScheme.surface,
                    ),
                    child: IntrinsicWidth(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: items.map((item) {
                          final isSelected = selectedItem.value == item;

                          return Material(
                            color: isSelected
                                ? colorScheme.primary.withValues(alpha: 0.1)
                                : Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                selectedItem.value = item;
                                overlayController.hide();
                                onChanged?.call(item);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: itemBuilder(item),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          child: ElevatedButton.icon(
            onPressed: () {
              overlayController.toggle();
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(
                  left: 16.0, right: 12.0, top: 16.0, bottom: 16.0),
            ),
            icon: icon,
            label: Row(
              mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
              children: [
                if (selectedItem.value != null)
                  itemBuilder(selectedItem.value as T)
                else
                  label,
                if (isExpanded) Spacer(),
                if (showClose && selectedItem.value != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        selectedItem.value = null;
                        overlayController.hide();
                        onChanged?.call(null);
                      },
                      borderRadius: BorderRadius.circular(4.0),
                      child: const Icon(Symbols.close_rounded),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Symbols.keyboard_arrow_down_rounded,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MultiSelectElevatedDropdownButton<T> extends HookWidget {
  final List<T> items;
  final ValueNotifier<List<T>> selectedItems;
  final String? label;
  final Widget icon;
  final Widget Function(T) itemBuilder;
  final ValueChanged<List<T>>? onChanged;
  final FocusNode? focus;

  const MultiSelectElevatedDropdownButton({
    super.key,
    required this.items,
    required this.selectedItems,
    this.label,
    required this.icon,
    required this.itemBuilder,
    this.onChanged,
    this.focus,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final OverlayPortalController overlayController = OverlayPortalController();
    final link = LayerLink();
    final width = useState<double?>(null);

    return CompositedTransformTarget(
      link: link,
      child: Focus(
        focusNode: focus,
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            width.value = context.size?.width;
          }
        },
        child: OverlayPortal(
          controller: overlayController,
          overlayChildBuilder: (BuildContext context) => GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => overlayController.hide(),
            child: CompositedTransformFollower(
              link: link,
              targetAnchor: Alignment.bottomLeft,
              offset: const Offset(0, 4),
              showWhenUnlinked: false,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Material(
                  elevation: 1.0,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: width.value ?? 0,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withValues(alpha: 0.3),
                      ),
                      color: colorScheme.surface,
                    ),
                    child: IntrinsicWidth(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: items.map((item) {
                          final isSelected = selectedItems.value.contains(item);
                          return Material(
                            color: isSelected
                                ? colorScheme.primary.withValues(alpha: 0.1)
                                : Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                final currentSelection =
                                    List<T>.from(selectedItems.value);
                                if (currentSelection.contains(item)) {
                                  currentSelection.remove(item);
                                } else {
                                  currentSelection.add(item);
                                }
                                selectedItems.value = currentSelection;
                                onChanged?.call(currentSelection);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  children: [
                                    IgnorePointer(
                                      child: CustomToggleButton(
                                        value: isSelected,
                                        onChanged: (_) {},
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    itemBuilder(item),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          child: ElevatedButton.icon(
            onPressed: () {
              overlayController.toggle();
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(
                  left: 16.0, right: 12.0, top: 16.0, bottom: 16.0),
            ),
            icon: icon,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                selectedItems.value.isNotEmpty
                    ? Text(
                        '${selectedItems.value.length} ${Intl.message('filter_suffix')}',
                        style: TextStyle(fontWeight: FontWeight.w600))
                    : Text(label ?? ''),
                if (selectedItems.value.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        selectedItems.value = [];
                        overlayController.hide();
                        onChanged?.call([]);
                      },
                      borderRadius: BorderRadius.circular(4.0),
                      child: const Icon(Symbols.close_rounded),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Symbols.keyboard_arrow_down_rounded,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BreadcrumbDropdownButton<T> extends HookWidget {
  final List<T> items; // All possible items, potentially nested
  final ValueNotifier<List<T>> selectedPath; // The current breadcrumb path
  final String? label;
  final Widget icon;
  final Widget Function(T) itemBuilder; // How to display each item in the list
  final ValueChanged<List<T>>? onChanged;
  final FocusNode? focus;
  final List<T> Function(List<T> currentPath, List<T> allItems)
      getNextLevelItems;
  final T? Function(List<T> currentPath, List<T> allItems, T selectedItem)
      getParentItem;

  const BreadcrumbDropdownButton({
    super.key,
    required this.items,
    required this.selectedPath,
    this.label,
    required this.icon,
    required this.itemBuilder,
    this.onChanged,
    this.focus,
    required this.getNextLevelItems,
    required this.getParentItem,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final OverlayPortalController overlayController = OverlayPortalController();
    final link = LayerLink();
    final width = useState<double?>(null);

    final currentLevelItems = useState<List<T>>(getNextLevelItems([], items));
    final currentSelectionIndex =
        useState<int>(-1); // -1 for root, 0 for first breadcrumb, etc.

    useEffect(() {
      // Reset currentLevelItems when selectedPath changes externally
      currentLevelItems.value = getNextLevelItems(selectedPath.value, items);
      currentSelectionIndex.value = selectedPath.value.length - 1;
      return null;
    }, [selectedPath.value]);

    return CompositedTransformTarget(
      link: link,
      child: Focus(
        focusNode: focus,
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            width.value = context.size?.width;
          }
        },
        child: OverlayPortal(
          controller: overlayController,
          overlayChildBuilder: (BuildContext context) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => overlayController.hide(),
            child: CompositedTransformFollower(
              link: link,
              targetAnchor: Alignment.bottomLeft,
              offset: const Offset(0, 4),
              showWhenUnlinked: false,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Material(
                  elevation: 1.0,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: width.value ?? 0,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withValues(alpha: 0.3),
                      ),
                      color: colorScheme.surface,
                    ),
                    child: IntrinsicWidth(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (currentSelectionIndex.value >= 0)
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  final newPath =
                                      List<T>.from(selectedPath.value);
                                  if (newPath.isNotEmpty) {
                                    newPath.removeLast();
                                  }
                                  selectedPath.value = newPath;
                                  onChanged?.call(newPath);
                                  currentLevelItems.value =
                                      getNextLevelItems(newPath, items);
                                  currentSelectionIndex.value =
                                      newPath.length - 1;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Symbols.arrow_back_rounded,
                                          size: 20.0),
                                      const SizedBox(width: 8.0),
                                      currentSelectionIndex.value == -1
                                          ? (Text(label ?? '')) // Root level
                                          : itemBuilder(selectedPath.value[
                                              currentSelectionIndex.value]),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ...currentLevelItems.value.map((item) {
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  final newPath =
                                      List<T>.from(selectedPath.value);
                                  newPath.add(item);
                                  selectedPath.value = newPath;
                                  onChanged?.call(newPath);
                                  currentLevelItems.value =
                                      getNextLevelItems(newPath, items);
                                  currentSelectionIndex.value =
                                      newPath.length - 1;
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0,
                                  ),
                                  child: itemBuilder(item),
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          child: ElevatedButton.icon(
            onPressed: () {
              overlayController.toggle();
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(
                  left: 16.0, right: 12.0, top: 16.0, bottom: 16.0),
            ),
            icon: icon,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (selectedPath.value.isNotEmpty)
                  ...selectedPath.value
                      .map((item) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              itemBuilder(item),
                              if (selectedPath.value.indexOf(item) <
                                  selectedPath.value.length - 1)
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  child:
                                      Icon(Symbols.chevron_right, size: 16.0),
                                ),
                            ],
                          ))
                      .toList()
                else
                  Text(label ?? ''),
                if (selectedPath.value.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        selectedPath.value = [];
                        overlayController.hide();
                        onChanged?.call([]);
                      },
                      borderRadius: BorderRadius.circular(4.0),
                      child: const Icon(Symbols.close_rounded),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Symbols.keyboard_arrow_down_rounded,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
