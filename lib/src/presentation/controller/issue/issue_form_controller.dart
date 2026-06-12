part of '../controller.dart';

@riverpod
class IssueFormController extends _$IssueFormController {
  @override
  FutureOr<IssueFormState> build({
    required int projectId,
    required int categoryId,
    int? issueId,
  }) async => await _init();

  Future<IssueFormState> _init() async {
    if (issueId != null) {
      final result = await ref
          .read(issueRepositoryProvider)
          .getIssue(id: issueId!);

      return IssueFormState(
        category: result.category,
        content: result.content,
        attachments: result.attachments,
        currency: result.currency,
        kickoffDate: result.kickoffDate,
        contractItems: result.contractItems,
        transactionItems: result.transactionItems,
        procurementItems: result.procurementItems,
        requests: result.requests,
      );
    }

    final category = await ref
        .read(issueRepositoryProvider)
        .getCategory(id: categoryId);

    final contract = await ref
        .read(issueRepositoryProvider)
        .getContractIssue(id: projectId);

    final contractItems = await ref
        .read(issueRepositoryProvider)
        .getContractIssueItems(id: projectId);

    final transactionItems = await ref
        .read(issueRepositoryProvider)
        .getTransactionIssueItems(id: projectId);

    return IssueFormState(
      category: category,
      currency: contract.data?.currency,
      contractItems: contractItems,
      transactionItems: transactionItems,
    );
  }

