import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:follow_the_leader/follow_the_leader.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:super_editor/super_editor.dart';
import 'package:super_editor_markdown/super_editor_markdown.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/editor_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/kickoff_form_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/procurement_form_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/contract_form_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/transaction_form_item.dart';
import 'package:taskflow/src/presentation/widget/attachment.dart';
import 'package:taskflow/src/presentation/widget/dialog.dart';
import 'package:taskflow/src/presentation/widget/overlay.dart';
import 'package:taskflow/src/presentation/widget/super_editor_overlay.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/provider.dart';

class IssueFormScreen extends ConsumerWidget {
  final int categoryId;
  final int projectId;
  final int? issueId;

  const IssueFormScreen({
    super.key,
    required this.categoryId,
    required this.projectId,
    this.issueId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
        issueFormControllerProvider(projectId: projectId, issueId: issueId));

    return BranchLayout(
      child: switch (form) {
        AsyncData(:final value) => _DesktopWidget(
            categoryId: categoryId,
            projectId: projectId,
            issueId: issueId,
            value: value,
          ),
        AsyncError(:final error, :final stackTrace) =>
          ErrorContainerWidget(error: error, stackTrace: stackTrace),
        _ => Skeletonizer(
            child: _DesktopWidget(
              categoryId: categoryId,
              projectId: projectId,
              value: IssueFormState(
                category: IssueCategory.dummy(),
                contractItems: [],
                procurementItems: [],
                transactionItems: [],
              ),
            ),
          ),
      },
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int categoryId;
  final int projectId;
  final int? issueId;
  final IssueFormState value;

  const _DesktopWidget({
    required this.categoryId,
    required this.projectId,
    this.issueId,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final toolbarKey = GlobalKey();
    final overlayKey = GlobalKey();

    final toolbarLink = LeaderLink();
    final overlayLink = LeaderLink();

    final linkOverlayController = useOverlayPortalController();
    final imageOverlayController = useOverlayPortalController();

    final document = useRef(value.content == null
            ? MutableDocument(
                nodes: [
                  ParagraphNode(
                    id: Editor.createNodeId(),
                    text: AttributedText(''),
                  ),
                ],
              )
            : deserializeMarkdownToDocument(value.content!))
        .value;

    final composer = useRef(MutableDocumentComposer()).value;

    final editor = useRef(createDefaultDocumentEditor(
      document: document,
      composer: composer,
      isHistoryEnabled: true,
    )).value;

    final isContentInvalid = useState(false);

    final hasContractItems = useState(false);
    final isContractItemEmpty = useState(false);

    final hasTransactionItems = useState(false);
    final isTransactionItemEmpty = useState(false);
    final isRatioInvalid = useState(false);

    final isKickoffDateEmpty = useState(false);

    final hasProcurementItems = useState(false);
    final isProcurementItemEmpty = useState(false);

    ref.listen(issueSubmitControllerProvider, (_, state) {
      if (state is IssueSubmitPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();

        if (state is IssueSubmitSuccess) {
          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {
              'project_id': projectId.toString(),
            },
            queryParameters: {
              'view': switch (value.category) {
                IssueProcurement() => 'procurement',
                IssueDeclaration() => 'declaration',
                _ => 'contract',
              },
              'issue': state.issue.id.toString(),
            },
          );
        }

        if (state is IssueSubmitDeleted) {
          ref.read(toastProvider).showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('issue_form_delete'),
                ),
              );
          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {
              'project_id': projectId.toString(),
            },
          );
        }
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: OverlayPortal(
            controller: linkOverlayController,
            overlayChildBuilder: (context) => LinkOverlayWidget(
              editor: editor,
              document: document,
              composer: composer,
              overlayKey: overlayKey,
              link: overlayLink,
              linkOverlayController: linkOverlayController,
            ),
            child: SafeArea(
              child: OverlayPortal(
                controller: imageOverlayController,
                overlayChildBuilder: (context) => ImageOverlayWidget(
                  editor: editor,
                  document: document,
                  composer: composer,
                  overlayKey: overlayKey,
                  link: overlayLink,
                  imageOverlayController: imageOverlayController,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  style: textTheme.titleMedium,
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: Intl.message(
                                            'issue_new_choose_$categoryId'),
                                      ),
                                      TextSpan(
                                        text: Intl.message(
                                            'issue_new_choose_${categoryId}_1'),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24.0),
                                Text(
                                  Intl.message('issue_form_content'),
                                  style: textTheme.bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 8.0),
                                Leader(
                                  link: toolbarLink,
                                  child: EditorWidget(
                                    editor: editor,
                                    document: document,
                                    composer: composer,
                                    toolbarKey: toolbarKey,
                                  ),
                                ),
                                InvalidWidget(
                                  visible: isContentInvalid.value,
                                  text: Intl.message('issue_form_invalid_1'),
                                ),
                                SizedBox(height: 24.0),
                                switch (value.category) {
                                  IssueContract() => ContractFormItem(
                                      categoryId: categoryId,
                                      projectId: projectId,
                                      issueId: issueId,
                                      currency: value.currency,
                                      contractItems: value.contractItems,
                                      transactionItems: value.transactionItems,
                                      hasContractItems: hasContractItems,
                                      isContractItemEmpty: isContractItemEmpty,
                                      hasTransactionItems: hasTransactionItems,
                                      isTransactionItemEmpty:
                                          isTransactionItemEmpty,
                                      isRatioInvalid: isRatioInvalid,
                                    ),
                                  IssueKickoff() => KickoffFormItem(
                                      categoryId: categoryId,
                                      projectId: projectId,
                                      issueId: issueId,
                                      kickoffDate: value.kickoffDate,
                                      isKickoffDateEmpty: isKickoffDateEmpty,
                                    ),
                                  IssueProcurement() => ProcurementFormItem(
                                      categoryId: categoryId,
                                      projectId: projectId,
                                      issueId: issueId,
                                      items: value.procurementItems,
                                      hasProcurementItems: hasProcurementItems,
                                      isProcurementItemEmpty:
                                          isProcurementItemEmpty,
                                    ),
                                  IssueTransaction() => TransactionFormItem(
                                      categoryId: categoryId,
                                      projectId: projectId,
                                      issueId: issueId,
                                      currency: value.currency,
                                      items: value.transactionItems,
                                      hasTransactionItems: hasTransactionItems,
                                      isTransactionItemEmpty:
                                          isTransactionItemEmpty,
                                    ),
                                  _ => SizedBox(),
                                },
                                AttachmentUploadWidget(
                                  title: Intl.message('issue_form_attachment'),
                                  attachments: value.attachments,
                                  files: value.files,
                                  path: 'issue',
                                  onAddFile: (file) {
                                    ref
                                        .read(issueFormControllerProvider(
                                                projectId: projectId,
                                                issueId: issueId)
                                            .notifier)
                                        .addFile(file);
                                  },
                                  onRemoveFile: (file) {
                                    ref
                                        .read(issueFormControllerProvider(
                                                projectId: projectId,
                                                issueId: issueId)
                                            .notifier)
                                        .removeFile(file);
                                  },
                                  onRemoveAttachment: (attachment) {
                                    ref
                                        .read(issueFormControllerProvider(
                                                projectId: projectId,
                                                issueId: issueId)
                                            .notifier)
                                        .removeAttachment(attachment);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ToolbarOverlayWidget(
                        editor: editor,
                        document: document,
                        composer: composer,
                        toolbarKey: toolbarKey,
                        overlayKey: overlayKey,
                        toolbarLink: toolbarLink,
                        overlayLink: overlayLink,
                        linkOverlayController: linkOverlayController,
                        imageOverlayController: imageOverlayController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 32.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400.0),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () async {
                      isContentInvalid.value = document.isEmpty ||
                          document.every(
                            (node) =>
                                node is ParagraphNode &&
                                node.text.toPlainText().trim().isEmpty,
                          );

                      if (value.category is IssueContract) {
                        final contractItems = value.contractItems;
                        final transactionItems = value.transactionItems;

                        hasContractItems.value = contractItems.isEmpty;

                        isContractItemEmpty.value = contractItems.isNotEmpty &&
                            contractItems.any((item) =>
                                item.item.isEmpty || item.price.isEmpty);

                        hasTransactionItems.value = transactionItems.isEmpty;

                        isTransactionItemEmpty.value = transactionItems
                                .isNotEmpty &&
                            transactionItems.any((item) =>
                                item.category == null || item.price.isEmpty);

                        final totalRatio = transactionItems.isNotEmpty
                            ? transactionItems.fold(0.0, (sum, item) {
                                final ratio =
                                    double.tryParse(item.ratio) ?? 0.0;
                                return sum + ratio;
                              })
                            : 0.0;

                        isRatioInvalid.value = transactionItems.isNotEmpty &&
                            !isTransactionItemEmpty.value &&
                            (totalRatio != 100);
                      }

                      if (value.category is IssueKickoff) {
                        final kickoffDate = value.kickoffDate;

                        isKickoffDateEmpty.value = kickoffDate == null;
                      }

                      if (value.category is IssueProcurement) {
                        final items = value.procurementItems;

                        hasProcurementItems.value = items.isEmpty;

                        isProcurementItemEmpty.value = items.isNotEmpty &&
                            items.any((item) =>
                                item.item.isEmpty ||
                                item.spec.isEmpty ||
                                item.quantity.isEmpty ||
                                item.unitPrice.isEmpty ||
                                item.totalAmount.isEmpty ||
                                // 온라인 구매 (isOnlinePurchase == true)인 경우:
                                (item.isOnlinePurchase &&
                                    (item.purchaseUrl == null ||
                                        item.purchaseUrl!.isEmpty)) ||
                                // 온라인 구매가 아닌 경우 (isOnlinePurchase == false):
                                // (단, supplier가 있는 경우 isOnlinePurchase가 false여도 됨을 반영)
                                (!item.isOnlinePurchase &&
                                    item.supplier == null));
                      }

                      if (value.category is IssueTransaction) {
                        final items = value.transactionItems;

                        hasTransactionItems.value = items.isEmpty;

                        isTransactionItemEmpty.value = items.isNotEmpty &&
                            items.any((item) =>
                                item.category == null || item.price.isEmpty);
                      }

                      if (isContentInvalid.value ||
                          hasContractItems.value ||
                          isContractItemEmpty.value ||
                          hasTransactionItems.value ||
                          isTransactionItemEmpty.value ||
                          isRatioInvalid.value ||
                          isKickoffDateEmpty.value ||
                          hasProcurementItems.value ||
                          isProcurementItemEmpty.value) {
                        return;
                      }

                      await ref
                          .read(issueFormControllerProvider(
                                  projectId: projectId, issueId: issueId)
                              .notifier)
                          .serializeAndSetContent(document: document);

                      if (issueId == null) {
                        await ref
                            .read(issueSubmitControllerProvider.notifier)
                            .createIssue(projectId: projectId);
                      } else {
                        await ref
                            .read(issueSubmitControllerProvider.notifier)
                            .updateIssue(
                                projectId: projectId, issueId: issueId!);
                      }
                    },
                    child: Text(
                      issueId != null
                          ? Intl.message('common_edit')
                          : Intl.message('common_post'),
                    ),
                  ),
                ),
                if (issueId != null)
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: FilledButton(
                      onPressed: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (_) => DeleteDialog(
                            title: Intl.message('issue_form_delete_dialog_1'),
                            content: Intl.message('issue_form_delete_dialog_2'),
                          ),
                        );

                        if (result) {
                          await ref
                              .read(issueSubmitControllerProvider.notifier)
                              .deleteIssue(
                                  projectId: projectId, issueId: issueId!);
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.error,
                        iconColor: colorScheme.onError,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(
                          Symbols.delete_rounded,
                          size: 19.0,
                        ),
                      ),
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
