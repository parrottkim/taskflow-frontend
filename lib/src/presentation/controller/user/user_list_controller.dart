part of '../controller.dart';

@riverpod
class UserListController extends _$UserListController {
  @override
  FutureOr<UserListState> build(UserFilterScope scope) async {
    return _init();
  }

  Future<UserListState> _init() async {
    final filter = _filter();

    final result = await ref
        .read(userRepositoryProvider)
        .getUsers(
          departmentId: filter.departments?.lastOrNull,
          positionId: filter.positionId,
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
    final filter = _filter();
    final value = state.value;

    if (value == null) return;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(userRepositoryProvider)
          .getUsers(
            page: value.page + 1,
            departmentId: filter.departments?.lastOrNull,
            positionId: filter.positionId,
            search: filter.search,
          );

      return value.copyWith(
        items: [...value.items, ...result.items],
        page: result.page,
        total: result.total,
        hasReachEnd: value.items.length + result.items.length >= result.total,
      );
    });
  }

  UserFilterState _filter() {
    if (scope == UserFilterScope.scheduleTimeline) {
      final filter = ref.watch(
        scheduleFilterControllerProvider(ScheduleFilterScope.schedulePage),
      );
      final departmentId = filter.departments?.lastOrNull;

      return UserFilterState(
        departments: departmentId == null ? null : [departmentId],
      );
    }

    return ref.watch(userFilterControllerProvider(scope));
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

    final updatedUsers = value.items.map((user) {
      return user.id == item.id ? item : user;
    }).toList();

    state = AsyncValue.data(value.copyWith(items: updatedUsers));
  }

  Future<void> removeListItem({required int id}) async {
    final value = state.value;
    if (value == null) return;

    final updatedUsers = value.items.where((user) => user.id != id).toList();

    state = AsyncValue.data(value.copyWith(items: updatedUsers));
  }
}
