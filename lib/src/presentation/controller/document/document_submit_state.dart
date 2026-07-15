part of '../controller.dart';

@freezed
abstract class DocumentSubmitState with _$DocumentSubmitState {
  const factory DocumentSubmitState.idle() = DocumentSubmitIdle;
  const factory DocumentSubmitState.pending() = DocumentSubmitPending;
  const factory DocumentSubmitState.documentCreated() =
      DocumentSubmitDocumentCreated;
  const factory DocumentSubmitState.documentUpdated() =
      DocumentSubmitDocumentUpdated;
  const factory DocumentSubmitState.documentDeleted() =
      DocumentSubmitDocumentDeleted;
  const factory DocumentSubmitState.folderSuccess() =
      DocumentSubmitFolderSuccess;
  const factory DocumentSubmitState.mailed() = DocumentSubmitMailed;
  const factory DocumentSubmitState.failure(String message) =
      DocumentSubmitFailure;
}
