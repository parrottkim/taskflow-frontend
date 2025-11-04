part of '../controller.dart';

@riverpod
class ScheduleListController extends _$ScheduleListController {
  @override
  FutureOr<ScheduleListState> build({required int projectId}) async {
    return _init(projectId: projectId);
  }

  Future<ScheduleListState> _init({required int projectId}) async {
    final filter = await ref.watch(scheduleFilterControllerProvider.future);

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

  Future<void> loadPrevious() async {
    final value = state.valueOrNull;

    if (value == null || value.hasPrevious != true) return;

    final filter = await ref.read(scheduleFilterControllerProvider.future);

    final newEnd = value.start; // 현재 시작일 직전까지의 데이터를 요청해야 하므로, end를 현재 start로 설정
    final newStart =
        value.start.subtract(const Duration(days: 7)); // start는 현재 start에서 7일 전

    // 3. 데이터 요청
    final result = await ref.read(scheduleRepositoryProvider).getSchedules(
          projectId: projectId,
          search: filter.search,
          // start는 null을 전달하여 DTO 기본값(일주일 전)이 사용되거나,
          // 서버에서 start 날짜를 무시하고 end 기준으로 이전 페이지를 가져오는 로직이 작동해야 합니다.
          start: newStart,
          end: newEnd, // 현재 목록의 가장 이전 일정 직전까지의 데이터를 요청합니다.
        );

    // 4. 데이터 병합 및 상태 업데이트
    state = AsyncData(
      value.copyWith(
          // 새로 가져온 데이터(이전)를 기존 데이터 앞에 추가
          items: [...result.items, ...value.items],
          hasPrevious: result.hasPrevious,
          // 시작 기준일 업데이트
          start: newStart,
          end: newEnd),
    );
  }

  /// 이후 일정 목록을 가져와 현재 목록에 병합합니다. (스크롤 하단에 도달 시)
  Future<void> loadNext() async {
    final value = state.valueOrNull;

    if (value == null || value.hasPrevious != true) return;

    final filter = await ref.read(scheduleFilterControllerProvider.future);

    final newStart = value.end;
    final newEnd = value.end.add(const Duration(days: 7));

    // 3. 데이터 요청
    final result = await ref.read(scheduleRepositoryProvider).getSchedules(
          projectId: projectId,
          search: filter.search,
          start: newStart,
          end: newEnd,
        );

    // 4. 데이터 병합 및 상태 업데이트
    state = AsyncData(
      value.copyWith(
        // 새로 가져온 데이터(이후)를 기존 데이터 뒤에 추가
        items: [...value.items, ...result.items],
        hasNext: result.hasNext,
        // 종료 기준일 업데이트
        start: newStart,
        end: newEnd,
      ),
    );
  }
}
