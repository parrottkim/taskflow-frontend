import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/contract_issue_list/widget/user_information_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/procurement_issue_list/widget/procurement_display_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/procurement_issue_list/widget/procurement_preview_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/procurement_issue_list/widget/toolbar_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ProcurementIssueListWidget extends ConsumerWidget {
  const ProcurementIssueListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouter.of(context).state;
    final projectId = int.parse(state.pathParameters['project_id']!);

    final issue = ref.watch(issueListControllerProvider(projectId: projectId));

    return switch (issue) {
      AsyncData(:final value) => _DesktopWidget(items: value.procurements),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          items: List.filled(
            5,
            ProcurementIssue(
              id: 0,
              category: IssueCategory.dummy(),
              user: User.dummy(),
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
  final List<ProcurementIssue> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouter.of(context).state;
    final projectId = int.parse(state.pathParameters['project_id']!);
    final issueId = int.tryParse(state.uri.queryParameters['issue'] ?? '');

    final auth = ref.watch(authControllerProvider);

    final colorScheme = Theme.of(context).colorScheme;

    final selected = useState<int?>(issueId);
    final itemKeys = useMemoized<Map<int, GlobalKey>>(() {
      if (issueId == null) return {};
      final Map<int, GlobalKey> keys = {};
      for (final issue in items) {
        keys[issue.id] = GlobalKey();
      }
      return keys;
    }, [items]);

    final controller = PrimaryScrollController.of(context);

    useEffect(() {
      selected.value = issueId;

      if (selected.value != null && items.any((i) => i.id == selected.value)) {
        Future.microtask(() async {
          // ⭐️ 렌더링 완료를 확실히 기다립니다.
          await WidgetsBinding.instance.endOfFrame;

          final ctx = itemKeys[selected.value]?.currentContext;
          if (ctx == null) return;

          // ⭐️ ScrollController를 사용하는 로직으로 변경
          if (controller.hasClients) {
            final renderBox = ctx.findRenderObject() as RenderBox;
            final viewport = context.findRenderObject() as RenderBox;
            final targetOffset =
                renderBox.localToGlobal(Offset.zero, ancestor: viewport).dy -
                60.0;

            controller.animateTo(
              targetOffset + controller.offset,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInQuad,
            );
          }
        });
      }
      return null;
    }, [issueId, items]);

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
                  message: Intl.message('issue_form_delete'),
                ),
              );
        }
      }
    });

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
                      ).generateColorFromId(items[index].user.id),
                      radius: 16.0,
                      child: Text(
                        getInitials(items[index].user.username),
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
                                    auth.user.id == items[index].user.id
                                ? colorScheme.primary.withValues(alpha: 0.1)
                                : colorScheme.surfaceContainerLow,
                          ),
                          child: Row(
                            children: [
                              UserInformationWidget(item: items[index].user),
                              const Spacer(),
                              ToolbarWidget(
                                issueId: items[index].id,
                                categoryId: items[index].category.id,
                                createdAt: items[index].createdAt,
                                updatedAt: items[index].updatedAt,
                                user: items[index].user,
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CategoryWidget(
                              padding: EdgeInsets.all(16.0),
                              item: items[index].category,
                            ),
                            ProcurementDisplayItem(
                              items: items[index].procurementItems,
                            ),
                            MarkdownWidget(item: items[index].content),
                            ProcurementPreviewWidget(),
                            if (items[index].attachments.isNotEmpty)
                              AttachmentListWidget(
                                attachments: items[index].attachments,
                              ),
                          ],
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
