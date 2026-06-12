part of '../controller.dart';

@riverpod
class AddressController extends _$AddressController {
  @override
  FutureOr<AddressState> build() async {
    return AddressState();
  }

  // 1. 검색 시작 (새로운 검색어 또는 첫 페이지 호출)
  Future<void> search({String? keyword}) async {
    final value = state.value;

    if (value == null) return;
    if (keyword == null) return;

    state = AsyncValue.data(value.copyWith(isLoading: true));

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(addressRepositoryProvider)
          .searchAddresses(currentPage: 1, keyword: keyword);

      return AddressState(
        keyword: keyword,
        page: 2,
        totalCount: result.totalCount,
        items: result.items,
        // ⭐️ 첫 페이지 데이터가 전체 개수와 같거나 많으면 데이터 공급 종료
        hasReachEnd: result.items.length >= result.totalCount,
      );
    });
  }

  // 2. 무한 스크롤 (다음 페이지 추가)
  Future<void> load() async {
    final value = state.value;

    if (value == null) return;
    if (value.keyword.isEmpty) return;
    if (value.hasReachEnd) return; // ⭐️ 이미 끝에 도달했으면 중복 호출 방지 및 가드

    state = AsyncValue.data(value.copyWith(isLoading: true));

    await Future.delayed(Duration(seconds: 3));

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(addressRepositoryProvider)
          .searchAddresses(currentPage: value.page, keyword: value.keyword);

      final updatedItems = [...value.items, ...result.items];

      return value.copyWith(
        page: value.page + 1,
        totalCount: result.totalCount,
        items: updatedItems,
        // ⭐️ 기존 수량 + 새로 추가된 수량이 전체 개수 이상인지 체크
        hasReachEnd: updatedItems.length >= result.totalCount,
      );
    });
  }
}
