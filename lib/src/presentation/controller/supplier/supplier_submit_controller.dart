part of '../controller.dart';

@riverpod
class SupplierSubmitController extends _$SupplierSubmitController {
  @override
  SupplierSubmitState build() => SupplierSubmitState.idle();

  Future<void> createSupplier() async {
    final value = ref.read(supplierFormControllerProvider()).value;

    if (value == null) return;

    state = SupplierSubmitState.pending();

    try {
      String? logoUrl;

      // 1. ⭐️ 공급업체 생성 전에 이미지 업로드를 먼저 수행하여 URL 확보
      if (value.file != null) {
        final bytes = await value.file!.readAsBytes();
        final mimeType = lookupMimeType('', headerBytes: bytes) ?? 'image/jpeg';
        final file = MultipartFile.fromBytes(
          bytes,
          filename: value.file!.name,
          contentType: MediaType.parse(mimeType),
        );

        final logo = await ref
            .read(sftpRepositoryProvider)
            .uploadSupplierLogo(file: file);

        logoUrl = logo.url; // 생성된 외부 접근 URL 추출
      }

      final request = CreateSupplierDto(
        name: value.name!,
        number: value.number!,
        zipcode: value.zipcode,
        roadAddress: value.roadAddress,
        roadAddressReference: value.roadAddressReference,
        detailAddress: value.detailAddress,
        phone: value.phone,
        email: value.email,
        logo: logoUrl,
      );

      Supplier supplier = await ref
          .read(supplierRepositoryProvider)
          .createSupplier(request: request);

      ref
          .read(supplierListControllerProvider.notifier)
          .addListItem(item: supplier);

      state = SupplierSubmitState.created(supplier);
    } catch (e) {
      state = SupplierSubmitState.failure(e.toString());
    }
  }

  Future<void> updateSupplier({required int supplierId}) async {
    final value = ref
        .read(supplierFormControllerProvider(supplierId: supplierId))
        .value;

    if (value == null) return;

    state = SupplierSubmitState.pending();

    try {
      String? logoUrl;

      // 1. ⭐️ 공급업체 생성 전에 이미지 업로드를 먼저 수행하여 URL 확보
      if (value.file != null) {
        final bytes = await value.file!.readAsBytes();
        final mimeType = lookupMimeType('', headerBytes: bytes) ?? 'image/jpeg';
        final file = MultipartFile.fromBytes(
          bytes,
          filename: value.file!.name,
          contentType: MediaType.parse(mimeType),
        );

        final logo = await ref
            .read(sftpRepositoryProvider)
            .uploadSupplierLogo(file: file);

        logoUrl = logo.url; // 생성된 외부 접근 URL 추출
      }

      final request = CreateSupplierDto(
        name: value.name!,
        number: value.number!,
        zipcode: value.zipcode,
        roadAddress: value.roadAddress,
        roadAddressReference: value.roadAddressReference,
        detailAddress: value.detailAddress,
        phone: value.phone,
        email: value.email,
        logo: logoUrl ?? value.logo,
      );

      Supplier supplier = await ref
          .read(supplierRepositoryProvider)
          .updateSupplier(id: supplierId, request: request);

      if (value.file != null) {
        final bytes = await value.file!.readAsBytes();
        final mimeType = lookupMimeType('', headerBytes: bytes) ?? 'image/jpeg';
        final file = MultipartFile.fromBytes(
          bytes,
          filename: value.file!.name,
          contentType: MediaType.parse(mimeType),
        );

        final logo = await ref
            .read(sftpRepositoryProvider)
            .uploadSupplierLogo(file: file);

        supplier = supplier.copyWith(logo: logo.url);
      }

      ref
          .read(supplierListControllerProvider.notifier)
          .updateListItem(item: supplier);

      state = SupplierSubmitState.edited(supplier);
    } catch (e) {
      state = SupplierSubmitState.failure(e.toString());
    }
  }

  Future<void> deleteSupplier({required int supplierId}) async {}
}
