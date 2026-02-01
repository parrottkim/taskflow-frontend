part of '../controller.dart';

@riverpod
class ScheduleListController extends _$ScheduleListController {
  @override
  FutureOr<ScheduleListState> build({int? projectId}) async {
    return _init();
  }

  Future<ScheduleListState> _init() async {
    final filter = await ref.read(scheduleFilterControllerProvider.future);

    final result = await ref
        .read(scheduleRepositoryProvider)
        .getSchedules(
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
      final dateKey = DateTime(
        group.date.year,
        group.date.month,
        group.date.day,
      );

      if (mergedGroups.containsKey(dateKey)) {
        // 이미 같은 날짜의 그룹이 있다면
        final existingGroup = mergedGroups[dateKey]!;

        // 기존 아이템과 새 아이템을 합치고 Set을 이용해 중복 제거
        final allItems = [...existingGroup.items, ...group.items];

        // ⚠️ Set을 사용하려면 Schedule 모델에 ==와 hashCode가 구현되어야 함.
        final uniqueItems = allItems.toSet().toList();
        uniqueItems.sort((a, b) => a.id.compareTo(b.id));

        // 기존 그룹의 아이템 목록을 업데이트 (새로운 객체 생성)
        mergedGroups[dateKey] = ScheduleGroup(
          date: existingGroup.date,
          items: uniqueItems,
        );
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
    final value = state.value;

    if (value == null || value.hasPrevious != true) return;

    final filter = await ref.read(scheduleFilterControllerProvider.future);

    final newEnd = value.start; // 현재 시작일 직전까지의 데이터를 요청해야 하므로, end를 현재 start로 설정
    final newStart = value.start.subtract(
      const Duration(days: 28),
    ); // start는 현재 start에서 7일 전

    // 3. 데이터 요청
    final result = await ref
        .read(scheduleRepositoryProvider)
        .getSchedules(
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
        end: newEnd,
      ),
    );
  }

  /// 이후 일정 목록을 가져와 현재 목록에 병합합니다. (스크롤 하단에 도달 시)
  Future<void> loadNext() async {
    final value = state.value;

    if (value == null || value.hasNext != true) return;

    final filter = await ref.read(scheduleFilterControllerProvider.future);

    final newStart = value.end;
    final newEnd = value.end.add(const Duration(days: 28));

    // 3. 데이터 요청
    final result = await ref
        .read(scheduleRepositoryProvider)
        .getSchedules(
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
}
