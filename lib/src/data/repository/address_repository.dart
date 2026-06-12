part of '../data.dart';

abstract class AddressRepository {
  Future<AddressSearchResult> searchAddresses({
    required int currentPage,
    required String keyword,
  });
}
