import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/widget/new_project_button.dart';
import 'package:taskflow/src/presentation/screen/project/widget/project_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/project_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/segment_widget.dart';
import 'package:taskflow/src/router/router.dart';

class ProjectScreen extends HookConsumerWidget {
  final String? view;
  final String? sort;
  final String? order;
  final String? search;
  final String? bookmark;
  final String? clients;
  final String? categories;

  const ProjectScreen({
    super.key,
    this.view,
    this.sort,
    this.order,
    this.search,
    this.bookmark,
    this.clients,
    this.categories,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final location = GoRouter.of(context).name;

      if (location != RouteNames.project) return;

      Future.microtask(
        () => ref
            .read(
              projectFilterControllerProvider(
                ProjectFilterScope.projectPage,
              ).notifier,
            )
            .init(
              view: view,
              sort: sort,
              order: order,
              search: search,
              bookmark: bookmark,
              clients: clients,
              categories: categories,
            ),
      );
      return null;
    }, [view, sort, order, search, bookmark, clients, categories]);

    return const BranchLayout(
      actions: [NewProjectButton()],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SegmentWidget(),
          SizedBox(height: 16.0),
          ProjectFilterWidget(),
          SizedBox(height: 8.0),
          ProjectListWidget(),
        ],
      ),
    );
  }
}
