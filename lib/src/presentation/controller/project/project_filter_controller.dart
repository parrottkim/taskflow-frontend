part of '../controller.dart';

@riverpod
class ProjectFilterController extends _$ProjectFilterController {
  @override
  ProjectFilterState build(ProjectFilterScope scope) => ProjectFilterState();

  void init({
    String? view,
    String? sort,
    String? order,
    String? search,
    String? bookmark,
    String? clients,
    String? categories,
  }) {
    final value = state;

    final isValid = ProjectSegment.values.map((e) => e.name).contains(view);
    final nextClients = clients
        ?.split(',')
        .map((value) => int.tryParse(value))
        .nonNulls
        .toList();

    final nextValue = value.copyWith(
      view: isValid ? view : null,
      sort: sort != null ? ProjectSort.fromKey(sort) : null,
      order: order != null ? Order.fromKey(order) : null,
      search: search,
      bookmark: bookmark == null ? null : bookmark == 'true',
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

  void setView({String? view}) {
    state = state.copyWith(view: view);
  }

  void setSort({ProjectSort? sort}) {
    state = state.copyWith(sort: sort);
  }

  void setOrder({Order? order}) {
    state = state.copyWith(order: order);
  }

  void setSearch({String? search}) {
    state = state.copyWith(search: search);
  }

  void setBookmark({bool? bookmark}) {
    state = state.copyWith(bookmark: bookmark);
  }

  void setClients({List<int>? clients}) {
    state = state.copyWith(clients: clients);
  }

  void setCategories({List<int>? categories}) {
    state = state.copyWith(categories: categories);
  }
}
