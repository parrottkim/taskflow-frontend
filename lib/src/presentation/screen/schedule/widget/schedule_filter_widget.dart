import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/schedule/widget/reset_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/schedule/widget/search_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ScheduleFilterWidget extends ConsumerWidget {
  const ScheduleFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      scheduleFilterControllerProvider(ScheduleFilterScope.schedulePage),
    );
    final options = ref.watch(scheduleOptionsControllerProvider);

    return switch ((filter, options)) {
      (AsyncData(value: final filter), AsyncData(value: final options)) =>
        Responsive(
          desktop: _DesktopWidget(
            search: filter.search,
            departments: filter.departments,
            departmentGroups: options.departmentGroups,
            departmentItems: options.departmentItems,
          ),
          mobile: _MobileWidget(
            search: filter.search,
            departments: filter.departments,
            departmentGroups: options.departmentGroups,
            departmentItems: options.departmentItems,
          ),
        ),
      (AsyncError(:final error, :final stackTrace), _) ||
      (
        _,
        AsyncError(:final error, :final stackTrace),
      ) => ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(
        ignoreContainers: true,
        child: Responsive(
          desktop: _DesktopWidget(departmentGroups: [], departmentItems: []),
          mobile: _MobileWidget(departmentGroups: [], departmentItems: []),
        ),
      ),
    };
  }
}

class _DesktopWidget extends ConsumerWidget {
  final String? search;
  final List<int>? departments;
  final List<UserDepartmentGroup> departmentGroups;
  final List<UserDepartment> departmentItems;

  const _DesktopWidget({
    this.search,
    this.departments,
    required this.departmentGroups,
    required this.departmentItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          UserDepartmentFilterWidget(
            department: _findDepartment(
              departmentItems: departmentItems,
              departmentId: departments?.lastOrNull,
            ),
            departmentGroups: departmentGroups,
            departmentItems: departmentItems,
            onPathChanged: (path) {
              final nextDepartments = path.isEmpty
                  ? null
                  : path.map((item) => item.id).toList();
              final controller = ref.read(
                scheduleFilterControllerProvider(
                  ScheduleFilterScope.schedulePage,
                ).notifier,
              );

              controller.setDepartments(departments: nextDepartments);

              context.goNamed(
                RouteNames.schedule,
                queryParameters: {
                  if (search != null && search!.trim().isNotEmpty)
                    'search': search!.trim(),
                  if (nextDepartments != null)
                    'departments': nextDepartments.join(','),
                },
              );
            },
          ),
          Spacer(),
          ResetFilterWidget(),
          SizedBox(width: 8.0),
          SearchWidget(),
        ],
      ),
    );
  }
}

class _MobileWidget extends ConsumerWidget {
  final String? search;
  final List<int>? departments;
  final List<UserDepartmentGroup> departmentGroups;
  final List<UserDepartment> departmentItems;

  const _MobileWidget({
    this.search,
    this.departments,
    required this.departmentGroups,
    required this.departmentItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: UserDepartmentFilterWidget(
            department: _findDepartment(
              departmentItems: departmentItems,
              departmentId: departments?.lastOrNull,
            ),
            departmentGroups: departmentGroups,
            departmentItems: departmentItems,
            onPathChanged: (path) {
              final nextDepartments = path.isEmpty
                  ? null
                  : path.map((item) => item.id).toList();
              final controller = ref.read(
                scheduleFilterControllerProvider(
                  ScheduleFilterScope.schedulePage,
                ).notifier,
              );

              controller.setDepartments(departments: nextDepartments);

              context.goNamed(
                RouteNames.schedule,
                queryParameters: {
                  if (search != null && search!.trim().isNotEmpty)
                    'search': search!.trim(),
                  if (nextDepartments != null)
                    'departments': nextDepartments.join(','),
                },
              );
            },
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              ResetFilterWidget(),
              SizedBox(width: 8.0),
              Expanded(child: SearchWidget()),
            ],
          ),
        ),
      ],
    );
  }
}

UserDepartment? _findDepartment({
  required List<UserDepartment> departmentItems,
  required int? departmentId,
}) {
  if (departmentId == null) return null;

  return departmentItems.firstWhereOrNull((item) => item.id == departmentId);
}
