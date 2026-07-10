part of '../controller.dart';

@riverpod
class WorkFilterController extends _$WorkFilterController {
  @override
  FutureOr<WorkFilterState> build() => _init();

  Future<WorkFilterState> _init() async {
    return WorkFilterState();
  }

  Future<void> init({String? view}) async {
    final value = await future;

    state = AsyncData(value.copyWith(view: view));
  }

  void setView({String? view}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(view: view));
  }
}
