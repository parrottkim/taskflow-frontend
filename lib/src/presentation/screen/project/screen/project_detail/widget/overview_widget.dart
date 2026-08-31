import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/segment_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/toolbar_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/headline_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/info_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class OverviewWidget extends HookConsumerWidget {
  final int projectId;
  final int? issueId;
  final int? reportId;
  final Project project;
  final int contracts;
  final int approvals;
  final int procurements;
  final int reports;

  const OverviewWidget({
    super.key,
    required this.projectId,
    this.issueId,
    this.reportId,
    required this.project,
    this.contracts = 0,
    this.approvals = 0,
    this.procurements = 0,
    this.reports = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(projectDetailFilterControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final selectedItem = useState<ProjectDetailTab>(
      ProjectDetailTab.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => ProjectDetailTab.values.first,
      ),
    );

    final controller = useTabController(
      initialLength: ProjectDetailTab.values.length,
      initialIndex: ProjectDetailTab.values.indexOf(selectedItem.value),
    );

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final currentIndex = useState<int>(controller.index);

    useEffect(() {
      final newItem = ProjectDetailTab.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => ProjectDetailTab.values.first,
      );

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(ProjectDetailTab.values.indexOf(newItem));
      }

      return null;
    }, [filter.view]);

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
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ContentContainer(
                  color: colorScheme.outline.subtle,
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
          child: ContentContainer(
            padding: EdgeInsets.zero,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ToolbarWidget(project: project),
                          HeadlineWidget(project: project),
                          SizedBox(height: 32.0),
                          InfoWidget(project: project),
                          SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        TabBar(
                          controller: controller,
                          onTap: (index) {
                            selectedItem.value = ProjectDetailTab.values[index];

                            ref
                                .read(
                                  projectDetailFilterControllerProvider
                                      .notifier,
                                )
                                .setView(view: selectedItem.value.name);

                            context.goNamed(
                              RouteNames.projectDetail,
                              pathParameters: {
                                'project_id': projectId.toString(),
                              },
                              queryParameters: context.buildQueryParameters(
                                updates: {
                                  'view': selectedItem.value.name,
                                  'issue': null,
                                  'report': null,
                                },
                              ),
                            );

                            controller.animateTo(index);
                          },
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(horizontal: 24.0),
                          tabs: List.generate(ProjectDetailTab.values.length, (
                            index,
                          ) {
                            final isActive =
                                (controller.animation?.value ??
                                        controller.index)
                                    .round() ==
                                index;

                            final segment = ProjectDetailTab.values[index];
                            final count = switch (segment) {
                              ProjectDetailTab.contract => contracts,
                              ProjectDetailTab.approval => approvals,
                              ProjectDetailTab.procurement => procurements,
                              ProjectDetailTab.report => reports,
                              _ => null,
                            };

                            final countText = (count != null)
                                ? (count >= 10 ? '10+' : count.toString())
                                : null;

                            return Tab(
                              child: Row(
                                children: [
                                  Text(ProjectDetailTab.values[index].label),
                                  if (countText != null)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                          vertical: 2.0,
                                        ),
                                        decoration: ShapeDecoration(
                                          shape: StadiumBorder(),
                                          color: isActive
                                              ? colorScheme.primary
                                              : colorScheme.outline.strong,
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
                          }),
                        ),
                      ),
                    ),
                  ],
                  body: SegmentWidget(
                    projectId: projectId,
                    issueId: issueId,
                    reportId: reportId,
                    project: project,
                    controller: controller,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
