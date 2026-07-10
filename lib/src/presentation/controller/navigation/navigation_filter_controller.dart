part of '../controller.dart';

@riverpod
class NavigationFilterController extends _$NavigationFilterController {
  Timer? _debounce;

  @override
  FutureOr<NavigationFilterState> build() {
    ref.onDispose(() => _debounce?.cancel());

    return NavigationFilterState();
  }

  void setSearch({required String search}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(search: search));
  }

  void debounceSearch({required String search}) {
    final value = state.value;

    if (value == null) return;

    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      state = AsyncData(value.copyWith(search: search));
    });
  }
}
