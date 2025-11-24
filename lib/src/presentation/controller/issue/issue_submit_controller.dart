part of '../controller.dart';

@riverpod
class IssueSubmitController extends _$IssueSubmitController {
  @override
  IssueSubmitState build() => IssueSubmitState.idle();

  Future<void> createIssue({
    required int categoryId,
    required int projectId,
  }) async {
    final value = ref
        .read(issueFormControllerProvider(
            categoryId: categoryId, projectId: projectId))
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

      CreateIssueRequest request = CreateIssueRequest(
        projectId: projectId,
        categoryId: categoryId,
        content: value.content!,
      );

      if (value is IssueFormContract) {
        final items = value.items!
            .map((e) => CreateContractItemRequest(
                item: e.item, currencyId: e.currency!.id, price: e.price))
            .toList();

        request = request.copyWith(
          contract: CreateContractDetailsRequest(items: items),
        );
      }
      if (value is IssueFormKickoff) {
        request = request.copyWith(
          kickoff: CreateKickoffDetailsRequest(kickoffDate: value.kickoffDate!),
        );
      }
      if (value is IssueFormApproval) {}
      if (value is IssueFormProcurement) {
        final items = value.items!
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

        request = request.copyWith(
            procurement: CreateProcurementDetailsRequest(items: items));
      }
      if (value is IssueFormTransaction) {
        final items = value.items!
            .map((e) => CreateTransactionItemRequest(
                  categoryId: e.category!.id,
                  currencyId: e.currency!.id,
                  price: e.price,
                  note: e.note,
                ))
            .toList();

        request = request.copyWith(
            transaction: CreateTransactionDetailsRequest(items: items));
      }

      issue =
          await ref.read(issueRepositoryProvider).createIssue(request: request);

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
          .updateProject(project);
      ref
          .read(projectListControllerProvider.notifier)
          .updateListItem(item: project);
      ref
          .read(IssueListControllerProvider(projectId: projectId).notifier)
          .addListItem(item: issue);

      state = IssueSubmitState.success(issue);
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }

  Future<void> updateIssue(
      {required int categoryId,
      required int projectId,
      required int issueId}) async {
    final value = ref
        .read(issueFormControllerProvider(
            categoryId: categoryId, projectId: projectId, issueId: issueId))
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

      UpdateIssueRequest request = UpdateIssueRequest(
        projectId: projectId,
        categoryId: categoryId,
        content: value.content!,
        attachments: value.attachments ?? [],
      );

      if (value is IssueFormContract) {
        final items = value.items!
            .map((e) => UpdateContractItemRequest(
                id: e.id,
                item: e.item,
                currencyId: e.currency!.id,
                price: e.price))
            .toList();

        request = request.copyWith(
          contract: UpdateContractDetailsRequest(items: items),
        );
      }
      if (value is IssueFormKickoff) {
        request = request.copyWith(
            kickoff: UpdateKickoffDetailsRequest(
                id: value.kickoffId!, kickoffDate: value.kickoffDate!));
      }
      if (value is IssueFormApproval) {}
      if (value is IssueFormProcurement) {
        final items = value.items!
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

        request = request.copyWith(
            procurement: UpdateProcurementDetailsRequest(items: items));
      }
      if (value is IssueFormTransaction) {
        final items = value.items!
            .map((e) => UpdateTransactionItemRequest(
                  categoryId: e.category!.id,
                  currencyId: e.currency!.id,
                  price: e.price,
                  note: e.note,
                ))
            .toList();

        request = request.copyWith(
            transaction: UpdateTransactionDetailsRequest(items: items));
      }

      issue = await ref
          .read(issueRepositoryProvider)
          .updateIssue(id: issueId, request: request);

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
          .updateProject(project);
      ref
          .read(IssueListControllerProvider(projectId: projectId).notifier)
          .updateListItem(issue);

      state = IssueSubmitState.success(issue);
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }

  Future<void> deleteIssue(
      {required int projectId, required int issueId}) async {
    state = const IssueSubmitState.pending();

    try {
      await ref.read(issueRepositoryProvider).deleteIssue(id: issueId);
      ref
          .read(IssueListControllerProvider(projectId: projectId).notifier)
          .removeListItem(id: issueId);

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
