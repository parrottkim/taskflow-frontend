part of '../controller.dart';

@freezed
abstract class IssueFormState with _$IssueFormState {
  const factory IssueFormState({
    String? content,
    List<IssueAttachment>? attachments,
    List<XFile>? files,
  }) = _IssueFormState;
  // 계약 및 발주
  factory IssueFormState.contract({
    String? content,
    List<ContractItem>? items,
    List<IssueAttachment>? attachments,
    List<XFile>? files,
  }) = IssueFormContract;
  // 킥어프
  factory IssueFormState.kickoff({
    String? content,
    int? kickoffId,
    DateTime? kickoffDate,
    List<IssueAttachment>? attachments,
    List<XFile>? files,
  }) = IssueFormKickoff;
  // 사양 승인
  factory IssueFormState.approval({
    String? content,
    List<IssueAttachment>? attachments,
    List<XFile>? files,
  }) = IssueFormApproval;
  // 구매 조달
  factory IssueFormState.procurement({
    String? content,
    List<ProcurementItem>? items,
    List<IssueAttachment>? attachments,
    List<XFile>? files,
  }) = IssueFormProcurement;
  // 거래 명세
  factory IssueFormState.transaction({
    String? content,
    List<TransactionItem>? items,
    List<IssueAttachment>? attachments,
    List<XFile>? files,
  }) = IssueFormTransaction;
  // 수출 신고
  factory IssueFormState.declaration({
    String? content,
    List<IssueAttachment>? attachments,
    List<XFile>? files,
  }) = IssueFormDeclaration;
  // 지급 청구
  factory IssueFormState.payment({
    String? content,
    List<IssueAttachment>? attachments,
    List<XFile>? files,
  }) = IssueFormPayment;
}
