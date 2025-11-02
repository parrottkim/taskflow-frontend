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
    if (search.isEmpty) {
      state = SupplierSearchState.idle();
    } else {
      state = SupplierSearchState.waiting(search: search);
    }

    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      final result = await ref
          .read(supplierRepositoryProvider)
          .getSuppliers(search: search);

      state = SupplierSearchState.result(
        search: search,
        items: result.items.isNotEmpty ? result.items : [],
        page: result.page,
        total: result.total,
        hasReachEnd: result.items.length >= result.total,
      );
    });
  }

  Future<void> load() async {
    if (state is! SupplierSearchResult) return;

    final value = state as SupplierSearchResult;

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
  }

  Future<Supplier?> createSupplier({required Supplier supplier}) async {
    final result = await ref
        .read(supplierRepositoryProvider)
        .createSupplier(supplier: supplier);
    return result;
  }
}
