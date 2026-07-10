part of '../controller.dart';

@riverpod
class ProjectFilterController extends _$ProjectFilterController {
  @override
  FutureOr<ProjectFilterState> build(ProjectFilterScope scope) async {
    return ProjectFilterState();
  }

  Future<void> init({
    String? view,
    String? sort,
    String? order,
    String? search,
    String? bookmark,
    String? clients,
    String? categories,
  }) async {
    final value = await future;
    final options = await ref.read(projectOptionsControllerProvider.future);

    final isValid = ProjectSegment.values.map((e) => e.name).contains(view);
    final nextClients = _findClientPath(
      groups: options.clientItems,
      clients: clients,
      currentClients: value.clients,
    );

    final nextValue = value.copyWith(
      view: isValid ? view : null,
      sort: sort != null ? ProjectSort.fromKey(sort) : null,
      order: order != null ? Order.fromKey(order) : null,
      search: search,
      bookmark: bookmark == null ? null : bookmark == 'true',
      clients: nextClients,
      categories: categories
          ?.split(',')
          .where((e) => e.isNotEmpty)
          .map(int.parse)
          .toList(),
    );

    if (nextValue == value) return;

    state = AsyncData(nextValue);
  }

  void setView({String? view}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(view: view));
  }

  void setSort({ProjectSort? sort}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(sort: sort));
  }

  void setOrder({Order? order}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(order: order));
  }

  void setSearch({String? search}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(search: search));
  }

  void setBookmark({bool? bookmark}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(bookmark: bookmark));
  }

  void setClients({List<int>? clients}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(clients: clients));
  }

  void setCategories({List<int>? categories}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(categories: categories));
  }

  List<int>? _findClientPath({
    required List<ClientGroup> groups,
    required String? clients,
    required List<int>? currentClients,
  }) {
    final parsedClients = clients
        ?.split(',')
        .map((value) => int.tryParse(value))
        .nonNulls
        .toList();

    if (parsedClients == null || parsedClients.isEmpty) return null;

    final path = <int>[];

    for (final clientId in parsedClients) {
      final depth = path.length;
      final parentId = path.isEmpty ? null : path.last;
      final group = groups.firstWhereOrNull(
        (group) => group.depth == depth && group.parentId == parentId,
      );

      if (group == null) break;
      if (!group.items.any((item) => item.id == clientId)) break;

      path.add(clientId);
    }

    if (path.isNotEmpty) return path;
    if (parsedClients.length == 1) {
      final leafPath = _findClientPathByLeaf(
        groups: groups,
        clientId: parsedClients.first,
      );

      if (leafPath != null) return leafPath;
    }

    return const ListEquality<int>().equals(parsedClients, currentClients)
        ? currentClients
        : null;
  }

  List<int>? _findClientPathByLeaf({
    required List<ClientGroup> groups,
    required int clientId,
  }) {
    final clientsById = {
      for (final group in groups)
        for (final item in group.items) item.id: item,
    };
    final path = <int>[];
    var current = clientsById[clientId];

    if (current == null) return null;

    while (current != null) {
      path.insert(0, current.id);

      final parentId = groups
          .firstWhereOrNull(
            (group) => group.items.any((item) => item.id == current!.id),
          )
          ?.parentId;
      current = parentId == null ? null : clientsById[parentId];
    }

    return path;
  }
}
