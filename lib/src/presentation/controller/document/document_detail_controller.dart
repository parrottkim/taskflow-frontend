part of '../controller.dart';

@riverpod
class DocumentDetailController extends _$DocumentDetailController {
  @override
  FutureOr<DocumentDetailState> build({required int documentId}) async =>
      _init();

  Future<DocumentDetailState> _init() async {
    if (documentId == 0) {
      return DocumentDetailState(document: Document.dummy());
    }

    final result = await ref
        .watch(documentRepositoryProvider)
        .getDocumentForEdit(id: documentId);

    return DocumentDetailState(document: result);
  }
}
