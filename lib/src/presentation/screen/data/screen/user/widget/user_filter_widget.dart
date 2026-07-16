import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/reset_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/search_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class UserFilterWidget extends ConsumerWidget {
  const UserFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _DesktopWidget();
  }
}

class _DesktopWidget extends StatelessWidget {
  const _DesktopWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: const [
          DataUserPositionFilterWidget(),
          SizedBox(width: 8.0),
          DataUserDepartmentFilterWidget(),
          Spacer(),
          ResetFilterWidget(),
          SizedBox(width: 8.0),
          SearchWidget(),
        ],
      ),
    );
  }
}

class DataUserPositionFilterWidget extends ConsumerWidget {
  const DataUserPositionFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      userFilterControllerProvider(UserFilterScope.dataPage),
    );
    final options = ref.watch(userOptionsControllerProvider);

    return switch (options) {
      AsyncData(value: final options) => UserPositionFilterWidget(
        position: filter.positionId == null
            ? null
            : options.positionItems.firstWhereOrNull(
                (item) => item.id == filter.positionId,
              ),
        positionItems: options.positionItems,
        onChanged: (value) {
          final nextPositionId = value?.id;

          context.goNamed(
            RouteNames.data,
            queryParameters: context.buildQueryParameters(
              updates: {'position_id': nextPositionId?.toString()},
            ),
          );
        },
      ),
      _ => Skeletonizer(
        ignoreContainers: true,
        child: UserPositionFilterWidget(
          position: null,
          positionItems: List.filled(4, UserPosition.dummy()),
          onChanged: (_) {},
        ),
      ),
    };
  }
}

class DataUserDepartmentFilterWidget extends ConsumerWidget {
  const DataUserDepartmentFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      userFilterControllerProvider(UserFilterScope.dataPage),
    );
    final options = ref.watch(userOptionsControllerProvider);

    return switch (options) {
      AsyncData(value: final options) => UserDepartmentFilterWidget(
        department: filter.departments?.lastOrNull == null
            ? null
            : options.departmentItems.firstWhereOrNull(
                (item) => item.id == filter.departments?.lastOrNull,
              ),
        departmentGroups: options.departmentGroups,
        departmentItems: options.departmentItems,
        onPathChanged: (path) {
          final nextDepartments = path.isEmpty
              ? null
              : path.map((item) => item.id).toList();

          context.goNamed(
            RouteNames.data,
            queryParameters: context.buildQueryParameters(
              updates: {'departments': nextDepartments?.join(',')},
            ),
          );
        },
      ),
      _ => Skeletonizer(
        ignoreContainers: true,
        child: UserDepartmentFilterWidget(
          department: null,
          departmentGroups: const [],
          departmentItems: List.filled(4, UserDepartment.dummy()),
        ),
      ),
    };
  }
}
