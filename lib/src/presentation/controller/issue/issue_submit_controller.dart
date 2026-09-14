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
    final form = ref
        .read(
          issueFormControllerProvider(
            projectId: projectId,
            categoryId: categoryId,
          ),
        )
        .requireValue;
    final initialContent = form.content ?? '';

    state = const IssueSubmitState.pending();

    try {
      late Issue issue;

      if (form.category is IssueContract) {
        final request = CreateContractIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          currencyId: form.currency!.id,
          contractItems: form.contractItems
              .map(
                (item) => CreateContractIssueItemRequest(
                  item: item.item,
                  price: item.price,
                ),
              )
              .toList(),
          transactionItems: form.transactionItems
              .map(
                (item) => CreateTransactionIssueItemRequest(
                  categoryId: item.category!.id,
                  price: item.price,
                  ratio: item.ratio,
                  isPaid: false,
                ),
              )
              .toList(),
          attachments: form.attachments,
        );

        issue = await ref
            .read(contractIssueRepositoryProvider)
            .createContractIssue(request: request);
      } else if (form.category is IssueKickoff) {
        final request = CreateKickoffIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          kickoffDate: form.kickoffDate!,
          attachments: form.attachments,
        );

        issue = await ref
            .read(kickoffIssueRepositoryProvider)
            .createKickoffIssue(request: request);
      } else if (form.category is IssueTransaction) {
        final request = CreateTransactionIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          transactionItems: form.transactionItems
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
          attachments: form.attachments,
        );

        issue = await ref
            .read(transactionIssueRepositoryProvider)
            .createTransactionIssue(request: request);
      } else if (form.category is IssueApproval) {
        final request = CreateApprovalIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          attachments: form.attachments,
        );

        issue = await ref
            .read(approvalIssueRepositoryProvider)
            .createApprovalIssue(request: request);
      } else if (form.category is IssueProcurement) {
        final request = CreateProcurementIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          procurementItems: form.procurementItems
              .map(
                (item) => CreateProcurementIssueItemRequest(
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
          attachments: form.attachments,
        );

        issue = await ref
            .read(procurementIssueRepositoryProvider)
            .createProcurementIssue(request: request);
      } else if (form.category is IssuePayment) {
        final request = CreatePaymentIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: initialContent,
          attachments: form.attachments,
        );

        issue = await ref
            .read(paymentIssueRepositoryProvider)
            .createPaymentIssue(request: request);
      } else {
        throw UnsupportedError('Unknown issue category: ${form.category}');
      }

      if (!ref.mounted) return;

      final content = await _uploadInlineImages(
        editorState: editorState,
        resourceId: issue.id,
      );
      if (content != initialContent) {
        issue = await _updateCreatedIssue(
          form: form,
          issue: issue,
          projectId: projectId,
          categoryId: categoryId,
          content: content,
        );
      }

      if (form.files.isNotEmpty) {
        final files = <MultipartFile>[];
        for (final file in form.files) {
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
            .read(issueAttachmentRepositoryProvider)
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
    final form = ref
        .read(
          issueFormControllerProvider(
            projectId: projectId,
            categoryId: categoryId,
            issueId: issueId,
          ),
        )
        .requireValue;

    state = const IssueSubmitState.pending();

    try {
      late Issue issue;
      final content = await _uploadInlineImages(
        editorState: editorState,
        resourceId: issueId,
      );

      if (form.category is IssueContract) {
        final request = UpdateContractIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          currencyId: form.currency!.id,
          contractItems: form.contractItems
              .map(
                (item) => UpdateContractIssueItemRequest(
                  id: item.id,
                  item: item.item,
                  price: item.price,
                ),
              )
              .toList(),
          transactionItems: form.transactionItems
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
          attachments: form.attachments,
        );

        issue = await ref
            .read(contractIssueRepositoryProvider)
            .updateContractIssue(id: issueId, request: request);
      } else if (form.category is IssueKickoff) {
        final request = UpdateKickoffIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          kickoffDate: form.kickoffDate!,
          attachments: form.attachments,
        );

        issue = await ref
            .read(kickoffIssueRepositoryProvider)
            .updateKickoffIssue(id: issueId, request: request);
      } else if (form.category is IssueApproval) {
        final request = UpdateApprovalIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          attachments: form.attachments,
        );

        issue = await ref
            .read(approvalIssueRepositoryProvider)
            .updateApprovalIssue(id: issueId, request: request);
      } else if (form.category is IssueProcurement) {
        final request = UpdateProcurementIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          procurementItems: form.procurementItems
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
          attachments: form.attachments,
        );

        issue = await ref
            .read(procurementIssueRepositoryProvider)
            .updateProcurementIssue(id: issueId, request: request);
      } else if (form.category is IssueTransaction) {
        final request = UpdateTransactionIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          transactionItems: form.transactionItems
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
          attachments: form.attachments,
        );

        issue = await ref
            .read(transactionIssueRepositoryProvider)
            .updateTransactionIssue(id: issueId, request: request);
      } else if (form.category is IssuePayment) {
        final request = UpdatePaymentIssueRequest(
          projectId: projectId,
          categoryId: categoryId,
          content: content,
          attachments: form.attachments,
        );

        issue = await ref
            .read(paymentIssueRepositoryProvider)
            .updatePaymentIssue(id: issueId, request: request);
      } else {
        throw UnsupportedError('Unknown issue category: ${form.category}');
      }

      if (form.files.isNotEmpty) {
        final files = <MultipartFile>[];
        for (final file in form.files) {
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
            .read(issueAttachmentRepositoryProvider)
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
    required IssueFormState form,
    required Issue issue,
    required int projectId,
    required int categoryId,
    required String content,
  }) {
    if (form.category is IssueContract) {
      final request = UpdateContractIssueRequest(
        projectId: projectId,
        categoryId: categoryId,
        content: content,
        currencyId: form.currency!.id,
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
      );

      return ref
          .read(contractIssueRepositoryProvider)
          .updateContractIssue(id: issue.id, request: request);
    }
    if (form.category is IssueKickoff) {
      final request = UpdateKickoffIssueRequest(
        projectId: projectId,
        categoryId: categoryId,
        content: content,
        kickoffDate: form.kickoffDate!,
        attachments: issue.attachments,
      );

      return ref
          .read(kickoffIssueRepositoryProvider)
          .updateKickoffIssue(id: issue.id, request: request);
    }
    if (form.category is IssueApproval) {
      final request = UpdateApprovalIssueRequest(
        projectId: projectId,
        categoryId: categoryId,
        content: content,
        attachments: issue.attachments,
      );

      return ref
          .read(approvalIssueRepositoryProvider)
          .updateApprovalIssue(id: issue.id, request: request);
    }
    if (form.category is IssueProcurement) {
      final request = UpdateProcurementIssueRequest(
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
      );

      return ref
          .read(procurementIssueRepositoryProvider)
          .updateProcurementIssue(id: issue.id, request: request);
    }
    if (form.category is IssueTransaction) {
      final request = UpdateTransactionIssueRequest(
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
      );

      return ref
          .read(transactionIssueRepositoryProvider)
          .updateTransactionIssue(id: issue.id, request: request);
    }
    if (form.category is IssuePayment) {
      final request = UpdatePaymentIssueRequest(
        projectId: projectId,
        categoryId: categoryId,
        content: content,
        attachments: issue.attachments,
      );

      return ref
          .read(paymentIssueRepositoryProvider)
          .updatePaymentIssue(id: issue.id, request: request);
    }

    throw UnsupportedError('Unknown issue category: ${form.category}');
  }

  Future<String> _uploadInlineImages({
    required appflowy.EditorState editorState,
    required int resourceId,
  }) async {
    final document = editorState.document;
    final filesByNode = <appflowy.Node, MultipartFile>{};

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
            filesByNode[node] = MultipartFile.fromBytes(
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

    if (filesByNode.isNotEmpty) {
      final uploadResults = await ref
          .read(sftpRepositoryProvider)
          .uploadInlineImage(
            path: 'report',
            resourceId: resourceId,
            files: filesByNode.values.toList(),
          );
      final nodes = filesByNode.keys.toList();

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
        .requireValue;

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
            .read(procurementIssueRepositoryProvider)
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
        .requireValue;

    if (value.selectedSupplierIds.isEmpty) return;

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
          .read(procurementIssueRepositoryProvider)
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
          .read(procurementIssueRepositoryProvider)
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
