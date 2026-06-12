part of '../controller.dart';

@riverpod
class IssueSubmitController extends _$IssueSubmitController {
  @override
  IssueSubmitState build() => IssueSubmitState.idle();

  Future<void> createProcurementRequests({
    required int projectId,
    required int issueId,
  }) async {
    final value = ref
        .read(procurementIssueFormControllerProvider(issueId: issueId))
        .value;

    if (value == null) return;
    if (value.selectedSupplierIds.isEmpty) return;

    state = const IssueSubmitState.pending();

    try {
      Issue? issue;

      final supplierIds = value.selectedSupplierIds.toList()..sort();

      for (final supplierId in supplierIds) {
        final supplierItems = value.items
            .where((item) => item.supplier?.id == supplierId)
            .toList();

        if (supplierItems.isEmpty) {
          continue;
        }

        final title = value.titles[supplierId]!;
        final deliveryDate = value.deliveryDates[supplierId];
        final paymentTerms = value.paymentTerms[supplierId]?.trim();
        final hasFee = value.hasFees[supplierId] ?? false;
        final note = value.notes[supplierId]?.trim();

        final request = CreateProcurementIssueRequestDto(
          title: title,
          deliveryDate: deliveryDate,
          paymentTerms: (paymentTerms?.isEmpty ?? true) ? null : paymentTerms,
          hasFee: hasFee,
          note: (note?.isEmpty ?? true) ? null : note,
          supplierId: supplierId,
          items: supplierItems
              .map(
                (e) => CreateProcurementIssueItemDto(
                  item: e.item,
                  spec: e.spec,
                  quantity: e.quantity,
                  unitPrice: e.unitPrice,
                  totalAmount: e.totalAmount,
                  isOnlinePurchase: e.isOnlinePurchase,
                  purchaseUrl: e.purchaseUrl,
                  supplierId: e.supplier?.id,
                ),
              )
              .toList(),
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createProcurementIssueRequest(id: issueId, request: request);
        ref
            .read(issueListControllerProvider(projectId: projectId).notifier)
            .updateListItem(issue);
      }

      if (issue == null) {
        throw Exception('No procurement request to submit');
      }

      ref
          .read(issueListControllerProvider(projectId: projectId).notifier)
          .updateListItem(issue);

      state = IssueSubmitState.created(issue);
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }

  Future<void> createIssue({
    required int projectId,
    required int categoryId,
  }) async {
    final value = ref
        .read(
          issueFormControllerProvider(
            projectId: projectId,
            categoryId: categoryId,
          ),
        )
        .value;

    if (value == null) return;

    state = const IssueSubmitState.pending();

    try {
      late Issue issue;

      if (value.category is IssueContract) {
        final contractItems = value.contractItems
            .map(
              (e) => CreateContractIssueItemDto(item: e.item, price: e.price),
            )
            .toList();

        final transactionItems = value.transactionItems
            .map(
              (e) => CreateTransactionIssueItemDto(
                categoryId: e.category!.id,
                price: e.price,
                ratio: e.ratio,
                isPaid: false,
              ),
            )
            .toList();

        final request = CreateContractIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          currencyId: value.currency!.id,
          contractItems: contractItems,
          transactionItems: transactionItems,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createContractIssue(request: request);
      } else if (value.category is IssueKickoff) {
        final request = CreateKickoffIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          kickoffDate: value.kickoffDate!,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createKickoffIssue(request: request);
      } else if (value.category is IssueTransaction) {
        final items = value.transactionItems
            .map(
              (e) => UpdateTransactionIssueItemDto(
                id: e.id,
                categoryId: e.category!.id,
                price: e.price,
                ratio: e.ratio,
                note: e.note,
                isPaid: e.isPaid,
                paidAt: e.paidAt,
              ),
            )
            .toList();

        final request = CreateTransactionIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          transactionItems: items,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createTransactionIssue(request: request);
      } else if (value.category is IssueApproval) {
        final request = CreateApprovalIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createApprovalIssue(request: request);
      } else if (value.category is IssueProcurement) {
        final items = value.procurementItems
            .map(
              (e) => CreateProcurementIssueItemDto(
                item: e.item,
                spec: e.spec,
                quantity: e.quantity,
                unitPrice: e.unitPrice,
                totalAmount: e.totalAmount,
                isOnlinePurchase: e.isOnlinePurchase,
                purchaseUrl: e.purchaseUrl,
                supplierId: e.supplier?.id,
                note: e.note,
              ),
            )
            .toList();

        final request = CreateProcurementIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          procurementItems: items,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createProcurementIssue(request: request);
      } else if (value.category is IssuePayment) {
        final request = CreatePaymentIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createPaymentIssue(request: request);
      } else {
        throw Exception('Unknown issue category');
      }

      if (!ref.mounted) return;

      if (value.files != null && value.files!.isNotEmpty) {
        List<MultipartFile> files = [];
        for (final file in value.files!) {
          final bytes = await file.readAsBytes();
          final mimeType =
              lookupMimeType('', headerBytes: bytes) ?? 'image/jpeg';
          files.add(
            MultipartFile.fromBytes(
              bytes,
              filename: file.name,
              contentType: MediaType.parse(mimeType),
            ),
          );
        }

        final newAttachments = await ref
            .read(issueRepositoryProvider)
            .uploadAttachments(issueId: issue.id, files: files);

        issue = issue.copyWith(
          attachments: [...issue.attachments, ...newAttachments],
        );
      }

      final project = await ref
          .read(projectRepositoryProvider)
          .getProject(id: projectId);
      ref
          .read(projectListControllerProvider.notifier)
          .updateListItem(item: project);
      ref
          .read(projectDetailControllerProvider(projectId: projectId).notifier)
          .updateProject(project: project);
      ref
          .read(projectListControllerProvider.notifier)
          .updateListItem(item: project);
      ref
          .read(issueListControllerProvider(projectId: projectId).notifier)
          .addListItem(item: issue);

      state = IssueSubmitState.created(issue);
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }

  Future<void> updateIssue({
    required int projectId,
    required int categoryId,
    required int issueId,
  }) async {
    final value = ref
        .read(
          issueFormControllerProvider(
            projectId: projectId,
            categoryId: categoryId,
            issueId: issueId,
          ),
        )
        .value;

    if (value == null) return;

    state = const IssueSubmitState.pending();

    try {
      late Issue issue;

      if (value.category is IssueContract) {
        final contractItems = value.contractItems
            .map(
              (e) => UpdateContractIssueItemDto(
                id: e.id,
                item: e.item,
                price: e.price,
              ),
            )
            .toList();

        final transactionItems = value.transactionItems
            .map(
              (e) => UpdateTransactionIssueItemDto(
                id: e.id,
                categoryId: e.category!.id,
                price: e.price,
                ratio: e.ratio,
                note: e.note,
                isPaid: e.isPaid,
                paidAt: e.paidAt,
              ),
            )
            .toList();

        final request = UpdateContractIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          currencyId: value.currency!.id,
          contractItems: contractItems,
          transactionItems: transactionItems,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateContractIssue(id: issueId, request: request);
      } else if (value.category is IssueKickoff) {
        final request = UpdateKickoffIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          kickoffDate: value.kickoffDate!,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateKickoffIssue(id: issueId, request: request);
      } else if (value.category is IssueApproval) {
        final request = UpdateApprovalIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateApprovalIssue(id: issueId, request: request);
      } else if (value.category is IssueProcurement) {
        final items = value.procurementItems
            .map(
              (e) => UpdateProcurementIssueItemDto(
                id: e.id,
                item: e.item,
                spec: e.spec,
                quantity: e.quantity,
                unitPrice: e.unitPrice,
                totalAmount: e.totalAmount,
                isOnlinePurchase: e.isOnlinePurchase,
                purchaseUrl: e.purchaseUrl,
                supplierId: e.supplier?.id,
                note: e.note,
              ),
            )
            .toList();

        final request = UpdateProcurementIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          procurementItems: items,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateProcurementIssue(id: issueId, request: request);
      } else if (value.category is IssueTransaction) {
        final items = value.transactionItems
            .map(
              (e) => UpdateTransactionIssueItemDto(
                id: e.id,
                categoryId: e.category!.id,
                price: e.price,
                ratio: e.ratio,
                note: e.note,
                isPaid: e.isPaid,
                paidAt: e.paidAt,
              ),
            )
            .toList();

        final request = UpdateTransactionIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          transactionItems: items,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateTransactionIssue(id: issueId, request: request);
      } else if (value.category is IssuePayment) {
        final request = UpdatePaymentIssueDto(
          projectId: projectId,
          categoryId: categoryId,
          content: value.content!,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updatePaymentIssue(id: issueId, request: request);
      } else {
        throw Exception('Unknown issue category');
      }

      if (value.files != null && value.files!.isNotEmpty) {
        List<MultipartFile> files = [];
        for (final file in value.files!) {
          final bytes = await file.readAsBytes();
          final mimeType =
              lookupMimeType('', headerBytes: bytes) ?? 'image/jpeg';
          files.add(
            MultipartFile.fromBytes(
              bytes,
              filename: file.name,
              contentType: MediaType.parse(mimeType),
            ),
          );
        }

        final newAttachments = await ref
            .read(issueRepositoryProvider)
            .uploadAttachments(issueId: issue.id, files: files);

        issue = issue.copyWith(
          attachments: [...issue.attachments, ...newAttachments],
        );
      }

      final project = await ref
          .read(projectRepositoryProvider)
          .getProject(id: projectId);
      ref
          .read(projectListControllerProvider.notifier)
          .updateListItem(item: project);
      ref
          .read(projectDetailControllerProvider(projectId: projectId).notifier)
          .updateProject(project: project);
      ref
          .read(issueListControllerProvider(projectId: projectId).notifier)
          .updateListItem(issue);

      state = IssueSubmitState.edited(issue);
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }

  Future<void> deleteIssue({
    required int projectId,
    required int issueId,
  }) async {
    state = const IssueSubmitState.pending();

    try {
      final issue = await ref
          .read(issueRepositoryProvider)
          .deleteIssue(id: issueId);
      ref
          .read(issueListControllerProvider(projectId: projectId).notifier)
          .removeListItem(item: issue);

      state = IssueSubmitState.deleted();
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }

  Future<void> sendEmail({
    required int issueId,
    required List<User> users,
    required bool isAllSelected,
  }) async {
    state = const IssueSubmitState.pending();

    final request = SendIssueMailDto(
      userIds: isAllSelected
          ? null
          : users.map((element) => element.id).toList(),
    );

    try {
      await ref
          .read(issueRepositoryProvider)
          .sendMail(id: issueId, request: request);

      state = IssueSubmitState.mailed();
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }
}
