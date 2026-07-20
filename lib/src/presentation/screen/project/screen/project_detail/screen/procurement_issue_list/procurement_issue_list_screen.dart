import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/contract_issue_list/widget/user_information_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/procurement_issue_list/widget/procurement_display_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/procurement_issue_list/widget/procurement_request_export_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/procurement_issue_list/widget/procurement_request_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/procurement_issue_list/widget/progress_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/procurement_issue_list/widget/toolbar_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ProcurementIssueListScreen extends ConsumerWidget {
  final int projectId;
  final int? issueId;

  const ProcurementIssueListScreen({
    super.key,
    required this.projectId,
    this.issueId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final issue = ref.watch(issueListControllerProvider(projectId: projectId));

    ref.listen(issueSubmitControllerProvider, (_, state) {
      if (state is IssueSubmitPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();

        if (state is IssueSubmitDeleted) {
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('issue_form_deleted'),
                ),
              );
        }
      }
    });

    return switch (issue) {
      AsyncData(:final value) => _DesktopWidget(
        projectId: projectId,
        issueId: issueId,
        items: value.procurements,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          projectId: projectId,
          issueId: issueId,
          items: List.filled(
            5,
            ProcurementIssue(
              id: 0,
              category: IssueCategory.dummy(),
              createdBy: User.dummy(),
              content: '',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          ),
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int projectId;
  final int? issueId;
  final List<ProcurementIssue> items;

  const _DesktopWidget({
    required this.projectId,
    this.issueId,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);

    final colorScheme = Theme.of(context).colorScheme;

    final selected = useState<int?>(issueId);
    final itemKeys = useMemoized<List<GlobalKey>>(() {
      return List.generate(items.length, (_) => GlobalKey());
    }, [items]);

    useEffect(() {
      selected.value = issueId;

      if (selected.value != null && items.any((i) => i.id == selected.value)) {
        Future.microtask(() async {
          // ⭐️ 렌더링 완료를 확실히 기다립니다.
          await WidgetsBinding.instance.endOfFrame;

          final selectedIndex = items.indexWhere((i) => i.id == selected.value);
          if (selectedIndex < 0 || selectedIndex >= itemKeys.length) return;

          final ctx = itemKeys[selectedIndex].currentContext;
          if (ctx == null) return;

          await Scrollable.ensureVisible(
            ctx,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInQuad,
            alignment: 0.1,
          );
        });
      }
      return null;
    }, [issueId, items]);

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/empty.svg',
              width: 40.0,
              height: 40.0,
              colorFilter: ColorFilter.mode(
                colorScheme.onSurface.withValues(alpha: 0.7),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(Intl.message('project_detail_no_procurements')),
          ],
        ),
      );
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
                  issueListControllerProvider(projectId: projectId).notifier,
                )
                .loadProcurements();
          }
          return false;
        },
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.all(Responsive.isDesktop(context) ? 16.0 : 8.0),
          itemCount: items.length,
          itemBuilder: (context, index) => Row(
            key: itemKeys[index],
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
                  child: ContainerWidget(
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
                                    auth.user.id == items[index].createdBy.id
                                ? colorScheme.primary.withValues(alpha: 0.1)
                                : colorScheme.surfaceContainerLow,
                          ),
                          child: Row(
                            children: [
                              UserInformationWidget(
                                item: items[index].createdBy,
                              ),
                              const Spacer(),
                              ToolbarWidget(
                                issueId: items[index].id,
                                category: items[index].category,
                                createdAt: items[index].createdAt,
                                updatedAt: items[index].updatedAt,
                                createdBy: items[index].createdBy,
                                updatedBy: items[index].updatedBy,
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CategoryWidget(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                item: items[index].category,
                              ),
                              SizedBox(height: 16.0),
                              ProcurementDisplayItem(
                                items: items[index].procurementItems,
                                requests: items[index].requests,
                              ),
                              ProcurementRequestExportWidget(
                                item: items[index],
                                requests: items[index].requests,
                              ),
                              if (items[index].requests.isNotEmpty)
                                ProcurementRequestItem(
                                  projectId: projectId,
                                  issueId: items[index].id,
                                  requests: items[index].requests,
                                ),
                              if (auth is AuthAuthenticated &&
                                  (auth.user.department?.root == 1 ||
                                      auth.user.department?.id == 3))
                                ProgressWidget(
                                  projectId: projectId,
                                  issueId: items[index].id,
                                  items: items[index].procurementItems,
                                  requests: items[index].requests,
                                ),
                              SizedBox(height: 16.0),
                              MarkdownWidget(item: items[index].content),
                              if (items[index].attachments.isNotEmpty)
                                AttachmentListWidget(
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
          separatorBuilder: (_, _) => SizedBox(height: 8.0),
        ),
      ),
    );
  }
}
