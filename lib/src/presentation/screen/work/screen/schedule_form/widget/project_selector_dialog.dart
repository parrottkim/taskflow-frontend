import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/work/screen/schedule_form/widget/project_client_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/schedule_form/widget/schedule_project_selector.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ProjectSelectorDialog extends HookConsumerWidget {
  final int categoryId;
  final int? scheduleId;
  final List<ClientGroup> clientItems;

  const ProjectSelectorDialog({
    super.key,
    required this.categoryId,
    this.scheduleId,
    required this.clientItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final project = ref.watch(projectListControllerProvider);

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
                hintText: Intl.message('schedule_form_project_search'),
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
                  .read(projectFilterControllerProvider.notifier)
                  .setSearch(search: value),
            ),
            Divider(),
            ProjectClientFilterWidget(clientItems: clientItems),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16.0),
                  ),
                ),
                child: switch (project) {
                  AsyncData(:final value) => ScheduleProjectSelector(
                    categoryId: categoryId,
                    scheduleId: scheduleId,
                    items: value.items,
                  ),
                  AsyncError(:final error, :final stackTrace) =>
                    ErrorContainerWidget(error: error, stackTrace: stackTrace),
                  _ => Skeletonizer(
                    child: ScheduleProjectSelector(
                      categoryId: categoryId,
                      items: List.filled(5, Project.dummy()),
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
