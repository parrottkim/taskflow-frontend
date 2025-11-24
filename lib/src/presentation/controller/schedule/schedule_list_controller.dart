part of '../controller.dart';

@riverpod
class ScheduleListController extends _$ScheduleListController {
  @override
  FutureOr<ScheduleListState> build({int? projectId}) async {
    return _init();
  }

  Future<ScheduleListState> _init() async {
    final filter = await ref.read(scheduleFilterControllerProvider.future);

    final result = await ref.read(scheduleRepositoryProvider).getSchedules(
          projectId: projectId,
          search: filter.search,
          start: filter.start,
          end: filter.end,
        );

    return ScheduleListState(
      items: result.items,
      hasNext: result.hasNext,
      hasPrevious: result.hasPrevious,
      start: filter.start,
      end: filter.end,
    );
  }

  // List<ScheduleGroup>을 받아서 날짜별로 그룹을 통합하고 내부 아이템 중복을 제거하는 함수
  List<ScheduleGroup> _mergeAndDeduplicate(List<ScheduleGroup> groups) {
    // 날짜(키)와 해당 그룹 객체(값)를 저장할 맵
    final Map<DateTime, ScheduleGroup> mergedGroups = {};

    for (final group in groups) {
      final dateKey =
          DateTime(group.date.year, group.date.month, group.date.day);

      if (mergedGroups.containsKey(dateKey)) {
        // 이미 같은 날짜의 그룹이 있다면
        final existingGroup = mergedGroups[dateKey]!;

        // 기존 아이템과 새 아이템을 합치고 Set을 이용해 중복 제거
        final allItems = [...existingGroup.items, ...group.items];

        // ⚠️ Set을 사용하려면 Schedule 모델에 ==와 hashCode가 구현되어야 함.
        final uniqueItems = allItems.toSet().toList();
        uniqueItems.sort((a, b) => a.id.compareTo(b.id));

        // 기존 그룹의 아이템 목록을 업데이트 (새로운 객체 생성)
        mergedGroups[dateKey] =
            ScheduleGroup(date: existingGroup.date, items: uniqueItems);
      } else {
        // 새로운 날짜의 그룹이라면
        // ⚠️ 만약 items에 중복이 있을 수 있다면 여기서 한 번 더 toSet() 처리
        mergedGroups[dateKey] = group;
      }
    }

    // 날짜 순서대로 정렬하여 리스트 반환
    final sortedGroups = mergedGroups.values.toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    return sortedGroups;
  }

  Future<void> loadPrevious() async {
    final value = state.valueOrNull;

    if (value == null || value.hasPrevious != true) return;

    final filter = await ref.read(scheduleFilterControllerProvider.future);

    final newEnd = value.start; // 현재 시작일 직전까지의 데이터를 요청해야 하므로, end를 현재 start로 설정
    final newStart = value.start
        .subtract(const Duration(days: 28)); // start는 현재 start에서 7일 전

    // 3. 데이터 요청
    final result = await ref.read(scheduleRepositoryProvider).getSchedules(
          projectId: projectId,
          search: filter.search,
          // start는 null을 전달하여 DTO 기본값(일주일 전)이 사용되거나,
          // 서버에서 start 날짜를 무시하고 end 기준으로 이전 페이지를 가져오는 로직이 작동해야 합니다.
          start: newStart,
          end: newEnd, // 현재 목록의 가장 이전 일정 직전까지의 데이터를 요청합니다.
        );

    final allGroups = [...result.items, ...value.items]; // 모든 그룹을 일단 합침
    final mergedItems = _mergeAndDeduplicate(allGroups); // 커스텀 함수로 병합 및 중복 제거

    // 4. 데이터 병합 및 상태 업데이트
    state = AsyncData(
      value.copyWith(
          // 새로 가져온 데이터(이전)를 기존 데이터 앞에 추가
          items: mergedItems,
          hasPrevious: result.hasPrevious,
          // 시작 기준일 업데이트
          start: newStart,
          end: newEnd),
    );
  }

