part of '../controller.dart';

@riverpod
class IssueSubmitController extends _$IssueSubmitController {
  @override
  IssueSubmitState build() => IssueSubmitState.idle();

  Future<void> createIssue({
    required int projectId,
  }) async {
    final value =
        ref.read(issueFormControllerProvider(projectId: projectId)).valueOrNull;

    if (value == null) return;

    state = const IssueSubmitState.pending();

    try {
      late Issue issue;

      List<MultipartFile> files = [];

      if (value.files != null) {
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
      }

      if (value.category is IssueContract) {
        final contractItems = value.contractItems
            .map((e) => CreateContractItemRequest(item: e.item, price: e.price))
            .toList();

        final transactionItems = value.transactionItems
            .map((e) => CreateTransactionItemRequest(
                  categoryId: e.category!.id,
                  price: e.price,
                  ratio: e.ratio,
                  isPaid: false,
                ))
            .toList();

        final request = CreateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
          currencyId: value.currency?.id,
          contractItems: contractItems,
          transactionItems: transactionItems,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createIssue(request: request);
      } else if (value.category is IssueKickoff) {
        final request = CreateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
          kickoffDate: value.kickoffDate,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createIssue(request: request);
      } else if (value.category is IssueDeclaration) {
        final request = CreateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createIssue(request: request);
      } else if (value.category is IssueProcurement) {
        final items = value.procurementItems
            .map(
              (e) => CreateProcurementItemRequest(
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
            .toList();

        final request = CreateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
          procurementItems: items,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createIssue(request: request);
      } else if (value.category is IssueTransaction) {
        final items = value.transactionItems
            .map((e) => CreateTransactionItemRequest(
                  categoryId: e.category!.id,
                  price: e.price,
                  ratio: e.ratio,
                  note: e.note,
                  isPaid: e.isPaid,
                  paidAt: e.paidAt,
                ))
            .toList();

        final request = CreateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
          currencyId: value.currency?.id,
          transactionItems: items,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createIssue(request: request);
      } else if (value.category is IssuePayment) {
        final request = CreateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createIssue(request: request);
      } else {
        throw Exception('Unknown issue category');
      }

      if (files.isNotEmpty) {
        final newAttachments = await ref
            .read(issueRepositoryProvider)
            .uploadAttachments(issueId: issue.id, files: files);

        issue = issue
            .copyWith(attachments: [...issue.attachments, ...newAttachments]);
      }

      final project =
          await ref.read(projectRepositoryProvider).getProject(id: projectId);
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

      state = IssueSubmitState.success(issue);
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }

  Future<void> updateIssue(
      {required int projectId, required int issueId}) async {
    final value = ref
        .read(
            issueFormControllerProvider(projectId: projectId, issueId: issueId))
        .valueOrNull;

    if (value == null) return;

    state = const IssueSubmitState.pending();

    try {
      late Issue issue;

      List<MultipartFile> files = [];

      if (value.files != null) {
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
      }

      if (value.category is IssueContract) {
        final contractItems = value.contractItems
            .map((e) => UpdateContractItemRequest(
                id: e.id, item: e.item, price: e.price))
            .toList();

        final transactionItems = value.transactionItems
            .map((e) => UpdateTransactionItemRequest(
                  id: e.id,
                  categoryId: e.category!.id,
                  price: e.price,
                  ratio: e.ratio,
                  note: e.note,
                  isPaid: e.isPaid,
                  paidAt: e.paidAt,
                ))
            .toList();

        final request = UpdateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
          currencyId: value.currency?.id,
          contractItems: contractItems.isEmpty ? null : contractItems,
          transactionItems: transactionItems.isEmpty ? null : transactionItems,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateIssue(id: issueId, request: request);
      } else if (value.category is IssueKickoff) {
        final request = UpdateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
          kickoffDate: value.kickoffDate,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateIssue(id: issueId, request: request);
      } else if (value.category is IssueDeclaration) {
        final request = UpdateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateIssue(id: issueId, request: request);
      } else if (value.category is IssueProcurement) {
        final items = value.procurementItems
            .map(
              (e) => UpdateProcurementItemRequest(
                id: e.id,
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
            .toList();

        final request = UpdateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
          procurementItems: items,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateIssue(id: issueId, request: request);
      } else if (value.category is IssueTransaction) {
        final items = value.transactionItems
            .map((e) => UpdateTransactionItemRequest(
                  id: e.id,
                  categoryId: e.category!.id,
                  price: e.price,
                  ratio: e.ratio,
                  note: e.note,
                  isPaid: e.isPaid,
                  paidAt: e.paidAt,
                ))
            .toList();

        final request = UpdateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
          currencyId: value.currency?.id,
          transactionItems: items,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateIssue(id: issueId, request: request);
      } else if (value.category is IssuePayment) {
        final request = UpdateIssueRequest(
          projectId: projectId,
          categoryId: value.category!.id,
          content: value.content,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateIssue(id: issueId, request: request);
      } else {
        throw Exception('Unknown issue category');
      }

      if (files.isNotEmpty) {
        final newAttachments = await ref
            .read(issueRepositoryProvider)
            .uploadAttachments(issueId: issue.id, files: files);

        issue = issue
            .copyWith(attachments: [...issue.attachments, ...newAttachments]);
      }

      final project =
          await ref.read(projectRepositoryProvider).getProject(id: projectId);
      ref
          .read(projectListControllerProvider.notifier)
          .updateListItem(item: project);
      ref
          .read(projectDetailControllerProvider(projectId: projectId).notifier)
          .updateProject(project: project);
      ref
          .read(issueListControllerProvider(projectId: projectId).notifier)
          .updateListItem(issue);

      state = IssueSubmitState.success(issue);
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
      final issue =
          await ref.read(issueRepositoryProvider).deleteIssue(id: issueId);
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
  }) async {
    state = const IssueSubmitState.pending();

    try {
      await ref.read(issueRepositoryProvider).sendMail(id: issueId);

      state = IssueSubmitState.mailed();
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }
}
