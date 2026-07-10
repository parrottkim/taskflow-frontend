part of '../controller.dart';

@riverpod
class DocumentOptionsController extends _$DocumentOptionsController {
  @override
  FutureOr<DocumentOptionsState> build() async {
    final folders = await ref
        .read(documentFolderRepositoryProvider)
        .getAllFolders();

    return DocumentOptionsState(folderItems: folders);
  }

  void setFolderItems({required List<DocumentFolder> items}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(folderItems: items));
  }
}
