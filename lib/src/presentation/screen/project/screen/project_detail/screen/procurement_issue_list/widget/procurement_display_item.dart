import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ProcurementDisplayItem extends StatelessWidget {
  final List<ProcurementIssueItem> items;
  final List<ProcurementIssueRequest> requests;

  const ProcurementDisplayItem({
    super.key,
    required this.items,
    required this.requests,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final total = items.map((e) => e.totalAmount).fold(0.0, (
      sum,
      totalAmountString,
    ) {
      final cleanedPrice = totalAmountString.replaceAll(',', '');
      final price = double.tryParse(cleanedPrice) ?? 0.0;

      return sum + price;
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                Intl.message('issue_form_procurement_1'),
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (requests.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    Intl.message('issue_form_procurement_17'),
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.error,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Opacity(
          opacity: requests.isNotEmpty ? 0.4 : 1.0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Responsive.isDesktop(context)
                      ? _DesktopWidget(items: items)
                      : _MobileWidget(items: items),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
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
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Text(
                          '${NumberFormat('#,###').format(total)} ₩',
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final List<ProcurementIssueItem> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DataTable(
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
        _buildHeaderColumn(
          label: Intl.message('issue_form_procurement_2'),
          icon: Symbols.text_fields_rounded,
          textTheme: textTheme,
          colorScheme: colorScheme,
          columnWidth: const FlexColumnWidth(0.3),
        ),
        _buildHeaderColumn(
          label: Intl.message('issue_form_procurement_3'),
          icon: Symbols.text_fields_rounded,
          textTheme: textTheme,
          colorScheme: colorScheme,
          columnWidth: const FlexColumnWidth(0.3),
        ),
        _buildHeaderColumn(
          label: Intl.message('issue_form_procurement_4'),
          icon: Symbols.numbers_rounded,
          textTheme: textTheme,
          colorScheme: colorScheme,
          columnWidth: const FlexColumnWidth(0.1),
        ),
        _buildHeaderColumn(
          label: Intl.message('issue_form_procurement_5'),
          icon: Symbols.numbers_rounded,
          textTheme: textTheme,
          colorScheme: colorScheme,
          columnWidth: const FlexColumnWidth(0.15),
        ),
        _buildHeaderColumn(
          label: Intl.message('issue_form_procurement_6'),
          icon: Symbols.numbers_rounded,
          textTheme: textTheme,
          colorScheme: colorScheme,
          columnWidth: const FlexColumnWidth(0.15),
        ),
        _buildHeaderColumn(
          label: Intl.message('issue_form_procurement_9'),
          icon: Symbols.package_rounded,
          textTheme: textTheme,
          colorScheme: colorScheme,
        ),
        _buildHeaderColumn(
          label: Intl.message('common_note'),
          icon: Symbols.text_fields_rounded,
          textTheme: textTheme,
          colorScheme: colorScheme,
          columnWidth: const FlexColumnWidth(0.3),
        ),
      ],
      rows: List.generate(
        items.length,
        (index) => DataRow(
          cells: [
            _buildTextCell(items[index].item),
            _buildTextCell(items[index].spec),
            _buildTextCell(items[index].quantity, alignEnd: true),
            _buildTextCell('${items[index].unitPrice} ₩', alignEnd: true),
            _buildTextCell('${items[index].totalAmount} ₩', alignEnd: true),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _SupplierCell(item: items[index]),
              ),
            ),
            _buildTextCell(items[index].note ?? ''),
          ],
        ),
      ),
    );
  }
}

class _MobileWidget extends StatelessWidget {
  final List<ProcurementIssueItem> items;

  const _MobileWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
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
          _buildHeaderColumn(
            label: Intl.message('issue_form_procurement_2'),
            icon: Symbols.text_fields_rounded,
            textTheme: textTheme,
            colorScheme: colorScheme,
            columnWidth: const FixedColumnWidth(260.0),
          ),
          _buildHeaderColumn(
            label: Intl.message('issue_form_procurement_3'),
            icon: Symbols.text_fields_rounded,
            textTheme: textTheme,
            colorScheme: colorScheme,
            columnWidth: const FixedColumnWidth(260.0),
          ),
          _buildHeaderColumn(
            label: Intl.message('issue_form_procurement_4'),
            icon: Symbols.numbers_rounded,
            textTheme: textTheme,
            colorScheme: colorScheme,
            columnWidth: const FixedColumnWidth(80.0),
          ),
          _buildHeaderColumn(
            label: Intl.message('issue_form_procurement_5'),
            icon: Symbols.numbers_rounded,
            textTheme: textTheme,
            colorScheme: colorScheme,
            columnWidth: const FixedColumnWidth(160.0),
          ),
          _buildHeaderColumn(
            label: Intl.message('issue_form_procurement_6'),
            icon: Symbols.numbers_rounded,
            textTheme: textTheme,
            colorScheme: colorScheme,
            columnWidth: const FixedColumnWidth(180.0),
          ),
          _buildHeaderColumn(
            label: Intl.message('issue_form_procurement_9'),
            icon: Symbols.package_rounded,
            textTheme: textTheme,
            colorScheme: colorScheme,
          ),
          _buildHeaderColumn(
            label: Intl.message('common_note'),
            icon: Symbols.text_fields_rounded,
            textTheme: textTheme,
            colorScheme: colorScheme,
            columnWidth: const FixedColumnWidth(260.0),
          ),
        ],
        rows: List.generate(
          items.length,
          (index) => DataRow(
            cells: [
              _buildTextCell(items[index].item),
              _buildTextCell(items[index].spec),
              _buildTextCell(items[index].quantity, alignEnd: true),
              _buildTextCell('${items[index].unitPrice} ₩', alignEnd: true),
              _buildTextCell('${items[index].totalAmount} ₩', alignEnd: true),
              DataCell(
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _SupplierCell(item: items[index]),
                ),
              ),
              _buildTextCell(items[index].note ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}

class _SupplierCell extends StatelessWidget {
  final ProcurementIssueItem item;

  const _SupplierCell({required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (item.supplier != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: item.supplier!.logo != null
                  ? Colors.white
                  : colorScheme.primary,
            ),
            child: item.supplier!.logo != null
                ? Image.network(
                    item.supplier!.logo!,
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) => Icon(
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
          const SizedBox(width: 4.0),
          Text(item.supplier!.name),
        ],
      );
    }

    return Row(
      children: [
        Icon(
          Symbols.shopping_cart_rounded,
          size: 20.0,
          color: colorScheme.onSurface.withValues(alpha: 0.7),
        ),
        const SizedBox(width: 4.0),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: Intl.message('issue_form_procurement_7')),
              const WidgetSpan(child: SizedBox(width: 4.0)),
              TextSpan(
                text: Intl.message('issue_form_procurement_8'),
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final url = item.purchaseUrl;
                    if (url == null || url.trim().isEmpty) {
                      return;
                    }

                    await launchUrl(Uri.parse(url));
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

DataColumn _buildHeaderColumn({
  required String label,
  required IconData icon,
  required TextTheme textTheme,
  required ColorScheme colorScheme,
  TableColumnWidth? columnWidth,
}) {
  return DataColumn(
    columnWidth: columnWidth,
    label: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: colorScheme.onSurface.withValues(alpha: 0.7),
            size: 16.0,
          ),
          const SizedBox(width: 4.0),
          Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    ),
  );
}

DataCell _buildTextCell(String text, {bool alignEnd = false}) {
  return DataCell(
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      width: double.infinity,
      child: Text(text, textAlign: alignEnd ? TextAlign.end : TextAlign.start),
    ),
  );
}
