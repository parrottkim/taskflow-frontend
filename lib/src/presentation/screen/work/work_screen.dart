import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/work/widget/overview_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class WorkScreen extends HookConsumerWidget {
  final String? view;
  final String? status;
  final String? sort;
  final String? order;
  final String? search;
  final String? clients;
  final String? categories;
  final String? start;
  final String? end;

  const WorkScreen({
    super.key,
    this.view,
    this.status,
    this.sort,
    this.order,
    this.search,
    this.clients,
    this.categories,
    this.start,
    this.end,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(workProjectFilterControllerProvider);
    ref.watch(workIssueFilterControllerProvider);
    ref.watch(workReportFilterControllerProvider);

    useEffect(() {
      final location = GoRouter.of(context).name;

      if (location != RouteNames.work) return;

      Future.microtask(() {
        ref.read(workFilterControllerProvider.notifier).init(view: view);

        if (view == WorkSegment.project.key) {
          ref
              .read(workProjectFilterControllerProvider.notifier)
              .init(
                status: status,
                sort: sort,
                order: order,
                search: search,
                clients: clients,
                categories: categories,
              );
        } else if (view == WorkSegment.issue.key) {
          ref
              .read(workIssueFilterControllerProvider.notifier)
              .init(
                sort: sort,
                order: order,
                search: search,
                clients: clients,
                categories: categories,
              );
        } else {
          ref
              .read(workReportFilterControllerProvider.notifier)
              .init(
                sort: sort,
                order: order,
                search: search,
                clients: clients,
                categories: categories,
                start: start,
                end: end,
              );
        }
      });

      return null;
    }, [view, status, sort, order, search, clients, categories, start, end]);

    return BranchLayout(
      child: Padding(
        padding: Responsive.isDesktop(context)
            ? EdgeInsets.only(top: 24.0)
            : EdgeInsets.zero,
        child: OverviewWidget(),
      ),
    );
  }
}
