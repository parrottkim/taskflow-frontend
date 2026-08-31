part of '../widget.dart';

class UserDepartmentSegmentWidget extends HookConsumerWidget {
  final UserFilterScope scope;
  final UserDepartment? department;
  final List<UserDepartment> departmentItems;

  const UserDepartmentSegmentWidget({
    super.key,
    this.scope = UserFilterScope.userSelectorDialog,
    required this.department,
    required this.departmentItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [null, ...departmentItems];
    final selectedItem = useState<UserDepartment?>(department ?? items.first);
    final controller = useTabController(initialLength: items.length);

    return TabBar(
      controller: controller,
      onTap: (index) async {
        selectedItem.value = items[index];
        ref
            .read(userFilterControllerProvider(scope).notifier)
            .setDepartment(department: selectedItem.value);
      },
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      tabs: List.generate(
        items.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            items[index]?.name ??
                Intl.message('project_form_user_department_all'),
          ),
        ),
      ),
    );
  }
}

class UserDepartmentFilterWidget extends HookWidget {
  final UserDepartment? department;
  final List<UserDepartmentGroup> departmentGroups;
  final List<UserDepartment> departmentItems;
  final ValueChanged<UserDepartment?>? onChanged;
  final ValueChanged<List<UserDepartment>>? onPathChanged;

  const UserDepartmentFilterWidget({
    super.key,
    required this.department,
    required this.departmentGroups,
    required this.departmentItems,
    this.onChanged,
    this.onPathChanged,
  });

  @override
  Widget build(BuildContext context) {
    final selectedPath = useState<List<UserDepartment>>(
      _getSelectedPath(department),
    );

    useEffect(() {
      selectedPath.value = _getSelectedPath(department);
      return null;
    }, [department, departmentGroups, departmentItems]);

    return BreadcrumbDropdownButton<UserDepartment>(
      items: departmentItems,
      selectedPath: selectedPath,
      icon: const Icon(Symbols.category_rounded),
      label: Intl.message('project_form_user_department'),
      itemBuilder: (value) => Text(value.name),
      getNextLevelItems: (currentPath, allItems) =>
          _getNextLevelItems(currentPath),
      getParentItem: (currentPath, allItems, selectedItem) =>
          _getParentItem(currentPath, selectedItem),
      onChanged: (newPath) {
        onPathChanged?.call(newPath);
        onChanged?.call(newPath.isEmpty ? null : newPath.last);
      },
    );
  }

  List<UserDepartment> _getSelectedPath(UserDepartment? selectedDepartment) {
    if (selectedDepartment == null || departmentGroups.isEmpty) return [];

    final departmentsById = {for (final item in departmentItems) item.id: item};
    final path = <UserDepartment>[];
    var current = departmentsById[selectedDepartment.id];

    while (current != null) {
      path.insert(0, current);

      final parentId = _getParentId(current);
      current = parentId == null ? null : departmentsById[parentId];
    }

    return path;
  }

  List<UserDepartment> _getNextLevelItems(List<UserDepartment> currentPath) {
    if (departmentGroups.isEmpty) return departmentItems;

    final depth = currentPath.length;
    final parentId = currentPath.isEmpty ? null : currentPath.last.id;

    return departmentGroups
        .where((group) => group.depth == depth && group.parentId == parentId)
        .expand((group) => group.items)
        .toList();
  }

  UserDepartment? _getParentItem(
    List<UserDepartment> currentPath,
    UserDepartment selectedItem,
  ) {
    final index = currentPath.indexWhere((item) => item.id == selectedItem.id);
    if (index > 0) return currentPath[index - 1];

    final parentId = _getParentId(selectedItem);
    if (parentId == null) return null;

    return departmentItems.firstWhereOrNull((item) => item.id == parentId);
  }

  int? _getParentId(UserDepartment item) {
    final itemGroup = departmentGroups.firstWhereOrNull(
      (group) => group.items.any((department) => department.id == item.id),
    );

    if (itemGroup == null || itemGroup.depth == 0) return null;

    return item.root ?? itemGroup.parentId;
  }
}

class UserPositionFilterWidget extends StatelessWidget {
  final UserPosition? position;
  final List<UserPosition> positionItems;
  final ValueChanged<UserPosition?> onChanged;

