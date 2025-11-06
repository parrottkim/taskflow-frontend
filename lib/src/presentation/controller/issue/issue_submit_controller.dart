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
          .read(issueListControllerProvider(projectId: projectId).notifier)
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

      final attachments = value.attachments!
          .map((e) => UpdateIssueAttachmentRequest(
              id: e.id, filename: e.filename, size: e.size, url: e.path))
          .toList();

      UpdateIssueRequest request = UpdateIssueRequest(
        projectId: projectId,
        categoryId: categoryId,
        content: value.content!,
        attachments: attachments,
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
          .read(issueListControllerProvider(projectId: projectId).notifier)
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
          .read(issueListControllerProvider(projectId: projectId).notifier)
          .removeListItem(id: issueId);

      state = IssueSubmitState.deleted();
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }

  Future<void> sendEmail({
    required int projectId,
    required int issueId,
  }) async {
    final issue = await ref.read(issueRepositoryProvider).getIssue(id: issueId);
    final project =
        await ref.read(projectRepositoryProvider).getProject(id: projectId);
    final users = await ref.read(userRepositoryProvider).getAllUsers();

    final uri = Uri(
      scheme: Uri.base.scheme,
      host: Uri.base.host,
      port: Uri.base.hasPort ? Uri.base.port : null,
      path: join(Routes.project, projectId.toString()),
      queryParameters: {
        'view': 'issue',
        'issue': issueId.toString(),
      },
    );

    final to = users
        .map((e) => '${e.username} ${e.position?.name ?? '직급 없음'} <${e.email}>')
        .join(',');

    final subject =
        '[${issue.category.name}][${project.clients.first.name}][${project.clients.last.name}] ${project.code}, ${project.name}';

    final body =
        '[담당 PM] ${project.manager?.username ?? '미지정'} ${project.manager != null ? '(${project.manager!.email})' : ''}\n'
        '[URL] $uri\n\n'
        '[업무 내용]\n'
        '${issue.content}';

    final queryParameters = {'subject': subject, 'body': body}
        .entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');

    final mailto = Uri(scheme: 'mailto', path: to, query: queryParameters);

    await launchUrl(mailto);
  }
}
