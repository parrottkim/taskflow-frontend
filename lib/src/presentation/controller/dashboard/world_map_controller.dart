part of '../controller.dart';

@riverpod
class WorldMapController extends _$WorldMapController {
  @override
  FutureOr<WorldMapState> build() async {
    return init();
  }

  Future<WorldMapState> init() async {
    final result =
        await ref.watch(projectClientRepositoryProvider).getAllClientCount();

    return WorldMapState(items: result);
  }
}
