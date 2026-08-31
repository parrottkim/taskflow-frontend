part of '../controller.dart';

@freezed
abstract class DraftState with _$DraftState {
  const factory DraftState({
    @Default([]) List<Draft> drafts,
    String? currentDraftId,
  }) = _DraftState;
}
