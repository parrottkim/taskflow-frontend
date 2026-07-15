part of '../controller.dart';

@riverpod
class ScheduleFilterController extends _$ScheduleFilterController {
  @override
  ScheduleFilterState build(ScheduleFilterScope scope) => ScheduleFilterState();

  Future<void> init({String? view, String? search, String? departments}) async {
    final value = state;

    final normalizedSearch = search?.trim();
    final nextSearch = normalizedSearch == null || normalizedSearch.isEmpty
        ? null
        : normalizedSearch;

    List<int>? nextDepartments;

    if (departments != null && departments.trim().isNotEmpty) {
      final options = await ref.read(scheduleOptionsControllerProvider.future);

      nextDepartments = _findDepartmentPath(
        groups: options.departmentGroups,
        departments: departments,
        currentDepartments: value.departments,
      );
    }

    final nextValue = value.copyWith(
      view: view,
      search: nextSearch,
      departments: nextDepartments,
    );

    if (nextValue == value) return;

    state = nextValue;
  }

  void setView({String? view}) {
    state = state.copyWith(view: view);
  }

  void setSearch({String? search}) {
    state = state.copyWith(search: search);
  }

  void setDepartments({List<int>? departments}) {
    state = state.copyWith(departments: departments);
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
