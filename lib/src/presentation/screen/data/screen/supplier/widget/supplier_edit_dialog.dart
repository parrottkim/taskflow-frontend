import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/data/screen/supplier/widget/supplier_address_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/formatter.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class SupplierEditDialog extends ConsumerWidget {
  final int? supplierId;

  const SupplierEditDialog({super.key, this.supplierId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
      supplierFormControllerProvider(supplierId: supplierId),
    );

    return switch (form) {
      AsyncData(:final value) => _DialogWidget(
        supplierId: supplierId,
        value: value,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorDialog(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DialogWidget(
          supplierId: supplierId,
          value: SupplierFormState(),
        ),
      ),
    };
  }
}

class _DialogWidget extends HookConsumerWidget {
  final int? supplierId;
  final SupplierFormState value;

  const _DialogWidget({this.supplierId, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final maxImageSize = Functions(context).maxImageSize;

    // 1. 컨트롤러 초기화 및 초기값 매핑 수정 (detailAddress 바인딩 정상화)
    final nameController = useTextEditingController(text: value.name);
    final numberController = useTextEditingController(text: value.number);
    final zipcodeController = useTextEditingController(text: value.zipcode);
    // 1. 저장용 컨트롤러 2개 (화면엔 안 보여줌)
    final roadAddressController = useTextEditingController(
      text: value.roadAddress,
    );
    final roadAddressReferenceController = useTextEditingController(
      text: value.roadAddressReference,
    );

    // 2. 화면 표시용 컨트롤러 1개 (결합값)
    final combinedAddressController = useTextEditingController(
      text: [
        if (value.roadAddress != null && value.roadAddress!.isNotEmpty)
          value.roadAddress,
        if (value.roadAddressReference != null &&
            value.roadAddressReference!.isNotEmpty)
          '(${value.roadAddressReference})',
      ].join(' '),
    );
    final detailAddressController = useTextEditingController(
      text: value.detailAddress,
    );
    final phoneController = useTextEditingController(text: value.phone);
    final emailController = useTextEditingController(text: value.email);

    final isNameEmpty = useState(false);
    final isNumberEmpty = useState(false);
    final isNumberInvalid = useState(false);

    final isHovered = useState(false);

    // 2. 이전에 만든 SupplierAddressDialog 호출 및 파싱부 연동
    void onSearchAddress() async {
      final SupplierAddress? picked = await showDialog<SupplierAddress>(
        context: context,
        builder: (context) => const SupplierAddressDialog(),
      );

      if (!context.mounted || picked == null) return;

      zipcodeController.text = picked.zipcode;

      // 저장용 컨트롤러에 값 할당
      roadAddressController.text = picked.roadAddress;
      roadAddressReferenceController.text = picked.roadAddressReference;

      // 화면 표시용 컨트롤러에 결합값 할당
      combinedAddressController.text =
          '${picked.roadAddress} (${picked.roadAddressReference})'.trim();

      detailAddressController.text = picked.detailAddress ?? '';

      ref
          .read(supplierFormControllerProvider(supplierId: supplierId).notifier)
          .setAddress(
            zipcode: picked.zipcode,
            roadAddress: picked.roadAddress,
            roadAddressReference: picked.roadAddressReference.trim(),
            detailAddress: picked.detailAddress,
          );
    }

    Future<void> processFile() async {
      const XTypeGroup typeGroup = XTypeGroup(
        label: 'images',
        extensions: <String>['jpg', 'jpeg', 'gif', 'png'],
      );

      // 파일 선택 대화상자 오픈
      final XFile? file = await openFile(
        acceptedTypeGroups: <XTypeGroup>[typeGroup],
      );

      if (file != null) {
        final length = await file.length();

        if (length > maxImageSize) {
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.alert,
                  message: Intl.message(
                    'issue_form_file_size_limit',
                    args: [file.name, maxImageSize ~/ (1024 * 1024)],
                  ),
                ),
              );
          return;
        }

        ref
            .read(
              supplierFormControllerProvider(supplierId: supplierId).notifier,
            )
            .addFile(file: file);
      }
    }

    return BaseDialog(
      maxHeight: 520.0,
      contentPadding: EdgeInsets.zero,
      title: supplierId != null && value.name != null
          ? Intl.message('data_supplier_edit_title', args: [value.name!])
          : Intl.message('data_supplier_add'),
      content: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Intl.message('data_supplier_logo'),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                SizedBox(
                  width: 60.0,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Skeleton.unite(
                      child: ElevatedButton(
                        onPressed: () async => await processFile(),
                        child: Icon(Symbols.photo_camera_rounded, fill: 1.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                if (value.file != null)
                  ContentContainer(
                    width: 60.0,
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(8.0),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Stack(
                        children: [
                          // 1. 배경 이미지
                          Positioned.fill(
                            child: Image.memory(value.fileBytes!),
                          ),

                          // 2. 애니메이션 레이어 (배경색 & 아이콘 투명도 오버레이)
                          Positioned.fill(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              // 호버 상태에 따라 배경을 투명에서 불투명 화이트로 부드럽게 변경
                              color: isHovered.value
                                  ? colorScheme.surface.strong
                                  : Colors.transparent,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.easeInOut,
                                // 호버 상태에 따라 아이콘을 서서히 나타나게 처리
                                opacity: isHovered.value ? 1.0 : 0.0,
                                child: Center(
                                  child: Icon(
                                    Symbols.close_rounded,
                                    color: colorScheme.onSurface.strong,
                                    size: 20.0,
                                    weight: 600.0,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // 3. 최상단 인터랙션 레이어 (기본 hoverColor는 투명화)
                          Positioned.fill(
                            child: InkWell(
                              onHover: (hovering) => isHovered.value = hovering,
                              onTap: () {
                                ref
                                    .read(
                                      supplierFormControllerProvider(
                                        supplierId: supplierId,
                                      ).notifier,
                                    )
                                    .removeFile(file: value.file!);
                              },
                              hoverColor: Colors.transparent, // 기본 하이라이트 중복 방지
                              splashColor: Colors.black12,
                              highlightColor: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (value.file == null && value.logo != null)
                  ContentContainer(
                    width: 60.0,
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(8.0),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.network(value.logo!),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24.0),

            // 이름
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Intl.message('data_supplier_column_1'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: Intl.message('data_supplier_name'),
              ),
              onChanged: (value) {
                isNameEmpty.value = false;

                ref
                    .read(
                      supplierFormControllerProvider(
                        supplierId: supplierId,
                      ).notifier,
                    )
                    .setName(name: value);
              },
            ),
            ValidationErrorMessage(
              visible: isNameEmpty.value,
              text: Intl.message('data_supplier_name_empty'),
            ),
            const SizedBox(height: 24.0),

            // 사업자등록번호
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Intl.message('data_supplier_column_2'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                // digitsOnly를 제거하고 커스텀 포맷터만 단독 적용
                BusinessNumberFormatter(),
              ],
              decoration: InputDecoration(
                hintText: Intl.message('data_supplier_number'),
              ),
              onChanged: (value) {
                isNumberEmpty.value = false;
                isNumberInvalid.value = false;

                ref
                    .read(
                      supplierFormControllerProvider(
                        supplierId: supplierId,
                      ).notifier,
                    )
                    .setNumber(number: value);
              },
            ),
            ValidationErrorMessage(
              visible: isNumberEmpty.value,
              text: Intl.message('data_supplier_number_empty'),
            ),
            ValidationErrorMessage(
              visible: isNumberInvalid.value,
              text: Intl.message('data_supplier_number_invalid'),
            ),
            const SizedBox(height: 24.0),

            // 주소 섹션 (우편번호 + 검색 버튼 / 도로명 / 상세주소 3단 구성)
            Text(
              Intl.message('data_supplier_column_3'),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: zipcodeController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: Intl.message('data_supplier_zipcode'),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  flex: 1,
                  child: Skeleton.unite(
                    child: ElevatedButton.icon(
                      onPressed: onSearchAddress,
                      icon: SvgPicture.asset(
                        'assets/icons/search.svg',
                        width: 20.0,
                        height: 20.0,
                        colorFilter: ColorFilter.mode(
                          colorScheme.onSurface.strong,
                          BlendMode.srcIn,
                        ),
                        semanticsLabel: 'Search Icon',
                      ),
                      label: const Text('검색'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: combinedAddressController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: Intl.message('data_supplier_address'),
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: detailAddressController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: Intl.message('data_supplier_detail_address'),
              ),
            ),
            const SizedBox(height: 24.0),

            // 전화번호
            Text(
              Intl.message('data_supplier_column_4'),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              Intl.message('data_supplier_phone_number_only'),
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.strong,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: Intl.message('data_supplier_phone'),
              ),
              inputFormatters: [PhoneNumberFormatter()],
              onChanged: (value) {
                ref
                    .read(
                      supplierFormControllerProvider(
                        supplierId: supplierId,
                      ).notifier,
                    )
                    .setPhone(phone: value);
              },
            ),
            const SizedBox(height: 24.0),

            // 이메일
            Text(
              Intl.message('data_supplier_column_5'),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: Intl.message('data_supplier_email'),
              ),
              onChanged: (value) {
                ref
                    .read(
                      supplierFormControllerProvider(
                        supplierId: supplierId,
                      ).notifier,
                    )
                    .setEmail(email: value);
              },
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
      actions: [
        Skeleton.unite(
          child: ElevatedButton(
            onPressed: () => context.pop(),
            child: Text(Intl.message('common_close')),
          ),
        ),
        Skeleton.unite(
          child: ElevatedButton(
            onPressed: () async {
              isNameEmpty.value = value.name == null || value.name!.isEmpty;
              isNumberEmpty.value =
                  value.number == null || value.number!.isEmpty;

              final businessNumberRegex = RegExp(r'^\d{3}-\d{2}-\d{5}$');

              isNumberInvalid.value =
                  value.number != null &&
                  value.number!.isNotEmpty &&
                  !businessNumberRegex.hasMatch(value.number!);

              if (isNameEmpty.value ||
                  isNumberEmpty.value ||
                  isNumberInvalid.value) {
                LoadingOverlay.hide();
                return;
              }

              if (supplierId == null) {
                await ref
                    .read(supplierSubmitControllerProvider.notifier)
                    .createSupplier();
              } else {
                await ref
                    .read(supplierSubmitControllerProvider.notifier)
                    .updateSupplier(supplierId: supplierId!);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
            ),
            child: Text(
              Intl.message(supplierId != null ? 'common_edit' : 'common_post'),
            ),
          ),
        ),
      ],
    );
  }
}
