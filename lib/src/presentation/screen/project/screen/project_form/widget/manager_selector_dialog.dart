import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_form/widget/user_department_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_form/widget/user_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_form/widget/user_position_filter_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ManagerSelectorDialog extends HookConsumerWidget {
  final int? projectId;
  final List<UserDepartment> departmentItems;
  final List<UserPosition> positionItems;

  const ManagerSelectorDialog({
    super.key,
    this.projectId,
    required this.departmentItems,
    required this.positionItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final user = ref.watch(userListControllerProvider);

    final searchController = useTextEditingController();

    return Dialog(
      child: ContainerWidget(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(8.0),
        constraints: BoxConstraints(maxWidth: 430.0, maxHeight: 600.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: Intl.message('project_form_user_search'),
                contentPadding: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 14.0),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 2.0),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 20.0,
                    height: 20.0,
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSurface.withValues(alpha: 0.7),
                      BlendMode.srcIn,
                    ),
                    semanticsLabel: 'Search Icon',
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              onChanged: (value) => ref
                  .read(userFilterControllerProvider.notifier)
                  .updateSearch(search: value),
            ),
            UserDepartmentFilterWidget(departmentItems: departmentItems),
            Divider(),
            UserPositionFilterWidget(positionItems: positionItems),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16.0),
                  ),
                ),
                child: switch (user) {
                  AsyncData(:final value) => UserListWidget(
                    projectId: projectId,
                    items: value.items,
                  ),
                  AsyncError(:final error, :final stackTrace) =>
                    ErrorContainerWidget(error: error, stackTrace: stackTrace),
                  _ => Skeletonizer(
                    child: UserListWidget(
                      projectId: projectId,
                      items: List.filled(5, User.dummy()),
                    ),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