  const UserPositionFilterWidget({
    super.key,
    required this.position,
    required this.positionItems,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedDropdownButton(
      onChanged: onChanged,
      onClear: () => onChanged(null),
      items: positionItems,
      value: position,
      icon: const Icon(Symbols.chair_rounded),
      label: Text(
        position == null
            ? Intl.message('project_form_user_position')
            : position!.name,
      ),
      itemBuilder: (value) => Text(value.name),
    );
  }
}

enum UserSelectionType { single, multiple }

UserDepartment? _findUserDepartment({
  required List<UserDepartment> items,
  required int? departmentId,
}) {
  if (departmentId == null) return null;

  for (final item in items) {
    if (item.id == departmentId) return item;
  }

  return null;
}

UserPosition? _findUserPosition({
  required List<UserPosition> items,
  required int? positionId,
}) {
  if (positionId == null) return null;

  for (final item in items) {
    if (item.id == positionId) return item;
  }

  return null;
}

class UserSelectorDialog extends HookConsumerWidget {
  final UserSelectionType selectionType;
  final bool selectable;
  final List<User> initialSelectedUsers;
  final ValueChanged<User>? onSingleSelected;
  final ValueChanged<List<User>>? onMultiSelected;

  const UserSelectorDialog({
    super.key,
    this.selectionType = UserSelectionType.single,
    this.selectable = false,
    this.initialSelectedUsers = const [],
    this.onSingleSelected,
    this.onMultiSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final filter = ref.watch(
      userFilterControllerProvider(UserFilterScope.userSelectorDialog),
    );
    final options = ref.watch(userOptionsProvider);
    final user = ref.watch(
      userListControllerProvider(UserFilterScope.userSelectorDialog),
    );

    final searchController = useTextEditingController();
    final selectedUsers = useState<List<User>>(initialSelectedUsers);

    final isSelectableMode =
        selectable || selectionType == UserSelectionType.multiple;

    bool hasUser(List<User> users, User user) {
      return users.any((element) => element.id == user.id);
    }

    Set<int> selectedIdsOf(List<User> users) {
      return users.map((item) => item.id).toSet();
    }

    void toggleUser(User target) {
      final current = List<User>.from(selectedUsers.value);
      final exists = hasUser(current, target);

      if (exists) {
        current.removeWhere((item) => item.id == target.id);
      } else {
        current.add(target);
      }

      selectedUsers.value = current;
    }

    void toggleSelectAll(List<User> visibleItems) {
      if (visibleItems.isEmpty) return;

      final current = List<User>.from(selectedUsers.value);
      final selectedIds = selectedIdsOf(current);
      final allVisibleSelected = visibleItems.every(
        (item) => selectedIds.contains(item.id),
      );

      if (allVisibleSelected) {
        final visibleIds = visibleItems.map((item) => item.id).toSet();
        current.removeWhere((item) => visibleIds.contains(item.id));
      } else {
        for (final item in visibleItems) {
          if (!selectedIds.contains(item.id)) {
            current.add(item);
            selectedIds.add(item.id);
          }
        }
      }

      selectedUsers.value = current;
    }

    final visibleItems = user.asData?.value.items ?? const <User>[];
    final selectedIds = selectedIdsOf(selectedUsers.value);
    final allVisibleSelected =
        visibleItems.isNotEmpty &&
        visibleItems.every((item) => selectedIds.contains(item.id));

    return Dialog(
      child: ContentContainer(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(8.0),
        constraints: const BoxConstraints(maxWidth: 430.0, maxHeight: 600.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: Intl.message('project_form_user_search'),
                contentPadding: const EdgeInsets.fromLTRB(
                  12.0,
                  18.0,
                  12.0,
                  14.0,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 2.0),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 20.0,
                    height: 20.0,
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSurface.strong,
                      BlendMode.srcIn,
                    ),
                    semanticsLabel: 'Search Icon',
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              onChanged: (value) => ref
                  .read(
                    userFilterControllerProvider(
                      UserFilterScope.userSelectorDialog,
                    ).notifier,
                  )
                  .debounceSearch(search: value),
            ),
            switch (options) {
              AsyncData(value: final options) => Column(
                children: [
                  UserDepartmentSegmentWidget(
                    department: _findUserDepartment(
                      items: options.departmentItems,
                      departmentId: filter.departments?.lastOrNull,
                    ),
                    departmentItems: options.departmentItems,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Row(
                      children: [
                        UserPositionFilterWidget(
                          position: _findUserPosition(
                            items: options.positionItems,
                            positionId: filter.positionId,
                          ),
                          positionItems: options.positionItems,
                          onChanged: (value) => ref
                              .read(
                                userFilterControllerProvider(
                                  UserFilterScope.userSelectorDialog,
                                ).notifier,
                              )
                              .setPosition(position: value),
                        ),
                        if (isSelectableMode) const Spacer(),
                        if (isSelectableMode)
                          TextButton(
                            onPressed: visibleItems.isEmpty
                                ? null
                                : () => toggleSelectAll(visibleItems),
                            child: Text(
                              allVisibleSelected
                                  ? Intl.message('filter_unselect_all')
                                  : Intl.message('filter_select_all'),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              AsyncError(:final error, :final stackTrace) => ErrorStateView(
                error: error,
                stackTrace: stackTrace,
              ),
              _ => Skeletonizer(
                child: Column(
                  children: [
                    UserDepartmentSegmentWidget(
                      department: null,
                      departmentItems: List.filled(4, UserDepartment.dummy()),
                      scope: UserFilterScope.userSelectorDialog,
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      child: Row(
                        children: [
                          Skeletonizer(
                            ignoreContainers: true,
                            child: UserPositionFilterWidget(
                              position: null,
                              positionItems: List.filled(
                                4,
                                UserPosition.dummy(),
                              ),
                              onChanged: (_) {},
                            ),
                          ),
                          if (isSelectableMode) const Spacer(),
                          if (isSelectableMode)
                            TextButton(
                              onPressed: visibleItems.isEmpty
                                  ? null
                                  : () => toggleSelectAll(visibleItems),
                              child: Text(
                                allVisibleSelected
                                    ? Intl.message('filter_unselect_all')
                                    : Intl.message('filter_select_all'),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            },
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16.0),
                  ),
                ),
                child: switch (user) {
                  AsyncData(:final value) => UserListDialogWidget(
                    items: value.items,
                    selectionType: selectionType,
                    selectable: selectable,
                    selectedUserIds: selectedIds,
                    onSelected: (selectedUser) {
                      onSingleSelected?.call(selectedUser);
                      Navigator.of(context).pop();
                    },
                    onToggled: toggleUser,
                  ),
                  AsyncError(:final error, :final stackTrace) => ErrorStateView(
                    error: error,
                    stackTrace: stackTrace,
                  ),
                  _ => Skeletonizer(
                    child: UserListDialogWidget(
                      items: List.filled(5, User.dummy()),
                      selectionType: selectionType,
                      selectable: selectable,
                      selectedUserIds: selectedIds,
                    ),
                  ),
                },
              ),
            ),
            if (isSelectableMode) ...[
              const Divider(height: 1.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 12.0),
                child: Row(
                  children: [
                    Text(
                      '${selectedUsers.value.length} ${Intl.message('filter_suffix')}',
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(Intl.message('common_cancel')),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: selectedUsers.value.isNotEmpty
                          ? () {
                              onMultiSelected?.call(selectedUsers.value);
                              Navigator.of(context).pop();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(Intl.message('common_apply')),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class UserListDialogWidget extends HookConsumerWidget {
  final List<User> items;
  final UserSelectionType selectionType;
  final bool selectable;
  final Set<int> selectedUserIds;
  final ValueChanged<User>? onSelected;
  final ValueChanged<User>? onToggled;

  const UserListDialogWidget({
    super.key,
    required this.items,
    this.selectionType = UserSelectionType.single,
    this.selectable = false,
    this.selectedUserIds = const <int>{},
    this.onSelected,
    this.onToggled,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectableMode =
        selectable || selectionType == UserSelectionType.multiple;

    if (items.isEmpty) {
      return EmptyStateView(message: Intl.message('project_form_user_empty'));
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 20.0) {
          ref
              .read(
                userListControllerProvider(
                  UserFilterScope.userSelectorDialog,
                ).notifier,
              )
              .load();
        }
        return false;
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = selectedUserIds.contains(item.id);

          return ListTile(
            onTap: () {
              if (isSelectableMode) {
                onToggled?.call(item);
                return;
              }
              onSelected?.call(item);
            },
            leading: isSelectableMode
                ? AppToggleButton(
                    value: isSelected,
                    onChanged: (_) => onToggled?.call(item),
                  )
                : null,
            title: UserInfo(
              user: item,
              showDepartment: true,
              showPosition: true,
            ),
          );
        },
      ),
    );
  }
}
