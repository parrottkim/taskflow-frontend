part of '../controller.dart';

@riverpod
class TripListController extends _$TripListController {
  @override
  FutureOr<TripListState> build({required int projectId}) async {
    return await _init(projectId: projectId);
  }

  Future<TripListState> _init({required int projectId}) async {
    final result = await ref.read(tripRepositoryProvider).getTrips(
          projectId: projectId,
        );

    return TripListState(
      items: result.items,
      page: result.page,
      total: result.total,
      hasReachEnd: result.items.length >= result.total,
    );
  }

  Future<void> load() async {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref.read(tripRepositoryProvider).getTrips(
            page: value.page + 1,
            projectId: projectId,
          );

      return value.copyWith(
        items: [...value.items, ...result.items],
        page: result.page,
        total: result.total,
        hasReachEnd: value.items.length + result.items.length >= value.total,
      );
    });
  }

  Future<void> addListItem({required Trip item}) async {
    final value = state.valueOrNull;
    if (value == null) return;

    final updatedTrips = [item, ...value.items];
    state = AsyncValue.data(value.copyWith(items: updatedTrips));
  }

  Future<void> updateListItem(Trip updatedItem) async {
    final value = state.valueOrNull;
    if (value == null) return;

    final updatedTrips = value.items.map((issue) {
      return issue.id == updatedItem.id ? updatedItem : issue;
    }).toList();

    state = AsyncValue.data(value.copyWith(items: updatedTrips));
  }

  Future<void> removeListItem({required int id}) async {
    final value = state.valueOrNull;
    if (value == null) return;

    final updatedTrips =
        value.items.where((project) => project.id != id).toList();

    state = AsyncValue.data(value.copyWith(items: updatedTrips));
  }
}
