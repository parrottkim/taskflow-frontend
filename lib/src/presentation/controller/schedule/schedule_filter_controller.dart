part of '../controller.dart';

@riverpod
class ScheduleFilterController extends _$ScheduleFilterController {
  @override
  FutureOr<ScheduleFilterState> build(ScheduleFilterScope scope) async {
    return _init();
  }

  Future<ScheduleFilterState> _init() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final defaultStart = today.subtract(const Duration(days: 28));
    final defaultEnd = today.add(const Duration(days: 28));

    return ScheduleFilterState(start: defaultStart, end: defaultEnd);
  }

  Future<void> init({String? search, String? departments}) async {
    final normalizedSearch = search?.trim();
    final nextSearch = normalizedSearch == null || normalizedSearch.isEmpty
        ? null
        : normalizedSearch;
    final value = state.value;

    List<int>? nextDepartments;
    if (departments != null && departments.trim().isNotEmpty) {
      final options = await ref.read(scheduleOptionsControllerProvider.future);
      nextDepartments = _findDepartmentPath(
        groups: options.departmentGroups,
        departments: departments,
        currentDepartments: value?.departments,
      );
    }

    if (value == null) {
      final initialValue = await _init();
      final nextValue = initialValue.copyWith(
        search: nextSearch,
        departments: nextDepartments,
      );

      if (nextValue == initialValue) return;

      state = AsyncData(nextValue);
      return;
    }

    final nextValue = value.copyWith(
      search: nextSearch,
      departments: nextDepartments,
    );

    if (nextValue == value) return;

    state = AsyncData(nextValue);
  }

  void setSearch({String? search}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(search: search));
  }

  void setDateRange({DateTime? start, DateTime? end}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(start: start ?? value.start, end: end ?? value.end),
    );
  }

  void setDepartments({List<int>? departments}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(departments: departments));
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
