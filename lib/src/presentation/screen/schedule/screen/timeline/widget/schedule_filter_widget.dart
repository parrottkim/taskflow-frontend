import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/timeline/widget/reset_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/timeline/widget/search_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ScheduleFilterWidget extends ConsumerWidget {
  const ScheduleFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Responsive(desktop: _DesktopWidget(), mobile: _MobileWidget());
  }
}

class _DesktopWidget extends StatelessWidget {
  const _DesktopWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          _ScheduleDepartmentFilterWidget(),
          Spacer(),
          ResetFilterWidget(),
          SizedBox(width: 8.0),
          SearchWidget(),
        ],
      ),
    );
  }
}

class _MobileWidget extends StatelessWidget {
  const _MobileWidget();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: _ScheduleDepartmentFilterWidget(),
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

class _ScheduleDepartmentFilterWidget extends ConsumerWidget {
  const _ScheduleDepartmentFilterWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      scheduleFilterControllerProvider(ScheduleFilterScope.schedulePage),
    );
    final options = ref.watch(scheduleOptionsControllerProvider);

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

          ref
              .read(
                scheduleFilterControllerProvider(
                  ScheduleFilterScope.schedulePage,
                ).notifier,
              )
              .setDepartments(departments: nextDepartments);
          context.goNamed(
            RouteNames.schedule,
            queryParameters: buildQueryParameters(
              context,
              updates: {'departments': nextDepartments?.join(',')},
            ),
          );
        },
      ),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
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
