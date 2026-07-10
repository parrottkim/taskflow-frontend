part of '../controller.dart';

@riverpod
class UserFilterController extends _$UserFilterController {
  Timer? _debounce;

  @override
  FutureOr<UserFilterState> build(UserFilterScope scope) async {
    ref.onDispose(() => _debounce?.cancel());

    return UserFilterState();
  }

  Future<void> init({
    String? search,
    String? departments,
    int? positionId,
  }) async {
    final value = await future;
    final normalizedSearch = search?.trim();
    final nextSearch = normalizedSearch == null || normalizedSearch.isEmpty
        ? null
        : normalizedSearch;
    final options = await ref.read(userOptionsControllerProvider.future);
    final nextDepartments = _findDepartmentPath(
      groups: options.departmentGroups,
      departments: departments,
      currentDepartments: value.departments,
    );
    final nextPositionId =
        options.positionItems.any((item) => item.id == positionId)
        ? positionId
        : value.positionId == positionId
        ? value.positionId
        : null;

    final nextValue = value.copyWith(
      search: nextSearch ?? '',
      departments: nextDepartments,
      positionId: nextPositionId,
    );

    if (nextValue == value) return;

    state = AsyncData(nextValue);
  }

  void setSearch({required String search}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(search: search));
  }

  void debounceSearch({required String search}) {
    final value = state.value;

    if (value == null) return;

    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      state = AsyncValue.data(value.copyWith(search: search));
    });
  }

  void setPosition({UserPosition? position}) {
    setPositionId(positionId: position?.id);
  }

  void setPositionId({int? positionId}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncValue.data(value.copyWith(positionId: positionId));
  }

  void setDepartment({UserDepartment? department}) {
    setDepartments(departments: department == null ? null : [department.id]);
  }

  void setDepartments({List<int>? departments}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncValue.data(value.copyWith(departments: departments));
  }

  List<int>? _findDepartmentPath({
    required List<UserDepartmentGroup> groups,
    required String? departments,
    required List<int>? currentDepartments,
  }) {
    final parsedDepartments = departments
        ?.split(',')
        .map((value) => int.tryParse(value))
        .nonNulls
        .toList();

    if (parsedDepartments == null || parsedDepartments.isEmpty) return null;

    final path = <int>[];

    for (final departmentId in parsedDepartments) {
      final depth = path.length;
      final parentId = path.isEmpty ? null : path.last;
      final group = groups.firstWhereOrNull(
        (group) => group.depth == depth && group.parentId == parentId,
      );

      if (group == null) break;
      if (!group.items.any((item) => item.id == departmentId)) break;

      path.add(departmentId);
    }

    if (path.isNotEmpty) return path;
    if (parsedDepartments.length == 1) {
      final leafPath = _findDepartmentPathByLeaf(
        groups: groups,
        departmentId: parsedDepartments.first,
      );

      if (leafPath != null) return leafPath;
    }

    return const ListEquality<int>().equals(
          parsedDepartments,
          currentDepartments,
        )
        ? currentDepartments
        : null;
  }

  List<int>? _findDepartmentPathByLeaf({
    required List<UserDepartmentGroup> groups,
    required int departmentId,
  }) {
    final departmentsById = {
      for (final group in groups)
        for (final item in group.items) item.id: item,
    };
    final path = <int>[];
    var current = departmentsById[departmentId];

    if (current == null) return null;

    while (current != null) {
      path.insert(0, current.id);

      final parentId = groups
          .firstWhereOrNull(
            (group) => group.items.any((item) => item.id == current!.id),
          )
          ?.parentId;
      current = parentId == null ? null : departmentsById[parentId];
    }

    return path;
  }
}
