part of '../controller.dart';

@riverpod
class SupplierFilterController extends _$SupplierFilterController {
  Timer? _debounce;

  @override
  FutureOr<SupplierFilterState> build() {
    ref.onDispose(() => _debounce?.cancel());

    return _init();
  }

  Future<SupplierFilterState> _init() async {
    return SupplierFilterState();
  }

  void setSearch({String? search}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(search: search));
  }

  void updateSearch({String? search}) {
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
