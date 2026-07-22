part of '../controller.dart';

@riverpod
class WorkIssueFilterController extends _$WorkIssueFilterController {
  @override
  WorkIssueFilterState build() => WorkIssueFilterState();

  void init({
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
      sort: sort != null ? WorkIssueSort.fromKey(sort) : null,
      order: order != null ? Order.fromKey(order) : null,
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

  void setSort({WorkIssueSort? sort}) {
    state = state.copyWith(sort: sort);
  }

  void setOrder({Order? order}) {
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
