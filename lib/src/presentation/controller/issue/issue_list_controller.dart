part of '../controller.dart';

@riverpod
class IssueListController extends _$IssueListController {
  @override
  FutureOr<IssueListState> build({required int projectId}) async {
    return _init();
  }

  Future<IssueListState> _init() async {
    final contract =
        await ref.read(issueRepositoryProvider).getContractIssue(id: projectId);
    final kickoff =
        await ref.read(issueRepositoryProvider).getKickoffIssue(id: projectId);
    final transaction = await ref
        .read(issueRepositoryProvider)
        .getTransactionIssue(id: projectId);
    final payment =
        await ref.read(issueRepositoryProvider).getPaymentIssue(id: projectId);
    final declarations = await ref
        .read(issueRepositoryProvider)
        .getDeclarationIssues(page: 1, projectId: projectId);
    final procurements = await ref
        .read(issueRepositoryProvider)
        .getProcurementIssues(page: 1, projectId: projectId);

    return IssueListState(
      contract: contract.data,
      kickoff: kickoff.data,
      transaction: transaction.data,
      payment: payment.data,
      declarations: declarations.items,
      declarationsPage: declarations.page,
      declarationsTotal: declarations.total,
      declarationsHasReachEnd: declarations.items.length >= declarations.total,
      procurements: procurements.items,
      procurementsPage: procurements.page,
      procurementsTotal: procurements.total,
      procurementsHasReachEnd: procurements.items.length >= procurements.total,
    );
  }

  Future<void> loadDeclarations() async {
    final value = state.valueOrNull;
    if (value == null) return;
    if (value.declarationsHasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final nextPage = value.declarationsPage + 1;
      final result = await ref
          .read(issueRepositoryProvider)
          .getDeclarationIssues(page: nextPage, projectId: projectId);

      return value.copyWith(
        declarations: [...value.declarations, ...result.items],
        declarationsPage: result.page,
        declarationsTotal: result.total,
        declarationsHasReachEnd:
            value.declarations.length + result.items.length >= result.total,
      );
    });
  }

  Future<void> loadProcurements() async {
    final value = state.valueOrNull;
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

  void addListItem({required Issue item}) {
    final value = state.valueOrNull;
    if (value == null) return;

    state = AsyncValue.data(
      switch (item.category) {
        IssueDeclaration() => value.copyWith(
            declarations: [
              DeclarationIssue(
                id: item.id,
                category: item.category,
                user: item.user,
                content: item.content,
                attachments: item.attachments,
                createdAt: item.createdAt,
                updatedAt: item.updatedAt,
              ),
              ...value.declarations
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
                attachments: item.attachments,
                createdAt: item.createdAt,
                updatedAt: item.updatedAt,
              ),
              ...value.procurements
            ],
          ),
        IssueContract() => value.copyWith(
            contract: ContractIssue(
              id: item.id,
              category: item.category,
              user: item.user,
              content: item.content,
              contractItems: item.contractItems,
              transactionItems: item.transactionItems,
              attachments: item.attachments,
              currency: item.currency!,
              createdAt: item.createdAt,
              updatedAt: item.updatedAt,
            ),
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
              contractItems: item.contractItems,
              transactionItems: item.transactionItems,
              attachments: item.attachments,
              currency: item.currency!,
              createdAt: item.createdAt,
              updatedAt: item.updatedAt,
            ),
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
      },
    );

    // 카운트 업데이트
    switch (item.category) {
      case IssueDeclaration():
        ref
            .read(
                projectDetailControllerProvider(projectId: projectId).notifier)
            .increaseDeclarationsCount();
        break;
      case IssueProcurement():
        ref
            .read(
                projectDetailControllerProvider(projectId: projectId).notifier)
            .increaseProcurementsCount();
        break;
      case IssueContract() ||
            IssueKickoff() ||
            IssueTransaction() ||
            IssuePayment():
        ref
            .read(
                projectDetailControllerProvider(projectId: projectId).notifier)
            .increaseContractsCount();
        break;
      default:
        break;
    }
  }

  void updateListItem(Issue issue) {
    final value = state.valueOrNull;
    if (value == null) return;

    if (value.contract != null && value.contract!.id == issue.id) {
      final oldContract = value.contract!;
      final updatedContract = oldContract.copyWith(
        contractItems: issue.contractItems,
        transactionItems: issue.transactionItems,
      );
      state = AsyncValue.data(value.copyWith(contract: updatedContract));
    } else if (value.kickoff != null && value.kickoff!.id == issue.id) {
      final oldKickoff = value.kickoff!;
      final updatedKickoff = oldKickoff.copyWith(
        kickoffDate: issue.kickoffDate!,
      );
      state = AsyncValue.data(value.copyWith(kickoff: updatedKickoff));
    } else if (value.transaction != null && value.transaction!.id == issue.id) {
      final oldTransaction = value.transaction!;
      final updatedTransaction = oldTransaction.copyWith(
        transactionItems: issue.transactionItems,
        contractItems: issue.contractItems,
      );
      state = AsyncValue.data(value.copyWith(transaction: updatedTransaction));
    } else if (value.payment != null && value.payment!.id == issue.id) {
      state = AsyncValue.data(value.copyWith(payment: issue as PaymentIssue));
    } else {
      // 리스트 업데이트
      final updatedDeclarations = value.declarations
          .map((e) => e.id == issue.id ? issue as DeclarationIssue : e)
          .toList();

      final updatedProcurements = value.procurements
          .map((e) => e.id == issue.id ? issue as ProcurementIssue : e)
          .toList();

      state = AsyncValue.data(value.copyWith(
        declarations: updatedDeclarations,
        procurements: updatedProcurements,
      ));
    }
  }

  void removeListItem({required Issue item}) {
    final value = state.valueOrNull;
    if (value == null) return;

    state = AsyncValue.data(
      switch (item.category) {
        IssueDeclaration() => value.copyWith(
            declarations:
                value.declarations.where((d) => d.id != item.id).toList(),
          ),
        IssueProcurement() => value.copyWith(
            procurements:
                value.procurements.where((p) => p.id != item.id).toList(),
          ),
        IssueContract() => value.copyWith(contract: null),
        IssueKickoff() => value.copyWith(kickoff: null),
        IssueTransaction() => value.copyWith(transaction: null),
        IssuePayment() => value.copyWith(payment: null),
        _ => value,
      },
    );

    // 카운트 감소
    switch (item.category) {
      case IssueDeclaration():
        ref
            .read(
                projectDetailControllerProvider(projectId: projectId).notifier)
            .decreaseDeclarationsCount();
        break;
      case IssueProcurement():
        ref
            .read(
                projectDetailControllerProvider(projectId: projectId).notifier)
            .decreaseProcurementsCount();
        break;
      case IssueContract() ||
            IssueKickoff() ||
            IssueTransaction() ||
            IssuePayment():
        ref
            .read(
                projectDetailControllerProvider(projectId: projectId).notifier)
            .decreaseContractsCount();
        break;
      default:
        break;
    }
  }
}
