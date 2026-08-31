part of '../controller.dart';

@riverpod
class WorkReportFilterController extends _$WorkReportFilterController {
  @override
  WorkReportFilterState build() => WorkReportFilterState();

  void init({
    String? sort,
    String? order,
    String? search,
    String? clients,
    String? categories,
    String? start,
    String? end,
  }) {
    final value = state;

    final nextClients = clients
        ?.split(',')
        .map((value) => int.tryParse(value))
        .nonNulls
        .toList();

    final nextValue = value.copyWith(
      sort: sort != null ? WorkReportSortOption.fromKey(sort) : null,
      order: order != null ? SortDirection.fromKey(order) : null,
      search: search,
      clients: nextClients == null || nextClients.isEmpty ? null : nextClients,
      categories: categories
          ?.split(',')
          .where((e) => e.isNotEmpty)
          .map(int.parse)
          .toList(),
      start: start != null ? DateTime.tryParse(start) : null,
      end: end != null ? DateTime.tryParse(end) : null,
    );

    if (nextValue == value) return;

    state = nextValue;
  }

  void setSort({WorkReportSortOption? sort}) {
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

  void setDateRange({DateTime? start, DateTime? end}) {
    state = state.copyWith(start: start, end: end);
  }
}
