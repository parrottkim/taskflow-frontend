import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:url_launcher/url_launcher.dart';

class ProcurementItemWidget extends StatelessWidget {
  final List<ProcurementItem> items;

  const ProcurementItemWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final total =
        items.map((e) => e.totalAmount).fold(0.0, (sum, totalAmountString) {
      String cleanedPrice = totalAmountString.replaceAll(',', '');
      double price = double.tryParse(cleanedPrice) ?? 0.0;

      return sum + price;
    });

    return Padding(
      padding: EdgeInsets.only(bottom: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowHeight: 36.0,
                showCheckboxColumn: false,
                horizontalMargin: 0.0,
                dataRowMinHeight: 34.0,
                dataRowMaxHeight: 34.0,
                showBottomBorder: true,
                border: TableBorder(
                  verticalInside: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                    width: 1.0,
                  ),
                  horizontalInside: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                    width: 1.0,
                  ),
                ),
                columns: [
                  DataColumn(
                    columnWidth: FixedColumnWidth(260.0),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.text_fields_rounded,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_procurement_2'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    columnWidth: FixedColumnWidth(260.0),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.text_fields_rounded,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_procurement_3'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    columnWidth: FixedColumnWidth(80.0),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.numbers_rounded,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_procurement_4'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    columnWidth: FixedColumnWidth(150.0),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.numbers_rounded,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_procurement_5'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    columnWidth: FixedColumnWidth(180.0),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.numbers_rounded,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_procurement_6'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.package_rounded,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_procurement_9'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                rows: List.generate(
                  items.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          width: double.infinity,
                          child: Text(items[index].item),
                        ),
                      ),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          width: double.infinity,
                          child: Text(items[index].spec),
                        ),
                      ),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          width: double.infinity,
                          child: Text(
                            items[index].quantity,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          width: double.infinity,
                          child: Text(
                            '${items[index].unitPrice} ₩',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          width: double.infinity,
                          child: Text(
                            '${items[index].totalAmount} ₩',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: items[index].supplier != null
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color:
                                            items[index].supplier!.logo != null
                                                ? Colors.white
                                                : colorScheme.primary,
                                      ),
                                      child: items[index].supplier!.logo != null
                                          ? Image.network(
                                              items[index].supplier!.logo!,
                                              fit: BoxFit
                                                  .contain, // 이미지가 컨테이너를 꽉 채우도록 설정
                                              errorBuilder: (_, __, ___) =>
                                                  Icon(
                                                Symbols.public_rounded,
                                                size: 20.0,
                                                color: colorScheme.onPrimary,
                                              ),
                                            )
                                          : Icon(
                                              Symbols.public_rounded,
                                              size: 20.0,
                                              color: colorScheme.onPrimary,
                                            ),
                                    ),
                                    SizedBox(width: 4.0),
                                    Text(items[index].supplier!.name),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Symbols.shopping_cart_rounded,
                                      size: 20.0,
                                      color: colorScheme.onSurface
                                          .withValues(alpha: 0.7),
                                    ),
                                    SizedBox(width: 4.0),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: Intl.message(
                                                'issue_form_procurement_7'),
                                          ),
                                          WidgetSpan(
                                            child: SizedBox(width: 4.0),
                                          ),
                                          TextSpan(
                                              text: Intl.message(
                                                  'issue_form_procurement_8'),
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    colorScheme.primary,
                                                fontWeight: FontWeight.w600,
                                                color: colorScheme.primary,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  print(items[index]
                                                      .purchaseUrl!);

                                                  await launchUrl(
                                                    Uri.parse(items[index]
                                                        .purchaseUrl!),
                                                  );
                                                }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                  width: 1.0,
                ),
              ),
              color: colorScheme.surfaceContainer,
            ),
            child: Row(
              children: [
                Text(
                  Intl.message('issue_form_procurement_15'),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${NumberFormat('#,###').format(total)} ₩',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
