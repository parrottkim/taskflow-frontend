part of '../controller.dart';

@riverpod
class IssueFormController extends _$IssueFormController {
  @override
  FutureOr<IssueFormState> build(
          {required int categoryId,
          required int projectId,
          int? issueId}) async =>
      await _init();

  Future<IssueFormState> _init() async {
    if (issueId == null) {
      if (categoryId == 1) {
        return IssueFormState.contract();
      } else if (categoryId == 2) {
        return IssueFormState.kickoff();
      } else if (categoryId == 3) {
        return IssueFormState.approval();
      } else if (categoryId == 4) {
        return IssueFormState.procurement();
      } else if (categoryId == 5) {
        return IssueFormState.transaction();
      } else if (categoryId == 6) {
        return IssueFormState.declaration();
      } else if (categoryId == 7) {
        return IssueFormState.payment();
      }
    }

    final result =
        await ref.read(issueRepositoryProvider).getIssue(id: issueId!);

    if (result.category.id == 1) {
      return IssueFormState.contract(
        content: result.content,
        items: (result.details as IssueContractDetails).items,
        attachments: result.attachments,
      );
    } else if (result.category.id == 2) {
      return IssueFormState.kickoff(
        content: result.content,
        kickoffId: (result.details as IssueKickoffDetails).id,
        kickoffDate: (result.details as IssueKickoffDetails).kickoffDate,
        attachments: result.attachments,
      );
    } else if (result.category.id == 3) {
      return IssueFormState.approval(
        content: result.content,
        attachments: result.attachments,
      );
    } else if (result.category.id == 4) {
      return IssueFormState.procurement(
        content: result.content,
        items: (result.details as IssueProcurementDetails).items,
        attachments: result.attachments,
      );
    } else if (result.category.id == 5) {
      return IssueFormState.transaction(
        content: result.content,
        items: (result.details as IssueTransactionDetails).items,
        attachments: result.attachments,
      );
    } else if (result.category.id == 6) {
      return IssueFormState.declaration(
        content: result.content,
        attachments: result.attachments,
      );
    } else if (result.category.id == 7) {
      return IssueFormState.payment(
        content: result.content,
        attachments: result.attachments,
      );
    }

    return IssueFormState();
  }

  Future<void> serializeAndSetContent(
      {required MutableDocument document}) async {
    final Map<ImageNode, MultipartFile> map = {};
    final nodes = document.whereType<ImageNode>();

    for (final node in nodes) {
      try {
        final base64 = node.imageUrl.split(',').last;
        final bytes = base64Decode(base64);
        final mimeType = lookupMimeType('', headerBytes: bytes) ?? 'image/jpeg';

        final extension = extensionFromMime(mimeType) ?? 'jpeg';
        final filename = '${node.id}.$extension'; // 임시 파일명에 고유 ID 추가

        final multipartFile = MultipartFile.fromBytes(
          bytes,
          filename: filename,
          contentType: MediaType.parse(mimeType),
        );

        map[node] = multipartFile;
      } catch (e) {
        print('Image processing failed for node: ${node.id}, error: $e');
      }
    }

    // 2. 맵의 값(업로드할 파일 리스트)만 추출하여 일괄 업로드합니다.
    final files = map.values.toList();

    if (files.isNotEmpty) {
      try {
        final uploadResults = await ref
            .read(sftpRepositoryProvider)
            .uploadInlineImage(path: 'issue', files: files);

        // 3. 업로드 결과를 순서대로 순회하며 문서의 노드를 업데이트합니다.
        final originalNodes = map.keys.toList();

        for (int i = 0; i < uploadResults.length; i++) {
          final originalNode = originalNodes[i];
          final uploadedUrl = uploadResults[i].url; // 서버에서 반환한 최종 URL

          final newNode = ImageNode(
            id: originalNode.id,
            imageUrl: uploadedUrl,
          );
          document.replaceNodeById(originalNode.id, newNode);
        }
      } catch (e) {
        print('Batch image upload failed, error: $e');
      }
    }

    // 4. 최종 문서를 Markdown으로 변환하고 상태를 업데이트합니다.
    final markdown = serializeDocumentToMarkdown(document,
        syntax: MarkdownSyntax.superEditor);

    print(markdown);

    state = AsyncData(state.valueOrNull!.copyWith(content: markdown));
  }

  void setContent({required bool flag}) {
    final value = state.valueOrNull;

    if (value == null) return;
  }

  void addContractItem({ContractItem? item}) {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormContract) return;

