import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/widget/project_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/segment_widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/screen/project/widget/desktop_filter_bar.dart';
import 'package:taskflow/src/presentation/screen/project/widget/mobile_filter_bar.dart';

class ProjectScreen extends HookConsumerWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final view = state.uri.queryParameters['view'];
    final sort = state.uri.queryParameters['sort'];
    final order = state.uri.queryParameters['order'];
    final search = state.uri.queryParameters['search'];
    final bookmark = state.uri.queryParameters['bookmark'];
    final clients = state.uri.queryParameters['clients'];
    final categories = state.uri.queryParameters['categories'];

    useEffect(() {
      final location = GoRouter.of(context).name;

      if (location != RouteNames.project) return;

      Future.microtask(
        () => ref
            .read(projectFilterControllerProvider.notifier)
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
      child: Responsive(desktop: _DesktopWidget(), mobile: _MobileWidget()),
    );
  }
}

class _DesktopWidget extends ConsumerWidget {
  const _DesktopWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SegmentWidget(),
          SizedBox(height: 24.0),
          DesktopFilterBar(),
          SizedBox(height: 8.0),
          Expanded(child: ProjectListWidget()),
        ],
      ),
    );
  }
}

class _MobileWidget extends ConsumerWidget {
  const _MobileWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SegmentWidget(),
          SizedBox(height: 24.0),
          MobileFilterBar(),
          SizedBox(height: 16.0),
          Expanded(child: ProjectListWidget()),
        ],
      ),
    );
  }
}