  void setContent(String markdown) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(content: markdown));
  }

  void setContractCurrency({required Currency currency}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(currency: currency));
  }

  void addContractIssueItem({ContractIssueItem? item}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(
        contractItems: [
          ...value.contractItems,
          item ?? ContractIssueItem.empty(),
        ],
      ),
    );
  }

  void updateContractIssueItem({
    required int index,
    String? item,
    String? price,
  }) {
    final value = state.value;
    if (value == null) return;

    final newItems = [...value.contractItems];

    // 인덱스가 유효한지 확인
    if (index >= 0 && index < newItems.length) {
      final oldItem = newItems[index];
      newItems[index] = oldItem.copyWith(
        item: item ?? oldItem.item,
        price: price ?? oldItem.price,
      );

      // total 재계산
      final total = newItems.fold<double>(0.0, (sum, item) {
        return sum + (double.tryParse(item.price.replaceAll(',', '')) ?? 0.0);
      });

      // transactionItems 가격 업데이트
      final updatedTransactions = value.transactionItems.map((t) {
        final ratio = double.tryParse(t.ratio.replaceAll(',', '')) ?? 0.0;
        final calculatedPrice = NumberFormat(
          '#,###.##',
        ).format(total * (ratio / 100));
        return t.copyWith(price: calculatedPrice);
      }).toList();

      state = AsyncData(
        value.copyWith(
          contractItems: newItems,
          transactionItems: updatedTransactions,
        ),
      );
    }
  }

  void removeContractIssueItem({required int index}) {
    final value = state.value;

    if (value == null) return;

    final newItems = [...value.contractItems];

    // 2. 인덱스가 유효한지 확인하고, 유효하다면 항목을 제거합니다.
    if (index >= 0 && index < newItems.length) {
      newItems.removeAt(index);
    } else {
      // 인덱스가 유효하지 않으면 아무것도 하지 않습니다.
      return;
    }

    // 3. 제거된 항목이 포함되지 않은 새 리스트로 상태를 업데이트합니다.
    state = AsyncData(value.copyWith(contractItems: newItems));
  }

  void removeAllContractIssueItem() {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(contractItems: []));
  }

  void setKickoffDate({required DateTime date}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(kickoffDate: date));
  }

  void addProcurementIssueItem({ProcurementIssueItem? item}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(
        procurementItems: [
          ...value.procurementItems,
          item ?? ProcurementIssueItem.empty(),
        ],
      ),
    );
  }

  void updateProcurementIssueItem({
    required int index,
    String? item,
    String? spec,
    String? quantity,
    String? unitPrice,
    String? totalAmount,
    bool? isOnlinePurchase,
    String? purchaseUrl,
    Supplier? supplier,
    String? note,
  }) {
    final value = state.value;

    if (value == null) return;

    final newItems = [...value.procurementItems];

    // 인덱스가 유효한지 확인
    if (index >= 0 && index < newItems.length) {
      final oldItem = newItems[index];

      final newIsOnlinePurchase = isOnlinePurchase ?? oldItem.isOnlinePurchase;

      // 2. purchaseUrl과 supplier 값 결정 로직
      String? finalPurchaseUrl = purchaseUrl ?? oldItem.purchaseUrl;
      Supplier? finalSupplier = supplier ?? oldItem.supplier;

      // isOnlinePurchase 값이 변경되었거나, 새로운 값으로 업데이트하는 경우
      if (isOnlinePurchase != null &&
          isOnlinePurchase != oldItem.isOnlinePurchase) {
        if (newIsOnlinePurchase) {
          // 온라인 구매로 변경되면 supplier를 초기화 (purchaseUrl은 그대로)
          finalSupplier = null;
        } else {
          // 일반 구매로 변경되면 purchaseUrl을 초기화 (supplier는 그대로)
          finalPurchaseUrl = null;
        }
      } else {
        // isOnlinePurchase 값은 변경되지 않았으나, 다른 필드를 업데이트하는 경우
        // purchaseUrl/supplier가 null로 명시적으로 전달되면 그 값을 따름
        if (purchaseUrl != null) finalPurchaseUrl = purchaseUrl;
        if (supplier != null) finalSupplier = supplier;
      }

      newItems[index] = oldItem.copyWith(
        item: item ?? oldItem.item,
        spec: spec ?? oldItem.spec,
        quantity: quantity ?? oldItem.quantity,
        unitPrice: unitPrice ?? oldItem.unitPrice,
        totalAmount: totalAmount ?? oldItem.totalAmount,
        isOnlinePurchase: newIsOnlinePurchase,
        // 결정된 값 적용
        purchaseUrl: finalPurchaseUrl,
        supplier: finalSupplier,
        note: note,
      );
      state = AsyncData(value.copyWith(procurementItems: newItems));
    }
  }

  void removeProcurementIssueItem({required int index}) {
    final value = state.value;

    if (value == null) return;

    final newItems = [...value.procurementItems];

    // 2. 인덱스가 유효한지 확인하고, 유효하다면 항목을 제거합니다.
    if (index >= 0 && index < newItems.length) {
      newItems.removeAt(index);
    } else {
      // 인덱스가 유효하지 않으면 아무것도 하지 않습니다.
      return;
    }

    // 3. 제거된 항목이 포함되지 않은 새 리스트로 상태를 업데이트합니다.
    state = AsyncData(value.copyWith(procurementItems: newItems));
  }

  void removeAllProcurementIssueItem() {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(procurementItems: []));
  }

  void addTransactionIssueItem({TransactionIssueItem? item}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(
        transactionItems: [
          ...value.transactionItems,
          item ?? TransactionIssueItem.empty(),
        ],
      ),
    );
  }

  void updateTransactionIssueItem({
    required int index,
    TransactionIssueItemCategory? category,
    String? price,
    String? ratio,
    String? note,
  }) {
    final value = state.value;

    if (value == null) return;

    final newItems = [...value.transactionItems];

    // 인덱스가 유효한지 확인
    if (index >= 0 && index < newItems.length) {
      final oldItem = newItems[index];
      newItems[index] = oldItem.copyWith(
        category: category ?? oldItem.category,
        price: price ?? oldItem.price,
        ratio: ratio ?? oldItem.ratio,
        note: note ?? oldItem.note,
      );
      state = AsyncData(value.copyWith(transactionItems: newItems));
    }
  }

  void toggleTransactionIssueItemPaid({
    required int index,
    required bool isPaid,
  }) {
    final value = state.value;
    if (value == null) return;

    final items = [...value.transactionItems];
    if (index < 0 || index >= items.length) return;

    final old = items[index];
    items[index] = old.copyWith(
      isPaid: isPaid,
      paidAt: isPaid ? DateTime.now() : null,
    );

    state = AsyncData(value.copyWith(transactionItems: items));
  }

  void removeTransactionIssueItem({required int index}) {
    final value = state.value;

    if (value == null) return;

    final newItems = [...value.transactionItems];

    // 2. 인덱스가 유효한지 확인하고, 유효하다면 항목을 제거합니다.
    if (index >= 0 && index < newItems.length) {
      newItems.removeAt(index);
    } else {
      // 인덱스가 유효하지 않으면 아무것도 하지 않습니다.
      return;
    }

    // 3. 제거된 항목이 포함되지 않은 새 리스트로 상태를 업데이트합니다.
    state = AsyncData(value.copyWith(transactionItems: newItems));
  }

  void removeAllTransactionIssueItem() {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(transactionItems: []));
  }

  Future<void> removeAttachment({required IssueAttachment attachment}) async {
    final value = state.value;

    if (value == null) return;
    if (issueId == null) return;

    await ref
        .read(issueRepositoryProvider)
        .deleteAttachment(issueId: issueId!, fileId: attachment.id);

    state = AsyncData(
      value.copyWith(
        attachments: [
          ...value.attachments?.where((item) => item.id != attachment.id) ?? [],
        ],
      ),
    );
  }

  void addFile({required XFile file}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(files: [...?value.files, file]));
  }

  void removeFile({required XFile file}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(
        files: [...value.files?.where((item) => item.path != file.path) ?? []],
      ),
    );
  }
}