  /// 이후 일정 목록을 가져와 현재 목록에 병합합니다. (스크롤 하단에 도달 시)
  Future<void> loadNext() async {
    final value = state.valueOrNull;

    if (value == null || value.hasNext != true) return;

    final filter = await ref.read(scheduleFilterControllerProvider.future);

    final newStart = value.end;
    final newEnd = value.end.add(const Duration(days: 28));

    // 3. 데이터 요청
    final result = await ref.read(scheduleRepositoryProvider).getSchedules(
          projectId: projectId,
          search: filter.search,
          start: newStart,
          end: newEnd,
        );

    final allGroups = [...value.items, ...result.items]; // 모든 그룹을 일단 합침
    final mergedItems = _mergeAndDeduplicate(allGroups); // 커스텀 함수로 병합 및 중복 제거

    // 4. 데이터 병합 및 상태 업데이트
    state = AsyncData(
      value.copyWith(
        // 새로 가져온 데이터(이후)를 기존 데이터 뒤에 추가
        items: mergedItems,
        hasNext: result.hasNext,
        // 종료 기준일 업데이트
        start: newStart,
        end: newEnd,
      ),
    );
  }

  Future<void> addSchedule({required Schedule schedule}) async {
    final value = state.valueOrNull;
    if (value == null) return;

    // Schedule이 속해야 할 날짜를 찾습니다 (ScheduleGroup의 date는 보통 자정 00:00:00).
    final targetDate =
        DateTime(schedule.start.year, schedule.start.month, schedule.start.day);

    final updatedGroups = value.items.map((group) {
      // ScheduleGroup의 날짜와 Schedule의 날짜가 일치하는 경우
      if (group.date == targetDate) {
        // 해당 그룹에 새 Schedule을 추가하고, 업데이트된 그룹을 반환합니다.
        // (기존 항목들과 새로운 항목을 포함)
        final updatedSchedules = [schedule, ...group.items];
        return group.copyWith(items: updatedSchedules);
      }
      return group; // 날짜가 일치하지 않으면 기존 그룹을 반환합니다.
    }).toList();

    state = AsyncValue.data(value.copyWith(items: updatedGroups));
  }

  Future<void> updateSchedule({required Schedule updatedSchedule}) async {
    final value = state.valueOrNull;
    if (value == null) return;

    final updatedGroups = value.items.map((group) {
      // 1. 업데이트된 Schedule을 포함하는 새 리스트 생성
      final newSchedules = group.items.map((schedule) {
        return schedule.id == updatedSchedule.id ? updatedSchedule : schedule;
      }).toList();

      // 2. listEquals를 사용하여 기존 리스트와 새 리스트를 비교
      if (!listEquals(group.items, newSchedules)) {
        // 리스트 내용이 변경되었다면, Group을 새로 복사하여 반환
        return group.copyWith(items: newSchedules);
      }
      return group; // 변경 사항이 없으면 기존 Group을 그대로 반환
    }).toList();

    state = AsyncValue.data(value.copyWith(items: updatedGroups));
  }

  Future<void> removeSchedule({required int id}) async {
    final value = state.valueOrNull;
    if (value == null) return;

    // 1. 모든 ScheduleGroup을 순회하며 특정 ID의 Schedule을 제거합니다.
    final intermediateGroups = value.items.map((group) {
      // ID가 일치하지 않는 Schedule 항목만 남겨서 새로운 리스트를 만듭니다.
      final updatedItems =
          group.items.where((schedule) => schedule.id != id).toList();

      // Schedule 목록이 변경되었을 가능성이 있으므로, 새로운 Group 객체를 반환합니다.
      // (freezed의 불변성 패턴을 따름)
      return group.copyWith(items: updatedItems);
    }).toList();

    // 2. Schedule 항목이 하나도 남지 않아 items 리스트가 비어있는 ScheduleGroup을 필터링하여 제거합니다.
    final finalGroups =
        intermediateGroups.where((group) => group.items.isNotEmpty).toList();

    // 3. 상태를 업데이트합니다.
    state = AsyncValue.data(value.copyWith(items: finalGroups));
  }
}
