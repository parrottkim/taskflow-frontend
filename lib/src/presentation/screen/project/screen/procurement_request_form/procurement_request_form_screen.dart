import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/procurement_request_form/widget/request_form_section.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class ProcurementRequestFormScreen extends ConsumerWidget {
  final int projectId;
  final int issueId;
  final int? requestId;

  const ProcurementRequestFormScreen({
    super.key,
    required this.projectId,
    required this.issueId,
    this.requestId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
      procurementIssueFormControllerProvider(issueId: issueId),
    );

    return switch (form) {
      AsyncData(:final value) => _DesktopWidget(
        projectId: projectId,
        issueId: issueId,
        requestId: requestId,
        value: value,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          projectId: projectId,
          issueId: issueId,
          requestId: requestId,
          value: ProcurementIssueFormState(),
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int projectId;
  final int issueId;
  final int? requestId;
  final ProcurementIssueFormState value;

  const _DesktopWidget({
    required this.projectId,
    required this.issueId,
    this.requestId,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final steps = value.steps;

    final currentIndex = useState(0);
    final currentStep = steps[currentIndex.value];
    final isLastStep = currentIndex.value == steps.length - 1;

    final isSelectedSupplierEmpty = useState(false);
    final invalidTitleSupplierIds = useState<Set<int>>({});
    final nullableDeliverySupplierIds = useState<Set<int>>({});
    final nullablePaymentTermsSupplierIds = useState<Set<int>>({});
    final invalidDeliverySupplierIds = useState<Set<int>>({});
    final invalidPaymentTermsSupplierIds = useState<Set<int>>({});
    final hasProcurementIssueItems = useState<Set<int>>({});
    final isProcurementIssueItemEmpty = useState<Set<int>>({});

    ref.listen(issueSubmitControllerProvider, (_, submitState) {
      if (submitState is IssueSubmitPending) {
        LoadingOverlay.show(context);
        return;
      }

      LoadingOverlay.hide();

      switch (submitState) {
        case IssueSubmitCreated(:final issue):
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message(
                    'issue_form_procurement_requested_created',
                  ),
                ),
              );

          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': projectId.toString()},
            queryParameters: {
              'view': 'procurement',
              'issue': issue.id.toString(),
            },
          );

        case IssueSubmitDeleted():
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message(
                    'issue_form_procurement_requested_deleted',
                  ),
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

    return BranchLayout(
      onTap: () {
        if (currentIndex.value > 0) {
          currentIndex.value = currentIndex.value - 1;
        } else {
          context.pop();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RequestFormSection(
              step: currentStep,
              items: value.items,
              requests: value.requests,
              selectedSupplierIds: value.selectedSupplierIds,
              isSelectedSupplierEmpty: isSelectedSupplierEmpty,
              onSupplierSelectionChanged: (selection) {
                isSelectedSupplierEmpty.value = false;

                final (supplierId, selected) = selection;

                final requestedSupplierIds = value.requests
                    .map((request) => request.supplier.id)
                    .toSet();

                if (selected && requestedSupplierIds.contains(supplierId)) {
                  return;
                }

                final updated = {...value.selectedSupplierIds};

                if (selected) {
                  updated.add(supplierId);
                } else {
                  updated.remove(supplierId);
                }

                invalidTitleSupplierIds.value = invalidTitleSupplierIds.value
                    .where((id) => updated.contains(id))
                    .toSet();
                invalidDeliverySupplierIds.value = invalidDeliverySupplierIds
                    .value
                    .where((id) => updated.contains(id))
                    .toSet();
                nullableDeliverySupplierIds.value = nullableDeliverySupplierIds
                    .value
                    .where((id) => updated.contains(id))
                    .toSet();
                invalidPaymentTermsSupplierIds.value =
                    invalidPaymentTermsSupplierIds.value
                        .where((id) => updated.contains(id))
                        .toSet();
                nullablePaymentTermsSupplierIds.value =
                    nullablePaymentTermsSupplierIds.value
                        .where((id) => updated.contains(id))
                        .toSet();
                hasProcurementIssueItems.value = hasProcurementIssueItems.value
                    .where((id) => updated.contains(id))
                    .toSet();
                isProcurementIssueItemEmpty.value = isProcurementIssueItemEmpty
                    .value
                    .where((id) => updated.contains(id))
                    .toSet();

                ref
                    .read(
                      procurementIssueFormControllerProvider(
                        issueId: issueId,
                      ).notifier,
                    )
                    .setSelectedSupplierIds(selectedSupplierIds: updated);
              },
              titles: value.titles,
              deliveryDates: value.deliveryDates,
              paymentTerms: value.paymentTerms,
              hasFees: value.hasFees,
              notes: value.notes,
              invalidTitleSupplierIds: invalidTitleSupplierIds,
              nullableDeliverySupplierIds: nullableDeliverySupplierIds,
              nullablePaymentTermsSupplierIds: nullablePaymentTermsSupplierIds,
              invalidDeliverySupplierIds: invalidDeliverySupplierIds,
              invalidPaymentTermsSupplierIds: invalidPaymentTermsSupplierIds,
              hasProcurementIssueItems: hasProcurementIssueItems,
              isProcurementIssueItemEmpty: isProcurementIssueItemEmpty,
              onTitleChanged: ({required int supplierId, String? value}) {
                // 💡 [수정] 사용자가 입력을 시작하면 에러 붉은 테두리를 지워줌
                invalidTitleSupplierIds.value = {
                  ...invalidTitleSupplierIds.value,
                }..remove(supplierId);

                // 💡 [추가] 노티파이어를 호출하여 상태를 실시간으로 변경하도록 반영
                ref
                    .read(
                      procurementIssueFormControllerProvider(
                        issueId: issueId,
                      ).notifier,
                    )
                    .updateSupplierRequest(
                      supplierId: supplierId,
                      title: value,
                    );
              },
              onDeliveryDateChanged:
                  ({required int supplierId, DateTime? date}) {
                    invalidDeliverySupplierIds.value = {
                      ...invalidDeliverySupplierIds.value,
                    }..remove(supplierId);
                    hasProcurementIssueItems.value = {
                      ...hasProcurementIssueItems.value,
                    }..remove(supplierId);
                    isProcurementIssueItemEmpty.value = {
                      ...isProcurementIssueItemEmpty.value,
                    }..remove(supplierId);

                    ref
                        .read(
                          procurementIssueFormControllerProvider(
                            issueId: issueId,
                          ).notifier,
                        )
                        .updateSupplierRequest(
                          supplierId: supplierId,
                          deliveryDate: date,
                          updateDeliveryDate: true,
                        );
                  },
              onPaymentTermsChanged:
                  ({required int supplierId, String? value}) {
                    invalidPaymentTermsSupplierIds.value = {
                      ...invalidPaymentTermsSupplierIds.value,
                    }..remove(supplierId);
                    hasProcurementIssueItems.value = {
                      ...hasProcurementIssueItems.value,
                    }..remove(supplierId);
                    isProcurementIssueItemEmpty.value = {
                      ...isProcurementIssueItemEmpty.value,
                    }..remove(supplierId);

                    ref
                        .read(
                          procurementIssueFormControllerProvider(
                            issueId: issueId,
                          ).notifier,
                        )
                        .updateSupplierRequest(
                          supplierId: supplierId,
                          paymentTerms: value,
                          updatePaymentTerms: true,
                        );
                  },
              onHasFeeChanged:
                  ({required int supplierId, required bool hasFee}) {
                    hasProcurementIssueItems.value = {
                      ...hasProcurementIssueItems.value,
                    }..remove(supplierId);
                    isProcurementIssueItemEmpty.value = {
                      ...isProcurementIssueItemEmpty.value,
                    }..remove(supplierId);

                    ref
                        .read(
                          procurementIssueFormControllerProvider(
                            issueId: issueId,
                          ).notifier,
                        )
                        .updateSupplierRequest(
                          supplierId: supplierId,
                          hasFee: hasFee,
                        );
                  },
              onNoteChanged: ({required int supplierId, String? note}) {
                ref
                    .read(
                      procurementIssueFormControllerProvider(
                        issueId: issueId,
                      ).notifier,
                    )
                    .updateSupplierRequest(
                      supplierId: supplierId,
                      note: note,
                      updateNote: true,
                    );
              },
              onRequestedItemChanged:
                  ({
                    required int supplierId,
                    required int index,
                    String? item,
                    String? spec,
                    String? quantity,
                    String? unitPrice,
                    String? totalAmount,
                  }) {
                    hasProcurementIssueItems.value = {
                      ...hasProcurementIssueItems.value,
                    }..remove(supplierId);
                    isProcurementIssueItemEmpty.value = {
                      ...isProcurementIssueItemEmpty.value,
                    }..remove(supplierId);

                    ref
                        .read(
                          procurementIssueFormControllerProvider(
                            issueId: issueId,
                          ).notifier,
                        )
                        .updateSupplierRequestItem(
                          supplierId: supplierId,
                          index: index,
                          item: item,
                          spec: spec,
                          quantity: quantity,
                          unitPrice: unitPrice,
                          totalAmount: totalAmount,
                        );
                  },
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 16.0,
              bottom: 32.0,
            ),
            constraints: BoxConstraints(maxWidth: 430.0),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () async {
                      if (value.selectedSupplierIds.isEmpty) {
                        isSelectedSupplierEmpty.value = true;
                        return;
                      }

                      if (isLastStep) {
                        final supplierItemsMap = {
                          for (final id in value.selectedSupplierIds)
                            id: value.items
                                .where((item) => item.supplier?.id == id)
                                .toList(),
                        };

                        final emptyItemSuppliers = supplierItemsMap.entries
                            .where((entry) => entry.value.isEmpty)
                            .map((entry) => entry.key)
                            .toSet();
                        final invalidItemSuppliers = supplierItemsMap.entries
                            .where(
                              (entry) => entry.value.any(
                                (item) =>
                                    item.item.trim().isEmpty ||
                                    item.spec.trim().isEmpty ||
                                    item.quantity.trim().isEmpty ||
                                    item.unitPrice.trim().isEmpty ||
                                    item.totalAmount.trim().isEmpty ||
                                    (item.isOnlinePurchase &&
                                        (item.purchaseUrl?.trim().isEmpty ??
                                            true)),
                              ),
                            )
                            .map((entry) => entry.key)
                            .toSet();

                        hasProcurementIssueItems.value = emptyItemSuppliers;
                        isProcurementIssueItemEmpty.value =
                            invalidItemSuppliers;

                        final invalidTitles = value.selectedSupplierIds
                            .where(
                              (id) =>
                                  (value.titles[id]?.trim().isEmpty ?? true),
                            )
                            .toSet();
                        final invalidDelivery = value.selectedSupplierIds
                            .where(
                              (id) =>
                                  !nullableDeliverySupplierIds.value.contains(
                                    id,
                                  ) &&
                                  value.deliveryDates[id] == null,
                            )
                            .toSet();
                        final invalidPaymentTerms = value.selectedSupplierIds
                            .where(
                              (id) =>
                                  !nullablePaymentTermsSupplierIds.value
                                      .contains(id) &&
                                  (value.paymentTerms[id]?.trim().isEmpty ??
                                      true),
                            )
                            .toSet();

                        invalidTitleSupplierIds.value = invalidTitles;
                        invalidDeliverySupplierIds.value = invalidDelivery;
                        invalidPaymentTermsSupplierIds.value =
                            invalidPaymentTerms;

                        if (invalidTitles.isNotEmpty ||
                            invalidDelivery.isNotEmpty ||
                            invalidPaymentTerms.isNotEmpty ||
                            emptyItemSuppliers.isNotEmpty ||
                            invalidItemSuppliers.isNotEmpty) {
                          return;
                        }

                        await ref
                            .read(issueSubmitControllerProvider.notifier)
                            .createProcurementRequests(
                              projectId: projectId,
                              issueId: issueId,
                            );
                        return;
                      }

                      currentIndex.value = currentIndex.value + 1;
                    },
                    child: Text(
                      isLastStep
                          ? requestId == null
                                ? Intl.message('common_post')
                                : Intl.message('common_edit')
                          : Intl.message('common_next'),
                    ),
                  ),
                ),
                if (requestId != null)
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: FilledButton(
                      onPressed: () async {},
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
        ],
      ),
    );
  }
}
