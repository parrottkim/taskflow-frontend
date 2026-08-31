part of '../controller.dart';

@riverpod
class WorkProjectFilterController extends _$WorkProjectFilterController {
  @override
  WorkProjectFilterState build() => WorkProjectFilterState();

  void init({
    String? status,
    String? sort,
    String? order,
    String? search,
    String? clients,
    String? categories,
  }) {
    final value = state;

    final nextClients = clients
        ?.split(',')
        .map((value) => int.tryParse(value))
        .nonNulls
        .toList();

    final nextValue = value.copyWith(
      status: status != null
          ? ProjectStatusFilter.fromKey(status)
          : state.status,
      sort: sort != null ? WorkProjectSortOption.formKey(sort) : null,
      order: order != null ? SortDirection.fromKey(order) : null,
      search: search,
      clients: nextClients == null || nextClients.isEmpty ? null : nextClients,
      categories: categories
          ?.split(',')
          .where((e) => e.isNotEmpty)
          .map(int.parse)
          .toList(),
    );

    if (nextValue == value) return;

    state = nextValue;
  }

  void setStaus({required ProjectStatusFilter status}) {
    state = state.copyWith(status: status);
  }

  void setSort({WorkProjectSortOption? sort}) {
    state = state.copyWith(sort: sort);
  }

  void setOrder({SortDirection? order}) {
    state = state.copyWith(order: order);
  }

  void setSearch({String? search}) {
    state = state.copyWith(search: search);
  }

  void setClients({List<int>? clients}) {
    state = state.copyWith(clients: clients);
  }

  void setCategories({List<int>? categories}) {
    state = state.copyWith(categories: categories);
  }
}
