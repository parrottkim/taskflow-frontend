part of '../controller.dart';

@freezed
abstract class SupplierFormState with _$SupplierFormState {
  factory SupplierFormState({
    String? name,
    String? number,
    String? zipcode,
    String? roadAddress,
    String? roadAddressReference,
    String? detailAddress,
    String? phone,
    String? email,
    String? logo,
    XFile? file,
    Uint8List? fileBytes,
  }) = _SupplierFormState;
}
