part of '../controller.dart';

@riverpod
class SupplierSearchController extends _$SupplierSearchController {
  Timer? _debounce;

  @override
  SupplierSearchState build() {
    ref.onDispose(() => _debounce?.cancel());

    return SupplierSearchState.idle();
  }

  Future<void> search({required String search}) async {
    final keyword = search.trim();

    if (keyword.isEmpty) {
      _debounce?.cancel();
      state = SupplierSearchState.idle();
      return;
    }

    state = SupplierSearchState.waiting(search: keyword);

    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        final result = await ref
            .read(supplierRepositoryProvider)
            .getSuppliers(search: keyword);

        state = SupplierSearchState.result(
          search: keyword,
          items: result.items.isNotEmpty ? result.items : [],
          page: result.page,
          total: result.total,
          hasReachEnd: result.items.length >= result.total,
        );
      } catch (e) {
        state = SupplierSearchState.failure(e.toString());
      }
    });
  }

  Future<void> load() async {
    if (state is! SupplierSearchResult) return;

    final value = state as SupplierSearchResult;
    if (value.hasReachEnd) return;

    try {
      final result = await ref
          .read(supplierRepositoryProvider)
          .getSuppliers(page: value.page + 1, search: value.search);

      state = value.copyWith(
        search: value.search,
        items: [...value.items, ...result.items],
        page: result.page,
        total: result.total,
        hasReachEnd: value.items.length + result.items.length >= value.total,
      );
    } catch (e) {
      state = SupplierSearchState.failure(e.toString());
    }
  }

  Future<Supplier?> createSupplier({required Supplier supplier}) async {
    final result = await ref
        .read(supplierRepositoryProvider)
        .createSupplier(supplier: supplier);
    return result;
  }
}
