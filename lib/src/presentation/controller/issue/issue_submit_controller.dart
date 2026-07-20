part of '../controller.dart';

@riverpod
class IssueSubmitController extends _$IssueSubmitController {
  @override
  IssueSubmitState build() => IssueSubmitState.idle();

  Future<void> createIssue({
    required int projectId,
    required int categoryId,
    required appflowy.EditorState editorState,
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
      final initialContent = appflowy.documentToMarkdown(editorState.document);

      if (value.category is IssueContract) {
        final contractItems = value.contractItems
            .map(
              (e) =>
                  CreateContractIssueItemRequest(item: e.item, price: e.price),
            )
            .toList();

        final transactionItems = value.transactionItems
            .map(
              (e) => CreateTransactionIssueItemRequest(
                categoryId: e.category!.id,
                price: e.price,
                ratio: e.ratio,
                isPaid: false,
              ),
            )
            .toList();

        final request = CreateContractIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          currencyId: value.currency!.id,
          contractItems: contractItems,
          transactionItems: transactionItems,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createContractIssue(request: request);
      } else if (value.category is IssueKickoff) {
        final request = CreateKickoffIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          kickoffDate: value.kickoffDate!,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createKickoffIssue(request: request);
      } else if (value.category is IssueTransaction) {
        final items = value.transactionItems
            .map(
              (e) => UpdateTransactionIssueItemRequest(
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

        final request = CreateTransactionIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          transactionItems: items,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createTransactionIssue(request: request);
      } else if (value.category is IssueApproval) {
        final request = CreateApprovalIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createApprovalIssue(request: request);
      } else if (value.category is IssueProcurement) {
        final items = value.procurementItems
            .map(
              (e) => CreateProcurementIssueItemRequest(
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

        final request = CreateProcurementIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          procurementItems: items,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createProcurementIssue(request: request);
      } else if (value.category is IssuePayment) {
        final request = CreatePaymentIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createPaymentIssue(request: request);
      } else {
        throw Exception('Unknown issue category');
      }

      if (!ref.mounted) return;

      final content = await _uploadInlineImages(
        editorState: editorState,
        resourceId: issue.id,
      );
      if (content != initialContent) {
        issue = await _updateCreatedIssue(
          value: value,
          issue: issue,
          projectId: projectId,
          categoryId: categoryId,
          content: content,
        );
      }

      if (value.files != null && value.files!.isNotEmpty) {
        List<MultipartFile> files = [];
        for (final file in value.files!) {
          final bytes = await file.readAsBytes();
          final mimeType =
              lookupMimeType('', headerBytes: bytes) ??
              'application/octet-stream';
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
          .read(
            projectListControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          .updateListItem(item: ProjectListItem.fromProject(project));
      ref
          .read(projectDetailControllerProvider(projectId: projectId).notifier)
          .updateProject(project: project);
      ref
          .read(
            projectListControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          .updateListItem(item: ProjectListItem.fromProject(project));
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
    required appflowy.EditorState editorState,
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
      final content = await _uploadInlineImages(
        editorState: editorState,
        resourceId: issueId,
      );

      if (value.category is IssueContract) {
        final contractItems = value.contractItems
            .map(
              (e) => UpdateContractIssueItemRequest(
                id: e.id,
                item: e.item,
                price: e.price,
              ),
            )
            .toList();

        final transactionItems = value.transactionItems
            .map(
              (e) => UpdateTransactionIssueItemRequest(
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

        final request = UpdateContractIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          currencyId: value.currency!.id,
          contractItems: contractItems,
          transactionItems: transactionItems,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateContractIssue(id: issueId, request: request);
      } else if (value.category is IssueKickoff) {
        final request = UpdateKickoffIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          kickoffDate: value.kickoffDate!,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateKickoffIssue(id: issueId, request: request);
      } else if (value.category is IssueApproval) {
        final request = UpdateApprovalIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateApprovalIssue(id: issueId, request: request);
      } else if (value.category is IssueProcurement) {
        final items = value.procurementItems
            .map(
              (e) => UpdateProcurementIssueItemRequest(
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

        final request = UpdateProcurementIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          procurementItems: items,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateProcurementIssue(id: issueId, request: request);
      } else if (value.category is IssueTransaction) {
        final items = value.transactionItems
            .map(
              (e) => UpdateTransactionIssueItemRequest(
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

        final request = UpdateTransactionIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          transactionItems: items,
          attachments: value.attachments ?? [],
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .updateTransactionIssue(id: issueId, request: request);
      } else if (value.category is IssuePayment) {
        final request = UpdatePaymentIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
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
              lookupMimeType('', headerBytes: bytes) ??
              'application/octet-stream';
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
          .read(
            projectListControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          .updateListItem(item: ProjectListItem.fromProject(project));
      ref
          .read(projectDetailControllerProvider(projectId: projectId).notifier)
          .updateProject(project: project);
      ref
          .read(issueListControllerProvider(projectId: projectId).notifier)
          .updateListItem(issue);

      state = IssueSubmitState.updated(issue);
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }

  Future<Issue> _updateCreatedIssue({
    required IssueFormState value,
    required Issue issue,
    required int projectId,
    required int categoryId,
    required String content,
  }) {
    final repository = ref.read(issueRepositoryProvider);

    if (value.category is IssueContract) {
      return repository.updateContractIssue(
        id: issue.id,
        request: UpdateContractIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          currencyId: value.currency!.id,
          contractItems: issue.contractItems
              .map(
                (item) => UpdateContractIssueItemRequest(
                  id: item.id,
                  item: item.item,
                  price: item.price,
                ),
              )
              .toList(),
          transactionItems: issue.transactionItems
              .map(
                (item) => UpdateTransactionIssueItemRequest(
                  id: item.id,
                  categoryId: item.category!.id,
                  price: item.price,
                  ratio: item.ratio,
                  note: item.note,
                  isPaid: item.isPaid,
                  paidAt: item.paidAt,
                ),
              )
              .toList(),
          attachments: issue.attachments,
        ),
      );
    }
    if (value.category is IssueKickoff) {
      return repository.updateKickoffIssue(
        id: issue.id,
        request: UpdateKickoffIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          kickoffDate: value.kickoffDate!,
          attachments: issue.attachments,
        ),
      );
    }
    if (value.category is IssueApproval) {
      return repository.updateApprovalIssue(
        id: issue.id,
        request: UpdateApprovalIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          attachments: issue.attachments,
        ),
      );
    }
    if (value.category is IssueProcurement) {
      return repository.updateProcurementIssue(
        id: issue.id,
        request: UpdateProcurementIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          procurementItems: issue.procurementItems
              .map(
                (item) => UpdateProcurementIssueItemRequest(
                  id: item.id,
                  item: item.item,
                  spec: item.spec,
                  quantity: item.quantity,
                  unitPrice: item.unitPrice,
                  totalAmount: item.totalAmount,
                  isOnlinePurchase: item.isOnlinePurchase,
                  purchaseUrl: item.purchaseUrl,
                  supplierId: item.supplier?.id,
                  note: item.note,
                ),
              )
              .toList(),
          attachments: issue.attachments,
        ),
      );
    }
    if (value.category is IssueTransaction) {
      return repository.updateTransactionIssue(
        id: issue.id,
        request: UpdateTransactionIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          transactionItems: issue.transactionItems
              .map(
                (item) => UpdateTransactionIssueItemRequest(
                  id: item.id,
                  categoryId: item.category!.id,
                  price: item.price,
                  ratio: item.ratio,
                  note: item.note,
                  isPaid: item.isPaid,
                  paidAt: item.paidAt,
                ),
              )
              .toList(),
          attachments: issue.attachments,
        ),
      );
    }
    if (value.category is IssuePayment) {
      return repository.updatePaymentIssue(
        id: issue.id,
        request: UpdatePaymentIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          attachments: issue.attachments,
        ),
      );
    }

    throw Exception('Unknown issue category');
  }

  Future<String> _uploadInlineImages({
    required appflowy.EditorState editorState,
    required int resourceId,
  }) async {
    final document = editorState.document;
    final map = <appflowy.Node, MultipartFile>{};

    void traverseNodes(appflowy.Node node) {
      if (node.type == appflowy.ImageBlockKeys.type) {
        final imageUrl =
            node.attributes[appflowy.ImageBlockKeys.url] as String?;
        if (imageUrl != null &&
            (imageUrl.startsWith('data:') ||
                !(Uri.tryParse(imageUrl)?.hasScheme ?? false))) {
          try {
            final bytes = base64Decode(imageUrl.split(',').last);
            final mimeType =
                lookupMimeType('', headerBytes: bytes) ??
                'application/octet-stream';
            final extension = extensionFromMime(mimeType) ?? 'jpeg';
            map[node] = MultipartFile.fromBytes(
              bytes,
              filename: '${node.id}.$extension',
              contentType: MediaType.parse(mimeType),
            );
          } catch (error) {
            debugPrint(
              'Image processing failed for node: ${node.id}, error: $error',
            );
          }
        }
      }

      for (final child in node.children) {
        traverseNodes(child);
      }
    }

    for (final node in document.root.children) {
      traverseNodes(node);
    }

    if (map.isNotEmpty) {
      final uploadResults = await ref
          .read(sftpRepositoryProvider)
          .uploadInlineImage(
            path: 'report',
            resourceId: resourceId,
            files: map.values.toList(),
          );
      final nodes = map.keys.toList();

      for (
        var index = 0;
        index < uploadResults.length && index < nodes.length;
        index++
      ) {
        nodes[index].updateAttributes({
          appflowy.ImageBlockKeys.url: uploadResults[index].url,
        });
      }
    }

    return appflowy.documentToMarkdown(document);
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
          .removeListItem(id: issueId, category: issue.category);

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

    final request = SendMailRequest(
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

  Future<void> createProcurementRequests({
    required int projectId,
    required int issueId,
  }) async {
    final value = ref
        .read(procurementIssueFormControllerProvider(issueId: issueId))
        .value;

    if (value == null) return;

    state = const IssueSubmitState.pending();

    try {
      late Issue issue;

      for (final supplierId in value.selectedSupplierIds) {
        final items = value.items
            .where((item) => item.supplier?.id == supplierId)
            .map(
              (item) => CreateProcurementIssueItemRequest(
                item: item.item,
                spec: item.spec,
                quantity: item.quantity,
                unitPrice: item.unitPrice,
                totalAmount: item.totalAmount,
                isOnlinePurchase: item.isOnlinePurchase,
                purchaseUrl: item.purchaseUrl,
                supplierId: supplierId,
                note: item.note,
              ),
            )
            .toList();

        final request = UpsertProcurementRequest(
          title: value.titles[supplierId]!,
          deliveryDate: value.deliveryDates[supplierId],
          paymentTerms: value.paymentTerms[supplierId],
          hasFee: value.hasFees[supplierId] ?? false,
          note: value.notes[supplierId],
          supplierId: supplierId,
          items: items,
        );

        issue = await ref
            .read(issueRepositoryProvider)
            .createProcurementIssueRequest(id: issueId, request: request);
      }

      final project = await ref
          .read(projectRepositoryProvider)
          .getProject(id: projectId);
      ref
          .read(
            projectListControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          .updateListItem(item: ProjectListItem.fromProject(project));
      ref
          .read(projectDetailControllerProvider(projectId: projectId).notifier)
          .updateProject(project: project);
      ref
          .read(issueListControllerProvider(projectId: projectId).notifier)
          .updateListItem(issue);

      state = IssueSubmitState.created(issue);
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }

  Future<void> updateProcurementRequest({
    required int projectId,
    required int issueId,
    required int requestId,
  }) async {
    final value = ref
        .read(
          procurementIssueFormControllerProvider(
            issueId: issueId,
            requestId: requestId,
          ),
        )
        .value;

    if (value == null || value.selectedSupplierIds.isEmpty) return;

    state = const IssueSubmitState.pending();

    try {
      final supplierId = value.selectedSupplierIds.first;
      final items = value.items
          .where((item) => item.supplier?.id == supplierId)
          .map(
            (item) => CreateProcurementIssueItemRequest(
              item: item.item,
              spec: item.spec,
              quantity: item.quantity,
              unitPrice: item.unitPrice,
              totalAmount: item.totalAmount,
              isOnlinePurchase: item.isOnlinePurchase,
              purchaseUrl: item.purchaseUrl,
              supplierId: supplierId,
              note: item.note,
            ),
          )
          .toList();

      final request = UpsertProcurementRequest(
        title: value.titles[supplierId]!,
        deliveryDate: value.deliveryDates[supplierId],
        paymentTerms: value.paymentTerms[supplierId],
        hasFee: value.hasFees[supplierId] ?? false,
        note: value.notes[supplierId],
        supplierId: supplierId,
        items: items,
      );

      final issue = await ref
          .read(issueRepositoryProvider)
          .updateProcurementIssueRequest(id: requestId, request: request);

      final project = await ref
          .read(projectRepositoryProvider)
          .getProject(id: projectId);
      ref
          .read(
            projectListControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          .updateListItem(item: ProjectListItem.fromProject(project));
      ref
          .read(projectDetailControllerProvider(projectId: projectId).notifier)
          .updateProject(project: project);
      ref
          .read(issueListControllerProvider(projectId: projectId).notifier)
          .updateListItem(issue);

      state = IssueSubmitState.updated(issue);
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }

  Future<void> deleteProcurementRequest({
    required int projectId,
    required int requestId,
  }) async {
    state = const IssueSubmitState.pending();

    try {
      await ref
          .read(issueRepositoryProvider)
          .deleteProcurementIssueRequest(id: requestId);
      ref
          .read(issueListControllerProvider(projectId: projectId).notifier)
          .removeProcurementRequest(requestId: requestId);

      state = IssueSubmitState.deleted();
    } catch (e) {
      state = IssueSubmitState.failure(e.toString());
    }
  }
}
