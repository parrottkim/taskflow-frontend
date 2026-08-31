import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/report_list/widget/schedule_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/report_list/widget/toolbar_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/report_list/widget/trip_cost_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/report_list/widget/trip_export_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/report_list/widget/user_information_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ReportListScreen extends ConsumerWidget {
  final int projectId;
  final int? reportId;

  const ReportListScreen({super.key, required this.projectId, this.reportId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(reportListControllerProvider(projectId: projectId));

    ref.listen(reportSubmitControllerProvider, (_, state) {
      if (state is ReportSubmitPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();

        if (state is ReportSubmitDeleted) {
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('report_form_delete'),
                ),
              );
        }
      }
    });

    return switch (trip) {
      AsyncData(:final value) => _DesktopWidget(
        projectId: projectId,
        reportId: reportId,
        items: value.items,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorStateView(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          projectId: projectId,
          reportId: reportId,
          items: List.filled(1, Report.dummy()),
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int projectId;
  final int? reportId;
  final List<Report> items;

  const _DesktopWidget({
    required this.projectId,
    this.reportId,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);

    final colorScheme = Theme.of(context).colorScheme;

    final selected = useState<int?>(reportId);
    final itemKeys = useMemoized<Map<int, GlobalKey>>(() {
      final keys = <int, GlobalKey>{};

      for (final report in items) {
        keys[report.id] = GlobalKey();
      }

      return keys;
    }, [items]);

    final orderedIds = useMemoized<List<int>>(
      () => items.map((item) => item.id).toList(),
      [items],
    );

    final controller = PrimaryScrollController.of(context);

    useEffect(() {
      selected.value = reportId;

      if (reportId == null) return null;
      if (!orderedIds.contains(reportId)) {
        Future.microtask(
          () => ref
              .read(reportListControllerProvider(projectId: projectId).notifier)
              .load(),
        );
        return null;
      }

      final key = itemKeys[reportId];
      if (key == null) return null;

      Future.microtask(() async {
        await WidgetsBinding.instance.endOfFrame;

        if (!controller.hasClients) return;

        final ctx = key.currentContext;
        if (ctx == null || !ctx.mounted) return;

        final scrollContext = controller.position.context.storageContext;
        if (!scrollContext.mounted) return;

        final renderBox = ctx.findRenderObject() as RenderBox;
        final scrollBox = scrollContext.findRenderObject() as RenderBox;

        final offset = renderBox
            .localToGlobal(Offset.zero, ancestor: scrollBox)
            .dy;

        controller.animateTo(
          controller.offset + offset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });

      return null;
    }, [reportId, orderedIds]);

    if (items.isEmpty) {
      return EmptyStateView(message: Intl.message('project_detail_no_report'));
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        selected.value = null;
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels >=
              notification.metrics.maxScrollExtent - 20.0) {
            ref
                .read(
                  reportListControllerProvider(projectId: projectId).notifier,
                )
                .load();
          }
          return false;
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Responsive.isDesktop(context) ? 16.0 : 8.0),
          child: Column(
            children: List.generate(
              items.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                  bottom: index < items.length - 1 ? 8.0 : 0.0,
                ),
                child: Row(
                  key: itemKeys[items[index].id],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isDesktop(context))
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Skeleton.unite(
                          child: CircleAvatar(
                            backgroundColor: Functions(
                              context,
                            ).generateColorFromId(items[index].createdBy.id),
                            radius: 16.0,
                            child: Text(
                              getInitials(items[index].createdBy.username),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: items[index].id == selected.value
                                ? colorScheme.primary
                                : Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                        child: ContentContainer(
                          padding: EdgeInsets.zero,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 12.0,
                                  top: 4.0,
                                  bottom: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                  color:
                                      auth is AuthAuthenticated &&
                                          auth.user.id ==
                                              items[index].createdBy.id
                                      ? colorScheme.primary.faint
                                      : colorScheme.surfaceContainerLow,
                                ),
                                child: Row(
                                  children: [
                                    UserInformationWidget(
                                      item: items[index].createdBy,
                                    ),
                                    const Spacer(),
                                    ToolbarWidget(
                                      projectId: projectId,
                                      item: items[index],
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (items[index].schedule != null)
                                      ScheduleWidget(
                                        schedule: items[index].schedule!,
                                      ),
                                    if (items[index].schedule != null)
                                      TripCostWidget(item: items[index]),
                                    if (items[index].schedule == null)
                                      SizedBox(height: 16.0),
                                    MarkdownWidget(item: items[index].content),
                                    if (items[index].trip != null &&
                                        items[index].schedule != null &&
                                        (items[index].schedule!.category
                                                is ScheduleDomestic ||
                                            items[index].schedule!.category
                                                is ScheduleOverseas))
                                      TripExportWidget(item: items[index]),
                                    if (items[index].attachments.isNotEmpty)
                                      AttachmentListWidget<ReportAttachment>(
                                        attachments: items[index].attachments,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
