part of '../controller.dart';

@riverpod
class UserListController extends _$UserListController {
  @override
  FutureOr<UserListState> build() async {
    return _init();
  }

  Future<UserListState> _init() async {
    final filter = await ref.watch(userFilterControllerProvider.future);

    final result = await ref
        .read(userRepositoryProvider)
        .getUsers(
          departmentId: filter.department?.id,
          positionId: filter.position?.id,
          search: filter.search,
        );

    return UserListState(
      items: result.items,
      page: result.page,
      total: result.total,
      hasReachEnd: result.items.length >= result.total,
    );
  }

  Future<void> load() async {
    final filter = await ref.watch(userFilterControllerProvider.future);

    final value = state.value;

    if (value == null) return;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(userRepositoryProvider)
          .getUsers(
            page: value.page + 1,
            departmentId: filter.department?.id,
            positionId: filter.position?.id,
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

  Future<void> addListItem({required User item}) async {
    final value = state.value;
    if (value == null) return;

    final updatedUsers = [item, ...value.items];

    state = AsyncValue.data(value.copyWith(items: updatedUsers));
  }

  Future<void> updateListItem({required User item}) async {
    final value = state.value;
    if (value == null) return;

    final updatedUsers = value.items.map((issue) {
      return issue.id == item.id ? item : issue;
    }).toList();

    state = AsyncValue.data(value.copyWith(items: updatedUsers));
  }

  Future<void> removeListItem({required int id}) async {
    final value = state.value;
    if (value == null) return;

    final updatedUsers = value.items
        .where((project) => project.id != id)
        .toList();

    state = AsyncValue.data(value.copyWith(items: updatedUsers));
  }
}