    state = AsyncData(
        value.copyWith(items: [...?value.items, item ?? ContractItem.empty()]));
  }

  void updateContractItem(
      {required int index, String? item, Currency? currency, String? price}) {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormContract) return;

    final newItems = [...?value.items];

    // 인덱스가 유효한지 확인
    if (index >= 0 && index < newItems.length) {
      final oldItem = newItems[index];
      newItems[index] = oldItem.copyWith(
        item: item ?? oldItem.item,
        currency: currency ?? oldItem.currency,
        price: price ?? oldItem.price,
      );
      state = AsyncData(value.copyWith(items: newItems));
    }
  }

  void removeContractItem({required int index}) {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormContract) return;

    final newItems = [...?value.items];

    // 2. 인덱스가 유효한지 확인하고, 유효하다면 항목을 제거합니다.
    if (index >= 0 && index < newItems.length) {
      newItems.removeAt(index);
    } else {
      // 인덱스가 유효하지 않으면 아무것도 하지 않습니다.
      return;
    }

    // 3. 제거된 항목이 포함되지 않은 새 리스트로 상태를 업데이트합니다.
    state = AsyncData(value.copyWith(items: newItems));
  }

  void removeAllContractItem() {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormContract) return;

    state = AsyncData(value.copyWith(items: null));
  }

  void setKickoffDate({required DateTime date}) {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormKickoff) return;

    state = AsyncData(value.copyWith(kickoffDate: date));
  }

  void addProcurementItem({ProcurementItem? item}) {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormProcurement) return;

    state = AsyncData(value
        .copyWith(items: [...?value.items, item ?? ProcurementItem.empty()]));
  }

  void updateProcurementItem({
    required int index,
    String? item,
    String? spec,
    String? quantity,
    String? unitPrice,
    String? totalAmount,
    bool? isOnlinePurchase,
    String? purchaseUrl,
    Supplier? supplier,
  }) {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormProcurement) return;

    final newItems = [...?value.items];

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
      );
      state = AsyncData(value.copyWith(items: newItems));
    }
  }

  void removeProcurementItem({required int index}) {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormProcurement) return;

    final newItems = [...?value.items];

    // 2. 인덱스가 유효한지 확인하고, 유효하다면 항목을 제거합니다.
    if (index >= 0 && index < newItems.length) {
      newItems.removeAt(index);
    } else {
      // 인덱스가 유효하지 않으면 아무것도 하지 않습니다.
      return;
    }

    // 3. 제거된 항목이 포함되지 않은 새 리스트로 상태를 업데이트합니다.
    state = AsyncData(value.copyWith(items: newItems));
  }

  void removeAllProcurementItem() {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormProcurement) return;

    state = AsyncData(value.copyWith(items: null));
  }

  void addTransactionItem({TransactionItem? item}) {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormTransaction) return;

    state = AsyncData(value
        .copyWith(items: [...?value.items, item ?? TransactionItem.empty()]));
  }

  void updateTransactionItem(
      {required int index,
      TransactionItemCategory? category,
      Currency? currency,
      String? price,
      String? note}) {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormTransaction) return;

    final newItems = [...?value.items];

    // 인덱스가 유효한지 확인
    if (index >= 0 && index < newItems.length) {
      final oldItem = newItems[index];
      newItems[index] = oldItem.copyWith(
        category: category ?? oldItem.category,
        currency: currency ?? oldItem.currency,
        price: price ?? oldItem.price,
        note: note ?? oldItem.note,
      );
      state = AsyncData(value.copyWith(items: newItems));
    }
  }

  void removeTransactionItem({required int index}) {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormTransaction) return;

    final newItems = [...?value.items];

    // 2. 인덱스가 유효한지 확인하고, 유효하다면 항목을 제거합니다.
    if (index >= 0 && index < newItems.length) {
      newItems.removeAt(index);
    } else {
      // 인덱스가 유효하지 않으면 아무것도 하지 않습니다.
      return;
    }

    // 3. 제거된 항목이 포함되지 않은 새 리스트로 상태를 업데이트합니다.
    state = AsyncData(value.copyWith(items: newItems));
  }

  void removeAllTransactionItem() {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value is! IssueFormTransaction) return;

    state = AsyncData(value.copyWith(items: null));
  }

  void removeAttachment(IssueAttachment attachment) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(attachments: [
      ...value.attachments?.where((item) => item.id != attachment.id) ?? [],
    ]));
  }

  void addFile(XFile file) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(files: [...?value.files, file]));
  }

  void removeFile(XFile file) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(files: [
      ...value.files?.where((item) => item.path != file.path) ?? [],
    ]));
  }
}
