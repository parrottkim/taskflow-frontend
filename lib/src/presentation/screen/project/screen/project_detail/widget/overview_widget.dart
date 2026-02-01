import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/segment_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/toolbar_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/headline_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/info_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class OverviewWidget extends ConsumerWidget {
  final Project project;
  final int contracts;
  final int approvals;
  final int procurements;
  final int reports;

  const OverviewWidget({
    super.key,
    required this.project,
    this.contracts = 0,
    this.approvals = 0,
    this.procurements = 0,
    this.reports = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(projectDetailFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
        project: project,
        contracts: contracts,
        approvals: approvals,
        procurements: procurements,
        reports: reports,
        view: value.view,
      ),
      _ => Skeletonizer(child: _DesktopWidget(project: project)),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final Project project;
  final int contracts;
  final int approvals;
  final int procurements;
  final int reports;
  final String? view;

  const _DesktopWidget({
    required this.project,
    this.contracts = 0,
    this.approvals = 0,
    this.procurements = 0,
    this.reports = 0,
    this.view,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final projectId = int.parse(state.pathParameters['project_id']!);
    final issueId = int.tryParse(state.uri.queryParameters['issue'] ?? '');
    final reportId = int.tryParse(state.uri.queryParameters['report'] ?? '');

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final selectedItem = useState<ProjectDetailSegment>(
      ProjectDetailSegment.values.firstWhere(
        (e) => e.name == view,
        orElse: () => ProjectDetailSegment.values.first,
      ),
    );

    final controller = useTabController(
      initialLength: ProjectDetailSegment.values.length,
      initialIndex: ProjectDetailSegment.values.indexOf(selectedItem.value),
    );

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final currentIndex = useState<int>(controller.index);

    useEffect(() {
      final newItem = ProjectDetailSegment.values.firstWhere(
        (e) => e.name == view,
        orElse: () => ProjectDetailSegment.values.first,
      );

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(ProjectDetailSegment.values.indexOf(newItem));
      }

      return null;
    }, [view]);

    useEffect(() {
      if (project.isClosed) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
      return null;
    }, [project]);

    useEffect(() {
      void listener() {
        final index = (controller.animation?.value ?? controller.index).round();

        if (currentIndex.value != index) {
          currentIndex.value = index;
        }
      }

      controller.animation?.addListener(listener);

      return () {
        controller.animation?.removeListener(listener);
      };
    }, [controller]);

    return Column(
      children: [
        if (!Responsive.isDesktop(context))
          SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: sizeController,
              curve: Curves.easeInQuad,
            ),
            child: FadeTransition(
              opacity: opacityController,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ContainerWidget(
                  borderRadius: BorderRadius.circular(8.0),
                  color: colorScheme.outline.withValues(alpha: 0.2),
                  borderColor: colorScheme.outline,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Symbols.mountain_flag_rounded, size: 20.0),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Intl.message('project_detail_closed_1'),
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 4.0),
                            Text(Intl.message('project_detail_closed_2')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: ContainerWidget(
            padding: EdgeInsets.zero,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 24.0,
                          right: 24.0,
                          top: 24.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 32.0),
                            HeadlineWidget(project: project),
                            SizedBox(height: 32.0),
                            InfoWidget(project: project),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        TabBar(
                          controller: controller,
                          onTap: (index) {
                            selectedItem.value =
                                ProjectDetailSegment.values[index];

                            ref
                                .read(
                                  projectDetailFilterControllerProvider
                                      .notifier,
                                )
                                .setView(view: selectedItem.value.name);

                            final queryParameters = ref
                                .read(
                                  projectDetailFilterControllerProvider
                                      .notifier,
                                )
                                .toQueryParameters();

                            context.goNamed(
                              RouteNames.projectDetail,
                              pathParameters: {
                                'project_id': projectId.toString(),
                              },
                              queryParameters: queryParameters,
                            );

                            controller.animateTo(index);
                          },
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(horizontal: 24.0),
                          tabs: List.generate(
                            ProjectDetailSegment.values.length,
                            (index) {
                              final isActive =
                                  (controller.animation?.value ??
                                          controller.index)
                                      .round() ==
                                  index;

                              final segment =
                                  ProjectDetailSegment.values[index];
                              final count = switch (segment) {
                                ProjectDetailSegment.contract => contracts,
                                ProjectDetailSegment.approval => approvals,
                                ProjectDetailSegment.procurement =>
                                  procurements,
                                ProjectDetailSegment.report => reports,
                                _ => null,
                              };

                              final countText = (count != null)
                                  ? (count >= 10 ? '10+' : count.toString())
                                  : null;

                              return Tab(
                                child: Row(
                                  children: [
                                    Text(
                                      ProjectDetailSegment.values[index].label,
                                    ),
                                    if (countText != null)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 6.0,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 4.0,
                                            vertical: 2.0,
                                          ),
                                          decoration: ShapeDecoration(
                                            shape: StadiumBorder(),
                                            color: isActive
                                                ? colorScheme.primary
                                                : colorScheme.outline
                                                      .withValues(alpha: 0.7),
                                          ),
                                          child: Text(
                                            countText,
                                            style: textTheme.labelMedium
                                                ?.copyWith(
                                                  fontSize: 8.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: colorScheme.onPrimary,
                                                ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                  body: SegmentWidget(
                    issueId: issueId,
                    reportId: reportId,
                    project: project,
                    controller: controller,
                  ),
                ),
                ToolbarWidget(project: project),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
