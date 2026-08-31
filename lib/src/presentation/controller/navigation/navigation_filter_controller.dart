part of '../controller.dart';

@riverpod
class NavigationFilterController extends _$NavigationFilterController {
  Timer? _debounce;

  @override
  NavigationFilterState build() {
    ref.onDispose(() => _debounce?.cancel());

    return NavigationFilterState();
  }

  void setSearch({required String search}) {
    _debounce?.cancel();
    state = state.copyWith(search: search);
  }

  void debounceSearch({required String search}) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      state = state.copyWith(search: search);
    });
  }
}
