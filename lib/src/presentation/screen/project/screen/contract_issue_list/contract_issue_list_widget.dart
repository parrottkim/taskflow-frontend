import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/contract_issue_list/widget/contract_display_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/contract_issue_list/widget/kickoff_display_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/contract_issue_list/widget/toolbar_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/contract_issue_list/widget/transaction_display_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/contract_issue_list/widget/user_information_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ContractIssueListWidget extends ConsumerWidget {
  final int projectId;
  final int? issueId;

  const ContractIssueListWidget({
    super.key,
    required this.projectId,
    this.issueId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final issue = ref.watch(issueListControllerProvider(projectId: projectId));

    return switch (issue) {
      AsyncData(:final value) => _DesktopWidget(
        projectId: projectId,
        issueId: issueId,
        contract: value.contract,
        kickoff: value.kickoff,
        transaction: value.transaction,
        payment: value.payment,
        contractItems: value.contractItems,
        transactionItems: value.transactionItems,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          projectId: projectId,
          issueId: issueId,
          contract: ContractIssue(
            id: 0,
            category: IssueCategory.dummy(),
            user: User.dummy(),
            content: '',
            currency: Currency.empty(),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          contractItems: [],
          transactionItems: [],
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int projectId;
  final int? issueId;
  final ContractIssue? contract;
  final KickoffIssue? kickoff;
  final TransactionIssue? transaction;
  final PaymentIssue? payment;
  final List<ContractIssueItem> contractItems;
  final List<TransactionIssueItem> transactionItems;

  const _DesktopWidget({
    required this.projectId,
    this.issueId,
    this.contract,
    this.kickoff,
    this.transaction,
    this.payment,
    required this.contractItems,
    required this.transactionItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);

    final colorScheme = Theme.of(context).colorScheme;

    final selected = useState<int?>(issueId);
    final itemKeys = useMemoized<Map<int, GlobalKey>>(() {
      final keys = <int, GlobalKey>{};

      if (payment != null) keys[payment!.id] = GlobalKey();
      if (transaction != null) keys[transaction!.id] = GlobalKey();
      if (kickoff != null) keys[kickoff!.id] = GlobalKey();
      if (contract != null) keys[contract!.id] = GlobalKey();

      return keys;
    }, [payment, transaction, kickoff, contract]);

    final orderedIds = useMemoized<List<int>>(() {
      return [
        if (payment != null) payment!.id,
        if (transaction != null) transaction!.id,
        if (kickoff != null) kickoff!.id,
        if (contract != null) contract!.id,
      ];
    }, [payment, transaction, kickoff, contract]);

    final controller = PrimaryScrollController.of(context);

    useEffect(() {
      if (issueId == null) return null;
      if (!orderedIds.contains(issueId)) return null;

      final key = itemKeys[issueId];
      if (key == null) return null;

      Future.microtask(() async {
        await WidgetsBinding.instance.endOfFrame;

        if (!controller.hasClients) return;

        final ctx = key.currentContext;
        if (ctx == null) return;

        final renderBox = ctx.findRenderObject() as RenderBox;
        final scrollBox =
            controller.position.context.storageContext.findRenderObject()
                as RenderBox;

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
    }, [issueId, orderedIds]);

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

    if (contract == null &&
        kickoff == null &&
        transaction == null &&
        payment == null) {
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
            Text(Intl.message('project_detail_no_contracts')),
          ],
        ),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        selected.value = null;
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.all(Responsive.isDesktop(context) ? 16.0 : 8.0),
        child: Column(
          children: [
            if (payment != null)
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Row(
                  key: itemKeys[payment!.id],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isDesktop(context))
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Skeleton.unite(
                          child: CircleAvatar(
                            backgroundColor: Functions(
                              context,
                            ).generateColorFromId(payment!.user.id),
                            radius: 16.0,
                            child: Text(
                              getInitials(payment!.user.username),
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
                            color: payment!.id == selected.value
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
                                          auth.user.id == payment!.user.id
                                      ? colorScheme.primary.withValues(
                                          alpha: 0.1,
                                        )
                                      : colorScheme.surfaceContainerLow,
                                ),
                                child: Row(
                                  children: [
                                    UserInformationWidget(item: payment!.user),
                                    const Spacer(),
                                    ToolbarWidget(
                                      projectId: projectId,
                                      issueId: payment!.id,
                                      categoryId: payment!.category.id,
                                      createdAt: payment!.createdAt,
                                      updatedAt: payment!.updatedAt,
                                      user: payment!.user,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CategoryWidget(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      item: payment!.category,
                                    ),
                                    SizedBox(height: 16.0),
                                    MarkdownWidget(item: payment!.content),
                                    if (payment!.attachments.isNotEmpty)
                                      AttachmentListWidget<IssueAttachment>(
                                        attachments: payment!.attachments,
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
            if (transaction != null)
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Row(
                  key: itemKeys[transaction!.id],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isDesktop(context))
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Skeleton.unite(
                          child: CircleAvatar(
                            backgroundColor: Functions(
                              context,
                            ).generateColorFromId(transaction!.user.id),
                            radius: 16.0,
                            child: Text(
                              getInitials(transaction!.user.username),
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
                            color: transaction!.id == selected.value
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
                                          auth.user.id == transaction!.user.id
                                      ? colorScheme.primary.withValues(
                                          alpha: 0.1,
                                        )
                                      : colorScheme.surfaceContainerLow,
                                ),
                                child: Row(
                                  children: [
                                    UserInformationWidget(
                                      item: transaction!.user,
                                    ),
                                    const Spacer(),
                                    ToolbarWidget(
                                      projectId: projectId,
                                      issueId: transaction!.id,
                                      categoryId: transaction!.category.id,
                                      createdAt: transaction!.createdAt,
                                      updatedAt: transaction!.updatedAt,
                                      user: transaction!.user,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CategoryWidget(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      item: transaction!.category,
                                    ),
                                    SizedBox(height: 8.0),
                                    TransactionDisplayItem(
                                      projectId: projectId,
                                      currency: transaction!.currency,
                                      items: transactionItems,
                                    ),
                                    SizedBox(height: 16.0),
                                    MarkdownWidget(item: transaction!.content),
                                    SizedBox(height: 16.0),
                                    if (transaction!.attachments.isNotEmpty)
                                      AttachmentListWidget<IssueAttachment>(
                                        attachments: transaction!.attachments,
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
            if (kickoff != null)
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Row(
                  key: itemKeys[kickoff!.id],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isDesktop(context))
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Skeleton.unite(
                          child: CircleAvatar(
                            backgroundColor: Functions(
                              context,
                            ).generateColorFromId(kickoff!.user.id),
                            radius: 16.0,
                            child: Text(
                              getInitials(kickoff!.user.username),
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
                            color: kickoff!.id == selected.value
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
                                          auth.user.id == kickoff!.user.id
                                      ? colorScheme.primary.withValues(
                                          alpha: 0.1,
                                        )
                                      : colorScheme.surfaceContainerLow,
                                ),
                                child: Row(
                                  children: [
                                    UserInformationWidget(item: kickoff!.user),
                                    const Spacer(),
                                    ToolbarWidget(
                                      projectId: projectId,
                                      issueId: kickoff!.id,
                                      categoryId: kickoff!.category.id,
                                      createdAt: kickoff!.createdAt,
                                      updatedAt: kickoff!.updatedAt,
                                      user: kickoff!.user,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CategoryWidget(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      item: kickoff!.category,
                                    ),
                                    SizedBox(height: 16.0),
                                    KickoffDisplayItem(
                                      kickoffDate: kickoff!.kickoffDate,
                                    ),
                                    SizedBox(height: 16.0),
                                    MarkdownWidget(item: kickoff!.content),
                                    if (kickoff!.attachments.isNotEmpty)
                                      AttachmentListWidget<IssueAttachment>(
                                        attachments: kickoff!.attachments,
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
            if (contract != null)
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Row(
                  key: itemKeys[contract!.id],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isDesktop(context))
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Skeleton.unite(
                          child: CircleAvatar(
                            backgroundColor: Functions(
                              context,
                            ).generateColorFromId(contract!.user.id),
                            radius: 16.0,
                            child: Text(
                              getInitials(contract!.user.username),
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
                            color: contract!.id == selected.value
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
                                          auth.user.id == contract!.user.id
                                      ? colorScheme.primary.withValues(
                                          alpha: 0.1,
                                        )
                                      : colorScheme.surfaceContainerLow,
                                ),
                                child: Row(
                                  children: [
                                    UserInformationWidget(item: contract!.user),
                                    const Spacer(),
                                    ToolbarWidget(
                                      projectId: projectId,
                                      issueId: contract!.id,
                                      categoryId: contract!.category.id,
                                      createdAt: contract!.createdAt,
                                      updatedAt: contract!.updatedAt,
                                      user: contract!.user,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CategoryWidget(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      item: contract!.category,
                                    ),
                                    SizedBox(height: 8.0),
                                    ContractDisplayItem(
                                      currency: contract!.currency,
                                      contractItems: contractItems,
                                      transactionItems: transactionItems,
                                    ),
                                    SizedBox(height: 16.0),
                                    MarkdownWidget(item: contract!.content),
                                    if (contract!.attachments.isNotEmpty)
                                      AttachmentListWidget<IssueAttachment>(
                                        attachments: contract!.attachments,
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
          ],
        ),
      ),
    );
  }
}
