part of '../controller.dart';

@riverpod
class ProjectFilterController extends _$ProjectFilterController {
  @override
  FutureOr<ProjectFilterState> build() async {
    return await _init();
  }

  Future<ProjectFilterState> _init() async {
    final categories = await ref
        .read(issueRepositoryProvider)
        .getAllCategories();

    final clients = await ref
        .read(projectClientRepositoryProvider)
        .getAllClients();

    return ProjectFilterState(
      categoryItems: categories,
      clientItems: clients,
      maxClientDepth: clients.map((e) => e.depth).toSet().length,
    );
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

    final isValid = ProjectSegment.values.map((e) => e.name).contains(view);

    state = AsyncData(
      value.copyWith(
        view: isValid ? view : null,
        sort: ProjectSort.values.firstWhereOrNull((e) => e.key == sort),
        order: Order.values.firstWhereOrNull((e) => e.key == order),
        search: search,
        bookmark: bookmark == null ? null : bookmark == 'true',
        clients: clients
            ?.split(',')
            .where((e) => e.isNotEmpty)
            .map(int.parse)
            .toList(),
        categories: categories
            ?.split(',')
            .where((e) => e.isNotEmpty)
            .map(int.parse)
            .toList(),
      ),
    );
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

  void reset() {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(
        view: null,
        sort: null,
        order: null,
        search: null,
        bookmark: null,
        clients: null,
        categories: null,
      ),
    );
  }

  Map<String, String?> toQueryParameters() {
    final value = state.value;

    if (value == null) return {};

    final queryParameters = {
      if (value.view != null) 'view': value.view,
      if (value.sort != null) 'sort': value.sort?.key,
      if (value.order != null) 'order': value.order?.key,
      if (value.search != null) 'search': value.search,
      if (value.bookmark != null) 'bookmark': value.bookmark.toString(),
      if (value.clients != null) 'clients': value.clients?.join(','),
      if (value.categories != null) 'categories': value.categories?.join(','),
    };

    return queryParameters;
  }
}
