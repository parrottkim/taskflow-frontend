part of '../../data.dart';

@freezed
abstract class CreateSupplierRequest with _$CreateSupplierRequest {
  factory CreateSupplierRequest({
    required String name,
    required String number,
    String? zipcode,
    String? roadAddress,
    String? roadAddressReference,
    String? detailAddress,
    String? phone,
    String? email,
    String? logo,
  }) = _CreateSupplierRequest;

  factory CreateSupplierRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSupplierRequestFromJson(json);
}
