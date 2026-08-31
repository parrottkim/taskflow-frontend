part of '../controller.dart';

@riverpod
Future<Document> documentDetail(Ref ref, {required int documentId}) async {
  if (documentId == 0) {
    return Document.dummy();
  }

  return ref
      .watch(documentRepositoryProvider)
      .getDocumentDetail(id: documentId);
}
