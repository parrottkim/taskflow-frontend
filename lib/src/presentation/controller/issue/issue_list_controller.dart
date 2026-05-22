part of '../controller.dart';

@riverpod
class IssueListController extends _$IssueListController {
  @override
  FutureOr<IssueListState> build({required int projectId}) async {
    return _init();
  }

  Future<IssueListState> _init() async {
    final contract = await ref
        .read(issueRepositoryProvider)
        .getContractIssue(id: projectId);
    final kickoff = await ref
        .read(issueRepositoryProvider)
        .getKickoffIssue(id: projectId);
    final transaction = await ref
        .read(issueRepositoryProvider)
        .getTransactionIssue(id: projectId);
    final payment = await ref
        .read(issueRepositoryProvider)
        .getPaymentIssue(id: projectId);
    final approvals = await ref
        .read(issueRepositoryProvider)
        .getApprovalIssues(page: 1, projectId: projectId);
    final procurements = await ref
        .read(issueRepositoryProvider)
        .getProcurementIssues(page: 1, projectId: projectId);

    final contractItems = await ref
        .read(issueRepositoryProvider)
        .getContractIssueItems(id: projectId);
    final transactionItems = await ref
        .read(issueRepositoryProvider)
        .getTransactionIssueItems(id: projectId);

    return IssueListState(
      contract: contract.data,
      kickoff: kickoff.data,
      transaction: transaction.data,
      payment: payment.data,
      approvals: approvals.items,
      approvalsPage: approvals.page,
      approvalsTotal: approvals.total,
      approvalsHasReachEnd: approvals.items.length >= approvals.total,
      procurements: procurements.items,
      procurementsPage: procurements.page,
      procurementsTotal: procurements.total,
      procurementsHasReachEnd: procurements.items.length >= procurements.total,
      contractItems: contractItems,
      transactionItems: transactionItems,
    );
  }

