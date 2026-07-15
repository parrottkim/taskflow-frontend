part of '../controller.dart';

@riverpod
class DocumentDetailController extends _$DocumentDetailController {
  @override
  Future<Document> build({required int documentId}) {
    return ref
        .watch(documentRepositoryProvider)
        .getDocumentForEdit(id: documentId);
  }
}
