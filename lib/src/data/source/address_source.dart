part of '../data.dart';

class AddressDataSource implements AddressRepository {
  final AddressService _service;

  AddressDataSource({required AddressService service}) : _service = service;

  @override
  Future<AddressSearchResult> searchAddresses({
    required int currentPage,
    required String keyword,
  }) async {
    final raw = await _service.searchAddresses(
      currentPage: currentPage,
      keyword: keyword,
    );

    if (raw is! Map<String, dynamic>) {
      throw Exception('주소 API 응답 형식이 올바르지 않습니다.');
    }

    final data = raw;

    final results = _asMap(data['results']);
    final common = _asMap(results['common']);

    final errorCode = (common['errorCode'] ?? '').toString();
    final errorMessage = (common['errorMessage'] ?? '').toString();

    if (errorCode.isNotEmpty && errorCode != '0') {
      throw Exception(errorMessage.isEmpty ? '주소 검색에 실패했습니다.' : errorMessage);
    }

    final totalCount =
        int.tryParse((common['totalCount'] ?? '0').toString()) ?? 0;

    final jusoRaw = results['juso'];
    final list = jusoRaw is List
        ? jusoRaw
              .whereType<Map<String, dynamic>>()
              .map(AddressItem.fromJson)
              .toList()
        : <AddressItem>[];

    return AddressSearchResult(totalCount: totalCount, items: list);
  }

  Map<String, dynamic> _asMap(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value;
    }
    return <String, dynamic>{};
  }
}

@riverpod
AddressRepository addressRepository(Ref ref) {
  final dio = ref.watch(addressHttpProvider);
  return AddressDataSource(service: AddressService(dio));
}
