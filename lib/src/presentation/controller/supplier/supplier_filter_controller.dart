part of '../controller.dart';

@riverpod
class SupplierFilterController extends _$SupplierFilterController {
  Timer? _debounce;

  @override
  SupplierFilterState build(SupplierFilterScope scope) {
    ref.onDispose(() => _debounce?.cancel());

    return SupplierFilterState();
  }

  void init({String? search}) {
    final value = state;
    final normalizedSearch = search?.trim() ?? '';
    final nextValue = value.copyWith(search: normalizedSearch);

    if (nextValue == value) return;

    state = nextValue;
  }

  void setSearch({required String search}) {
    state = state.copyWith(search: search);
  }

  void debounceSearch({required String search}) {
    final value = state;

    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      state = value.copyWith(search: search);
    });
  }
}
