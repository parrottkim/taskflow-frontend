import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SupplierAddressDialog extends HookConsumerWidget {
  const SupplierAddressDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // 1단계 검색 관련 상태 및 컨트롤러
    final address = ref.watch(addressControllerProvider);
    final searchController = useTextEditingController();

    // 2단계 상세 주소 관련 상태 및 컨트롤러
    final detailController = useTextEditingController();
    final isDetailNotRequired = useState<bool>(false);

    // 핵심 상태: 선택된 주소 아이템 (null이면 1단계 검색창, 값이 있으면 2단계 상세입력창)
    final selectedItem = useState<Address?>(null);

    // 2단계 완료 버튼 활성화 조건
    final isTextEmpty = useValueListenable(
      detailController,
    ).text.trim().isEmpty;
    final canConfirm = isDetailNotRequired.value || !isTextEmpty;

    // 최종 확인 완료 처리
    void onConfirm() {
      final item = selectedItem.value;
      if (item == null) return;

      final inputDetail = detailController.text.trim();

      // ⭐️ bdNm이 비어있지 않으면 'emdNm bdNm', 비어있으면 'emdNm'
      // 괄호 안에 공백 문자가 한 칸 들어가도록 구성했습니다.
      final roadAddressReference = item.bdNm.isNotEmpty
          ? '${item.emdNm}, ${item.bdNm}'
          : item.emdNm;

      context.pop(
        SupplierAddress(
          zipcode: item.zipNo,
          roadAddress: item.roadAddrPart1,
          roadAddressReference: roadAddressReference,
          detailAddress: inputDetail.isEmpty ? null : inputDetail,
        ),
      );
    }

    // ==========================================
    // [공통 레이아웃] 2단계: 상세 주소 입력 UI
    // ==========================================
    if (selectedItem.value != null) {
      final item = selectedItem.value!;
      final roadAddressReference = item.bdNm.isNotEmpty
          ? '${item.emdNm}, ${item.bdNm}'
          : item.emdNm;

      return BaseDialog(
        title: '상세 주소 입력',
        maxWidth: 460.0,
        showDivider: true,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.4,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '[${item.zipNo}]',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '${item.roadAddrPart1} ($roadAddressReference)',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    item.jibunAddr,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              Intl.message('data_address_detail_content'),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: detailController,
              autofocus: !isDetailNotRequired.value,
              enabled: !isDetailNotRequired.value,
              decoration: InputDecoration(
                hintText: Intl.message('data_address_detail_title'),
              ),
              onSubmitted: (_) => onConfirm(),
            ),
            const SizedBox(height: 12.0),
            CustomToggleButton(
              value: isDetailNotRequired.value,
              onChanged: (val) {
                isDetailNotRequired.value = val ?? false;
                if (isDetailNotRequired.value) {
                  detailController.clear();
                }
              },
              child: Text(
                Intl.message('data_address_detail_not_required'),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        actions: [
          // 뒤로가기 버튼: Navigator를 건드리지 않고 내부 상태만 null로 돌림
          ElevatedButton(
            onPressed: () {
              selectedItem.value = null;
              detailController.clear();
              isDetailNotRequired.value = false;
            },
            child: Text(Intl.message('common_cancel')),
          ),
          ElevatedButton(
            onPressed: canConfirm ? onConfirm : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: canConfirm ? colorScheme.primary : null,
              foregroundColor: canConfirm ? colorScheme.onPrimary : null,
            ),
            child: Text(Intl.message('common_apply')),
          ),
        ],
      );
    }

    // ==========================================
    // [공통 레이아웃] 1단계: 주소 검색 UI
    // ==========================================
    return Dialog(
      child: ContainerWidget(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(8.0),
        constraints: const BoxConstraints(maxWidth: 520.0, maxHeight: 640.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              autofocus: true,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: Intl.message('data_address_search'),
                contentPadding: const EdgeInsets.fromLTRB(
                  12.0,
                  18.0,
                  12.0,
                  14.0,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 2.0),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 20.0,
                    height: 20.0,
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSurface.withValues(alpha: 0.7),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              onSubmitted: (_) => ref
                  .read(addressControllerProvider.notifier)
                  .search(search: searchController.text),
            ),
            const Divider(height: 1.0),
            Expanded(
              child: _AddressListView(
                search: address.search,
                items: address.items,
                total: address.total,
                isLoading: address.isLoading,
                onLoadMore: () =>
                    ref.read(addressControllerProvider.notifier).load(),
                onSelected: (item) => selectedItem.value = item,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressListView extends StatelessWidget {
  final String search;
  final List<Address> items;
  final int total;
  final bool isLoading;
  final VoidCallback onLoadMore;
  final ValueChanged<Address> onSelected;

  const _AddressListView({
    required this.search,
    required this.items,
    required this.total,
    required this.isLoading,
    required this.onLoadMore,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (search.isEmpty) {
      return Center(
        child: Text(
          Intl.message('data_address_search_idle'),
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      );
    }

    if (items.isEmpty) {
      return Center(
        child: Text(
          Intl.message('data_address_search_empty'),
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      );
    }

    final hasMore = items.length < total;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: hasMore ? items.length + 1 : items.length,
      separatorBuilder: (_, _) => const Divider(height: 1.0),
      itemBuilder: (context, index) {
        if (index == items.length) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: isLoading ? null : onLoadMore,
              child: isLoading
                  ? const SizedBox(
                      width: 16.0,
                      height: 16.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0),
                    )
                  : Text(Intl.message('data_address_more')),
            ),
          );
        }

        final item = items[index];

        // 리스트 내부 항목용 참고명칭 바인딩
        final roadAddressReference = item.bdNm.isNotEmpty
            ? '${item.emdNm}, ${item.bdNm}'
            : item.emdNm;

        return ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 6.0,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '[${item.zipNo}]',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                '${item.roadAddrPart1} ($roadAddressReference)',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              item.jibunAddr,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ),
          onTap: () => onSelected(item),
        );
      },
    );
  }
}
