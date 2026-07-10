part of '../controller.dart';

@freezed
abstract class DocumentSubmitState with _$DocumentSubmitState {
  factory DocumentSubmitState.idle() = DocumentSubmitIdle;
  factory DocumentSubmitState.pending() = DocumentSubmitPending;
  factory DocumentSubmitState.documentCreated() = DocumentSubmitDocumentCreated;
  factory DocumentSubmitState.documentUpdated() = DocumentSubmitDocumentUpdated;
  factory DocumentSubmitState.documentDeleted() = DocumentSubmitDocumentDeleted;
  factory DocumentSubmitState.folderSuccess() = DocumentSubmitFolderSuccess;
  factory DocumentSubmitState.failure(String message) = DocumentSubmitFailure;
}
