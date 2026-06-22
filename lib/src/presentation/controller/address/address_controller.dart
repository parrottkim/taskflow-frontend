part of '../controller.dart';

@riverpod
class AddressController extends _$AddressController {
  @override
  AddressState build() => AddressState();

  // 1. 검색 시작 (새로운 검색어 또는 첫 페이지 호출)
  Future<void> search({String? search}) async {
    if (search == null) return;

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(addressRepositoryProvider)
        .search(page: 1, search: search);

    state = state.copyWith(
      search: search,
      page: 2,
      total: result.total,
      items: result.items,
      // ⭐️ 첫 페이지 데이터가 전체 개수와 같거나 많으면 데이터 공급 종료
      hasReachEnd: result.items.length >= result.total,
      isLoading: false,
    );
  }

  // 2. 무한 스크롤 (다음 페이지 추가)
  Future<void> load() async {
    if (state.search.isEmpty) return;
    if (state.hasReachEnd) return; // ⭐️ 이미 끝에 도달했으면 중복 호출 방지 및 가드

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(addressRepositoryProvider)
        .search(page: state.page, search: state.search);
    final updatedItems = [...state.items, ...result.items];

    state = state.copyWith(
      page: state.page + 1,
      total: result.total,
      items: updatedItems,
      // ⭐️ 기존 수량 + 새로 추가된 수량이 전체 개수 이상인지 체크
      hasReachEnd: updatedItems.length >= result.total,
      isLoading: false,
    );
  }
}
