part of '../controller.dart';

@riverpod
class DocumentListController extends _$DocumentListController {
  @override
  FutureOr<DocumentListState> build() async {
    return _init();
  }

  Future<DocumentListState> _init() async {
    final filter = ref.watch(documentFilterControllerProvider);

    final result = await ref
        .watch(documentRepositoryProvider)
        .getDocuments(
          folderId: filter.folderId,
          sort: filter.sort.key,
          order: filter.order.key,
          search: filter.search,
        );

    return DocumentListState(
      items: result.items,
      page: result.page,
      total: result.total,
      hasReachEnd: result.items.length >= result.total,
    );
  }

  Future<void> load() async {
    final filter = ref.watch(documentFilterControllerProvider);

    final value = state.value;

    if (value == null) return;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(documentRepositoryProvider)
          .getDocuments(
            page: value.page + 1,
            folderId: filter.folderId,
            sort: filter.sort.key,
            order: filter.order.key,
            search: filter.search,
          );

      return value.copyWith(
        items: [...value.items, ...result.items],
        page: result.page,
        total: result.total,
        hasReachEnd: value.items.length + result.items.length >= value.total,
      );
    });
  }

  void addListItem({required DocumentListItem item}) {
    final value = state.value;
    if (value == null) return;

    final folderId = ref.read(documentFilterControllerProvider).folderId;
    if (item.folderId != folderId) return;

    state = AsyncValue.data(value.copyWith(items: [item, ...value.items]));
  }

  void updateListItem({required DocumentListItem item}) {
    final value = state.value;
    if (value == null) return;

    final folderId = ref.read(documentFilterControllerProvider).folderId;
    final documents = item.folderId == folderId
        ? value.items
              .map((document) => document.id == item.id ? item : document)
              .toList()
        : value.items.where((document) => document.id != item.id).toList();

    state = AsyncValue.data(value.copyWith(items: documents));
  }

  void removeListItem({required int id}) {
    final value = state.value;
    if (value == null) return;

    final documents = value.items
        .where((document) => document.id != id)
        .toList();

    state = AsyncValue.data(value.copyWith(items: documents));
  }
}
