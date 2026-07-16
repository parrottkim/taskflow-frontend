import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/contract_form_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/kickoff_form_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/procurement_form_item.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/transaction_form_item.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/core/core.dart';

class IssueFormScreen extends ConsumerWidget {
  final int projectId;
  final int categoryId;
  final int? issueId;

  const IssueFormScreen({
    super.key,
    required this.projectId,
    required this.categoryId,
    this.issueId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
      issueFormControllerProvider(
        projectId: projectId,
        categoryId: categoryId,
        issueId: issueId,
      ),
    );

    return BranchLayout(
      child: switch (form) {
        AsyncData(:final value) => _DesktopWidget(
          projectId: projectId,
          categoryId: categoryId,
          issueId: issueId,
          value: value,
        ),
        AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
          error: error,
          stackTrace: stackTrace,
        ),
        _ => Skeletonizer(
          child: _DesktopWidget(
            projectId: projectId,
            categoryId: categoryId,
            issueId: issueId,
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
  final int projectId;
  final int categoryId;
  final int? issueId;

  final IssueFormState value;

  const _DesktopWidget({
    required this.value,
    required this.projectId,
    required this.categoryId,
    this.issueId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final isContentInvalid = useState(false);

    final hasContractIssueItems = useState(false);
    final isContractIssueItemEmpty = useState(false);

    final hasTransactionIssueItems = useState(false);
    final isTransactionIssueItemEmpty = useState(false);
    final isRatioInvalid = useState(false);

    final isKickoffDateEmpty = useState(false);

    final hasProcurementIssueItems = useState(false);
    final isProcurementIssueItemEmpty = useState(false);

    final editorState = useMemoized(() {
      return value.content == null
          ? EditorState.blank(withInitialText: true)
          : EditorState(document: markdownToDocument(value.content!));
    }, []);

    ref.listen(issueSubmitControllerProvider, (_, submitState) {
      // 1. 로딩 상태 분기
      if (submitState is IssueSubmitPending) {
        LoadingOverlay.show(context);
        return;
      }

      LoadingOverlay.hide();

      // 2. Sealed class 상태별 흐름 제어
      switch (submitState) {
        case IssueSubmitCreated(:final issue) ||
            IssueSubmitUpdated(:final issue):
          final isCreated = submitState is IssueSubmitCreated;

          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message(
                    isCreated ? 'issue_form_created' : 'issue_form_updated',
                  ),
                ),
              );

          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': projectId.toString()},
            queryParameters: {
              'view': switch (value.category) {
                IssueProcurement() => 'procurement',
                IssueApproval() => 'approval',
                _ => 'contract',
              },
              'issue': issue.id.toString(),
            },
          );

        case IssueSubmitDeleted():
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('issue_form_deleted'),
                ),
              );

          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': projectId.toString()},
          );

        default:
          break;
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditorWidget(editorState: editorState),
                InvalidWidget(
                  visible: isContentInvalid.value,
                  text: Intl.message('issue_form_invalid_1'),
                ),
                SizedBox(height: 24.0),
                switch (value.category) {
                  IssueContract() => ContractFormItem(
                    projectId: projectId,
                    categoryId: categoryId,
                    issueId: issueId,
                    contractItems: value.contractItems,
                    transactionItems: value.transactionItems,
                    hasContractIssueItems: hasContractIssueItems,
                    isContractIssueItemEmpty: isContractIssueItemEmpty,
                    hasTransactionIssueItems: hasTransactionIssueItems,
                    isTransactionIssueItemEmpty: isTransactionIssueItemEmpty,
                    isRatioInvalid: isRatioInvalid,
                  ),
                  IssueKickoff() => KickoffFormItem(
                    projectId: projectId,
                    categoryId: categoryId,
                    issueId: issueId,
                    kickoffDate: value.kickoffDate,
                    isKickoffDateEmpty: isKickoffDateEmpty,
                  ),
                  IssueProcurement() => ProcurementFormItem(
                    projectId: projectId,
                    categoryId: categoryId,
                    issueId: issueId,
                    items: value.procurementItems,
                    requests: value.requests,
                    hasProcurementIssueItems: hasProcurementIssueItems,
                    isProcurementIssueItemEmpty: isProcurementIssueItemEmpty,
                  ),
                  IssueTransaction() => TransactionFormItem(
                    projectId: projectId,
                    categoryId: categoryId,
                    issueId: issueId,
                    currency: value.currency,
                    items: value.transactionItems,
                    hasTransactionIssueItems: hasTransactionIssueItems,
                    isTransactionIssueItemEmpty: isTransactionIssueItemEmpty,
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
                        .read(
                          issueFormControllerProvider(
                            projectId: projectId,
                            categoryId: categoryId,
                            issueId: issueId,
                          ).notifier,
                        )
                        .addFile(file: file);
                  },
                  onRemoveFile: (file) {
                    ref
                        .read(
                          issueFormControllerProvider(
                            projectId: projectId,
                            categoryId: categoryId,
                            issueId: issueId,
                          ).notifier,
                        )
                        .removeFile(file: file);
                  },
                  onRemoveAttachment: (attachment) async {
                    await ref
                        .read(
                          issueFormControllerProvider(
                            projectId: projectId,
                            categoryId: categoryId,
                            issueId: issueId,
                          ).notifier,
                        )
                        .removeAttachment(attachment: attachment);
                  },
                ),
              ],
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 16.0,
            bottom: 32.0,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400.0),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () async {
                      isContentInvalid.value = editorState.document.isEmpty;

                      if (value.category is IssueContract) {
                        final contractItems = value.contractItems;
                        final transactionItems = value.transactionItems;

                        hasContractIssueItems.value = contractItems.isEmpty;

                        isContractIssueItemEmpty.value =
                            contractItems.isNotEmpty &&
                            contractItems.any(
                              (item) => item.item.isEmpty || item.price.isEmpty,
                            );

                        hasTransactionIssueItems.value =
                            transactionItems.isEmpty;

                        isTransactionIssueItemEmpty.value =
                            transactionItems.isNotEmpty &&
                            transactionItems.any(
                              (item) =>
                                  item.category == null || item.price.isEmpty,
                            );

                        final totalRatio = transactionItems.isNotEmpty
                            ? transactionItems.fold(0.0, (sum, item) {
                                final ratio =
                                    double.tryParse(item.ratio) ?? 0.0;
                                return sum + ratio;
                              })
                            : 0.0;

                        isRatioInvalid.value =
                            transactionItems.isNotEmpty &&
                            !isTransactionIssueItemEmpty.value &&
                            (totalRatio != 100);
                      }

                      if (value.category is IssueKickoff) {
                        final kickoffDate = value.kickoffDate;

                        isKickoffDateEmpty.value = kickoffDate == null;
                      }

                      if (value.category is IssueProcurement) {
                        final items = value.procurementItems;

                        hasProcurementIssueItems.value = items.isEmpty;

                        isProcurementIssueItemEmpty.value =
                            items.isNotEmpty &&
                            items.any(
                              (item) =>
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
                                      item.supplier == null),
                            );
                      }

                      if (value.category is IssueTransaction) {
                        final items = value.transactionItems;

                        hasTransactionIssueItems.value = items.isEmpty;

                        isTransactionIssueItemEmpty.value =
                            items.isNotEmpty &&
                            items.any(
                              (item) =>
                                  item.category == null || item.price.isEmpty,
                            );
                      }

                      if (isContentInvalid.value ||
                          hasContractIssueItems.value ||
                          isContractIssueItemEmpty.value ||
                          hasTransactionIssueItems.value ||
                          isTransactionIssueItemEmpty.value ||
                          isRatioInvalid.value ||
                          isKickoffDateEmpty.value ||
                          hasProcurementIssueItems.value ||
                          isProcurementIssueItemEmpty.value) {
                        return;
                      }

                      if (issueId == null) {
                        await ref
                            .read(issueSubmitControllerProvider.notifier)
                            .createIssue(
                              projectId: projectId,
                              categoryId: categoryId,
                              editorState: editorState,
                            );
                      } else {
                        await ref
                            .read(issueSubmitControllerProvider.notifier)
                            .updateIssue(
                              projectId: projectId,
                              categoryId: categoryId,
                              issueId: issueId!,
                              editorState: editorState,
                            );
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
                                projectId: projectId,
                                issueId: issueId!,
                              );
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.error,
                        iconColor: colorScheme.onError,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(Symbols.delete_rounded, size: 19.0),
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
