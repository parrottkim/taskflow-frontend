import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/search_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class UserFilterWidget extends ConsumerWidget {
  const UserFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(userFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
        position: value.position,
        department: value.department,
        positionItems: value.positionItems,
        departmentItems: value.departmentItems,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(positionItems: [], departmentItems: []),
      ),
    };
  }
}

class _DesktopWidget extends ConsumerWidget {
  final UserPosition? position;
  final UserDepartment? department;
  final List<UserPosition> positionItems;
  final List<UserDepartment> departmentItems;

  const _DesktopWidget({
    this.position,
    this.department,
    required this.positionItems,
    required this.departmentItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          UserPositionFilterWidget(
            position: position,
            positionItems: positionItems,
          ),
          SizedBox(width: 8.0),
          UserDepartmentFilterWidget(
            department: department,
            departmentItems: departmentItems,
          ),
          Spacer(),
          SearchWidget(),
        ],
      ),
    );
  }
}
