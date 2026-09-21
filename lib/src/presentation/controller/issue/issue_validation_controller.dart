part of '../controller.dart';

@riverpod
class IssueValidationController extends _$IssueValidationController {
  @override
  IssueValidationState build() => IssueValidationState();

  void reset() => state = IssueValidationState();

  bool validate({required IssueFormState value, required bool contentIsEmpty}) {
    final contractItems = value.contractItems;
    final transactionItems = value.transactionItems;
    final participantItems = value.participantItems;
    final tripItems = value.tripItems;
    final procurementItems = value.procurementItems;
    final transactionItemInvalid = transactionItems.any(
      (item) => item.category == null || item.price.isEmpty,
    );
    final totalRatio = transactionItems.fold<double>(
      0,
      (sum, item) => sum + (double.tryParse(item.ratio) ?? 0),
    );

    state = IssueValidationState(
      contentInvalid: contentIsEmpty,
      contractDateMissing:
          value.category is IssueContract && value.contractDate == null,
      contractItemsMissing:
          value.category is IssueContract && contractItems.isEmpty,
      contractItemInvalid:
          value.category is IssueContract &&
          contractItems.any((item) => item.item.isEmpty || item.price.isEmpty),
      transactionItemsMissing:
          (value.category is IssueContract ||
              value.category is IssueTransaction) &&
          transactionItems.isEmpty,
      transactionItemInvalid:
          (value.category is IssueContract ||
              value.category is IssueTransaction) &&
          transactionItemInvalid,
      ratioInvalid:
          value.category is IssueContract &&
          transactionItems.isNotEmpty &&
          !transactionItemInvalid &&
          totalRatio != 100,
      kickoffDateMissing:
          value.category is IssueKickoff && value.kickoffDate == null,
      kickoffParticipantItemsMissing:
          value.category is IssueKickoff && participantItems.isEmpty,
      kickoffParticipantItemInvalid:
          value.category is IssueKickoff &&
          participantItems.any(
            (item) => item.participant == null || item.role.trim().isEmpty,
          ),
      kickoffTripItemsMissing:
          value.category is IssueKickoff && tripItems.isEmpty,
      kickoffTripItemInvalid:
          value.category is IssueKickoff &&
          tripItems.any((item) => item.category == null || item.days < 1),
      procurementItemsMissing:
          value.category is IssueProcurement && procurementItems.isEmpty,
      procurementItemInvalid:
          value.category is IssueProcurement &&
          procurementItems.any(_isProcurementItemInvalid),
    );

    return isValid();
  }

  bool isValid() {
    return !state.contentInvalid &&
        !state.contractDateMissing &&
        !state.contractItemsMissing &&
        !state.contractItemInvalid &&
        !state.transactionItemsMissing &&
        !state.transactionItemInvalid &&
        !state.ratioInvalid &&
        !state.kickoffDateMissing &&
        !state.kickoffParticipantItemsMissing &&
        !state.kickoffParticipantItemInvalid &&
        !state.kickoffTripItemsMissing &&
        !state.kickoffTripItemInvalid &&
        !state.procurementItemsMissing &&
        !state.procurementItemInvalid;
  }

  void clearContent() => state = state.copyWith(contentInvalid: false);

  void clearContractDate() =>
      state = state.copyWith(contractDateMissing: false);

  void clearContract() => state = state.copyWith(
    contractItemsMissing: false,
    contractItemInvalid: false,
  );

  void clearTransaction() => state = state.copyWith(
    transactionItemsMissing: false,
    transactionItemInvalid: false,
    ratioInvalid: false,
  );

  void clearKickoffDate() => state = state.copyWith(kickoffDateMissing: false);

  void clearKickoffParticipants() => state = state.copyWith(
    kickoffParticipantItemsMissing: false,
    kickoffParticipantItemInvalid: false,
  );

  void clearKickoffTrips() => state = state.copyWith(
    kickoffTripItemsMissing: false,
    kickoffTripItemInvalid: false,
  );

  void clearProcurement() => state = state.copyWith(
    procurementItemsMissing: false,
    procurementItemInvalid: false,
  );
}

bool _isProcurementItemInvalid(ProcurementIssueItem item) {
  return item.item.isEmpty ||
      item.spec.isEmpty ||
      item.quantity.isEmpty ||
      item.unitPrice.isEmpty ||
      item.totalAmount.isEmpty ||
      (item.isOnlinePurchase && (item.purchaseUrl?.isEmpty ?? true)) ||
      (!item.isOnlinePurchase && item.supplier == null);
}
