part of '../controller.dart';

@riverpod
class SupplierFormController extends _$SupplierFormController {
  @override
  FutureOr<SupplierFormState> build({int? supplierId}) => _init();

  Future<SupplierFormState> _init() async {
    if (supplierId == null) {
      return SupplierFormState();
    }

    final result = await ref
        .read(supplierRepositoryProvider)
        .getSupplier(id: supplierId!);

    return SupplierFormState(
      name: result.name,
      number: result.number,
      zipcode: result.zipcode,
      roadAddress: result.roadAddress,
      roadAddressReference: result.roadAddressReference,
      detailAddress: result.detailAddress,
      phone: result.phone,
      email: result.email,
      logo: result.logo,
    );
  }

  void setName({required String name}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(name: name));
  }

  void setNumber({required String number}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(number: number));
  }

  void setAddress({
    required String zipcode,
    required String roadAddress,
    required String roadAddressReference,
    required String? detailAddress,
  }) {
    final value = state.requireValue;

    state = AsyncData(
      value.copyWith(
        zipcode: zipcode,
        roadAddress: roadAddress,
        roadAddressReference: roadAddressReference,
        detailAddress: detailAddress,
      ),
    );
  }

  void setPhone({required String phone}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(phone: phone));
  }

  void setEmail({required String email}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(email: email));
  }

  Future<void> addFile({required XFile file}) async {
    final value = state.requireValue;

    final bytes = await file.readAsBytes();

    state = AsyncData(value.copyWith(file: file, fileBytes: bytes));
  }

  void removeFile({required XFile file}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(file: null, fileBytes: null));
  }
}