  Future<void> loadApprovals() async {
    final value = state.value;
    if (value == null) return;
    if (value.approvalsHasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final nextPage = value.approvalsPage + 1;
      final result = await ref
          .read(issueRepositoryProvider)
          .getApprovalIssues(page: nextPage, projectId: projectId);

      return value.copyWith(
        approvals: [...value.approvals, ...result.items],
        approvalsPage: result.page,
        approvalsTotal: result.total,
        approvalsHasReachEnd:
            value.approvals.length + result.items.length >= result.total,
      );
    });
  }

  Future<void> loadProcurements() async {
    final value = state.value;
    if (value == null) return;
    if (value.procurementsHasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final nextPage = value.procurementsPage + 1;
      final result = await ref
          .read(issueRepositoryProvider)
          .getProcurementIssues(page: nextPage, projectId: projectId);

      return value.copyWith(
        procurements: [...value.procurements, ...result.items],
        procurementsPage: result.page,
        procurementsTotal: result.total,
        procurementsHasReachEnd:
            value.procurements.length + result.items.length >= result.total,
      );
    });
  }

  Future<void> approveProcurementRequest({required int requestId}) async {
    final value = state.value;
    if (value == null) return;

    await ref
        .read(issueRepositoryProvider)
        .approveProcurementIssueRequest(id: requestId);

    state = AsyncValue.data(
      value.copyWith(
        procurements: value.procurements.map((procurement) {
          final hasTargetRequest = procurement.requests.any(
            (request) => request.id == requestId,
          );

          if (!hasTargetRequest) {
            return procurement;
          }

          return procurement.copyWith(
            requests: procurement.requests.map((request) {
              if (request.id != requestId) {
                return request;
              }

              return request.copyWith(isApproved: true);
            }).toList(),
          );
        }).toList(),
      ),
    );
  }

  void addListItem({required Issue item}) {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(switch (item.category) {
      IssueApproval() => value.copyWith(
        approvals: [
          ApprovalIssue(
            id: item.id,
            category: item.category,
            user: item.user,
            content: item.content,
            attachments: item.attachments,
            createdAt: item.createdAt,
            updatedAt: item.updatedAt,
          ),
          ...value.approvals,
        ],
      ),
      IssueProcurement() => value.copyWith(
        procurements: [
          ProcurementIssue(
            id: item.id,
            category: item.category,
            user: item.user,
            content: item.content,
            procurementItems: item.procurementItems,
            requests: item.requests,
            attachments: item.attachments,
            createdAt: item.createdAt,
            updatedAt: item.updatedAt,
          ),
          ...value.procurements,
        ],
      ),
      IssueContract() => value.copyWith(
        contract: ContractIssue(
          id: item.id,
          category: item.category,
          user: item.user,
          content: item.content,
          attachments: item.attachments,
          currency: item.currency!,
          createdAt: item.createdAt,
          updatedAt: item.updatedAt,
        ),
        contractItems: item.contractItems,
        transactionItems: item.transactionItems,
      ),
      IssueKickoff() => value.copyWith(
        kickoff: KickoffIssue(
          id: item.id,
          category: item.category,
          user: item.user,
          content: item.content,
          kickoffDate: item.kickoffDate!,
          attachments: item.attachments,
          createdAt: item.createdAt,
          updatedAt: item.updatedAt,
        ),
      ),
      IssueTransaction() => value.copyWith(
        transaction: TransactionIssue(
          id: item.id,
          category: item.category,
          user: item.user,
          content: item.content,
          attachments: item.attachments,
          currency: item.currency!,
          createdAt: item.createdAt,
          updatedAt: item.updatedAt,
        ),
        contractItems: item.contractItems,
        transactionItems: item.transactionItems,
      ),
      IssuePayment() => value.copyWith(
        payment: PaymentIssue(
          id: item.id,
          category: item.category,
          user: item.user,
          content: item.content,
          attachments: item.attachments,
          createdAt: item.createdAt,
          updatedAt: item.updatedAt,
        ),
      ),
      _ => value,
    });

    // 카운트 업데이트
    switch (item.category) {
      case IssueApproval():
        ref
            .read(
              projectDetailControllerProvider(projectId: projectId).notifier,
            )
            .increaseApprovalsCount();
        break;
      case IssueProcurement():
        ref
            .read(
              projectDetailControllerProvider(projectId: projectId).notifier,
            )
            .increaseProcurementsCount();
        break;
      case IssueContract() ||
          IssueKickoff() ||
          IssueTransaction() ||
          IssuePayment():
        ref
            .read(
              projectDetailControllerProvider(projectId: projectId).notifier,
            )
            .increaseContractsCount();
        break;
      default:
        break;
    }
  }

  void updateListItem(Issue issue) async {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(switch (issue.category) {
      IssueContract() => value.copyWith(
        contract: ContractIssue(
          id: issue.id,
          category: issue.category,
          user: issue.user,
          content: issue.content,
          attachments: issue.attachments,
          currency: issue.currency!,
          createdAt: issue.createdAt,
          updatedAt: issue.updatedAt,
        ),
        contractItems: issue.contractItems,
        transactionItems: issue.transactionItems,
      ),
      IssueTransaction() => value.copyWith(
        transaction: TransactionIssue(
          id: issue.id,
          category: issue.category,
          user: issue.user,
          content: issue.content,
          attachments: issue.attachments,
          currency: issue.currency!,
          createdAt: issue.createdAt,
          updatedAt: issue.updatedAt,
        ),
        contractItems: issue.contractItems,
        transactionItems: issue.transactionItems,
      ),
      IssueKickoff() => value.copyWith(
        kickoff: KickoffIssue(
          id: issue.id,
          category: issue.category,
          user: issue.user,
          content: issue.content,
          kickoffDate: issue.kickoffDate!,
          attachments: issue.attachments,
          createdAt: issue.createdAt,
          updatedAt: issue.updatedAt,
        ),
      ),
      IssuePayment() => value.copyWith(
        payment: PaymentIssue(
          id: issue.id,
          category: issue.category,
          user: issue.user,
          content: issue.content,
          attachments: issue.attachments,
          createdAt: issue.createdAt,
          updatedAt: issue.updatedAt,
        ),
      ),
      IssueApproval() => value.copyWith(
        approvals: value.approvals
            .map(
              (e) => e.id == issue.id
                  ? ApprovalIssue(
                      id: issue.id,
                      category: issue.category,
                      user: issue.user,
                      content: issue.content,
                      attachments: issue.attachments,
                      createdAt: issue.createdAt,
                      updatedAt: issue.updatedAt,
                    )
                  : e,
            )
            .toList(),
      ),
      IssueProcurement() => value.copyWith(
        procurements: value.procurements
            .map(
              (e) => e.id == issue.id
                  ? ProcurementIssue(
                      id: issue.id,
                      category: issue.category,
                      user: issue.user,
                      content: issue.content,
                      procurementItems: issue.procurementItems,
                      requests: issue.requests,
                      attachments: issue.attachments,
                      createdAt: issue.createdAt,
                      updatedAt: issue.updatedAt,
                    )
                  : e,
            )
            .toList(),
      ),
      _ => value,
    });
  }

  void removeListItem({required Issue item}) {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(switch (item.category) {
      IssueApproval() => value.copyWith(
        approvals: value.approvals.where((d) => d.id != item.id).toList(),
      ),
      IssueProcurement() => value.copyWith(
        procurements: value.procurements.where((p) => p.id != item.id).toList(),
      ),
      IssueContract() => value.copyWith(contract: null),
      IssueKickoff() => value.copyWith(kickoff: null),
      IssueTransaction() => value.copyWith(transaction: null),
      IssuePayment() => value.copyWith(payment: null),
      _ => value,
    });

    // 카운트 감소
    switch (item.category) {
      case IssueApproval():
        ref
            .read(
              projectDetailControllerProvider(projectId: projectId).notifier,
            )
            .decreaseApprovalsCount();
        break;
      case IssueProcurement():
        ref
            .read(
              projectDetailControllerProvider(projectId: projectId).notifier,
            )
            .decreaseProcurementsCount();
        break;
      case IssueContract() ||
          IssueKickoff() ||
          IssueTransaction() ||
          IssuePayment():
        ref
            .read(
              projectDetailControllerProvider(projectId: projectId).notifier,
            )
            .decreaseContractsCount();
        break;
      default:
        break;
    }
  }
}
