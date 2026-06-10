import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ProcurementRequestItem extends ConsumerWidget {
  final int projectId;
  final List<ProcurementIssueRequest> requests;

  const ProcurementRequestItem({
    super.key,
    required this.projectId,
    required this.requests,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final auth = ref.watch(authControllerProvider);

    if (requests.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  Intl.message('issue_form_procurement_19'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              final requestItems = request.items;
              final supplier = request.supplier;

              final total = requestItems.map((e) => e.totalAmount).fold(0.0, (
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
                        Container(
                          clipBehavior: Clip.hardEdge,
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: supplier.logo != null
                                ? Colors.white
                                : colorScheme.primary,
                          ),
                          child: supplier.logo != null
                              ? Image.network(
                                  supplier.logo!,
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
                        Text(
                          supplier.name,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ContainerWidget(
                      padding: EdgeInsets.only(
                        left: 12.0,
                        right: 24.0,
                        top: 8.0,
                        bottom: 8.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            request.title,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 160.0,
                                child: Row(
                                  children: [
                                    Icon(
                                      Symbols.account_circle_rounded,
                                      size: 18.0,
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                    SizedBox(width: 6.0),
                                    Text(
                                      Intl.message('issue_form_procurement_20'),
                                      style: TextStyle(
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              UserInformation.compact(
                                user: request.requestedBy,
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 160.0,
                                child: Row(
                                  children: [
                                    Icon(
                                      Symbols.shopping_cart_rounded,
                                      size: 18.0,
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                    SizedBox(width: 6.0),
                                    Text(
                                      Intl.message('issue_form_procurement_21'),
                                      style: TextStyle(
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd(
                                  Intl.getCurrentLocale(),
                                ).format(request.orderDate),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 160.0,
                                child: Row(
                                  children: [
                                    Icon(
                                      Symbols.delivery_truck_speed_rounded,
                                      size: 18.0,
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                    SizedBox(width: 6.0),
                                    Text(
                                      Intl.message('issue_form_procurement_22'),
                                      style: TextStyle(
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                request.deliveryDate != null
                                    ? DateFormat.yMMMd(
                                        Intl.getCurrentLocale(),
                                      ).format(request.deliveryDate!)
                                    : Intl.message('issue_form_procurement_23'),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 160.0,
                                child: Row(
                                  children: [
                                    Icon(
                                      Symbols.checkbook_rounded,
                                      size: 18.0,
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                    SizedBox(width: 6.0),
                                    Text(
                                      Intl.message('issue_form_procurement_24'),
                                      style: TextStyle(
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                request.paymentTerms != null
                                    ? request.paymentTerms!
                                    : Intl.message('issue_form_procurement_23'),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 160.0,
                                child: Row(
                                  children: [
                                    Icon(
                                      Symbols.attach_money_rounded,
                                      size: 18.0,
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                    SizedBox(width: 6.0),
                                    Text(
                                      Intl.message(
                                        'issue_form_procurement_requested_1',
                                      ),
                                      style: TextStyle(
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                request.hasFee
                                    ? Symbols.check_box_rounded
                                    : Symbols.check_box_outline_blank_rounded,
                                size: 18.0,
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 160.0,
                                child: Row(
                                  children: [
                                    Icon(
                                      Symbols.sticky_note_2_rounded,
                                      size: 18.0,
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                    SizedBox(width: 6.0),
                                    Text(
                                      Intl.message('common_note'),
                                      style: TextStyle(
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                request.note ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  if (auth is AuthAuthenticated &&
                      (auth.user.department?.root == 1 ||
                          auth.user.department?.root == 3))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton.icon(
                                onPressed:
                                    (request.requiresApproval &&
                                            request.isApproved) ||
                                        !request.requiresApproval
                                    ? () async => await ref
                                          .read(
                                            issueExportControllerProvider
                                                .notifier,
                                          )
                                          .exportPurchaseOrder(
                                            requestId: request.id,
                                          )
                                    : null,
                                icon: Icon(Symbols.print_rounded),
                                label: Text(Intl.message('common_print')),
                              ),
                              if (request.requiresApproval)
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomToggleButton(
                                        value: request.isApproved,
                                        onChanged:
                                            auth.user.position?.id == 1 &&
                                                !request.isApproved
                                            ? (value) async {
                                                if (value != true) return;

                                                await ref
                                                    .read(
                                                      issueListControllerProvider(
                                                        projectId: projectId,
                                                      ).notifier,
                                                    )
                                                    .approveProcurementRequest(
                                                      requestId: request.id,
                                                    );
                                              }
                                            : null,
                                      ),
                                      SizedBox(width: 8.0),
                                      Text(
                                        Intl.message(
                                          'issue_form_procurement_26',
                                        ),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          if (request.requiresApproval)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                Intl.message('issue_form_procurement_27'),
                                style: textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.error,
                                ),
                              ),
                            ),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  SizedBox(
                    width: double.infinity,
                    child: Responsive.isDesktop(context)
                        ? DataTable(
                            headingRowHeight: 36.0,
                            showCheckboxColumn: false,
                            horizontalMargin: 0.0,
                            dataRowMinHeight: 34.0,
                            dataRowMaxHeight: 34.0,
                            showBottomBorder: true,
                            border: TableBorder(
                              verticalInside: BorderSide(
                                color: colorScheme.outline.withValues(
                                  alpha: 0.2,
                                ),
                                width: 1.0,
                              ),
                              horizontalInside: BorderSide(
                                color: colorScheme.outline.withValues(
                                  alpha: 0.2,
                                ),
                                width: 1.0,
                              ),
                              bottom: BorderSide(
                                color: colorScheme.outline.withValues(
                                  alpha: 0.2,
                                ),
                                width: 1.0,
                              ),
                            ),
                            columns: [
                              DataColumn(
                                columnWidth: FlexColumnWidth(0.35),
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Symbols.text_fields_rounded,
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                        size: 16.0,
                                      ),
                                      SizedBox(width: 4.0),
                                      Text(
                                        Intl.message(
                                          'issue_form_procurement_2',
                                        ),
                                        style: textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DataColumn(
                                columnWidth: FlexColumnWidth(0.35),
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Symbols.text_fields_rounded,
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                        size: 16.0,
                                      ),
                                      SizedBox(width: 4.0),
                                      Text(
                                        Intl.message(
                                          'issue_form_procurement_3',
                                        ),
                                        style: textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DataColumn(
                                columnWidth: FlexColumnWidth(0.1),
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Symbols.numbers_rounded,
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                        size: 16.0,
                                      ),
                                      SizedBox(width: 4.0),
                                      Text(
                                        Intl.message(
                                          'issue_form_procurement_4',
                                        ),
                                        style: textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DataColumn(
                                columnWidth: FlexColumnWidth(0.15),
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Symbols.numbers_rounded,
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                        size: 16.0,
                                      ),
                                      SizedBox(width: 4.0),
                                      Text(
                                        Intl.message(
                                          'issue_form_procurement_5',
                                        ),
                                        style: textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DataColumn(
                                columnWidth: FlexColumnWidth(0.15),
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Symbols.numbers_rounded,
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                        size: 16.0,
                                      ),
                                      SizedBox(width: 4.0),
                                      Text(
                                        Intl.message(
                                          'issue_form_procurement_6',
                                        ),
                                        style: textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            rows: List.generate(
                              requestItems.length,
                              (index) => DataRow(
                                cells: [
                                  DataCell(
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 8.0,
                                      ),
                                      width: double.infinity,
                                      child: Text(requestItems[index].item),
                                    ),
                                  ),
                                  DataCell(
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 8.0,
                                      ),
                                      width: double.infinity,
                                      child: Text(requestItems[index].spec),
                                    ),
                                  ),
                                  DataCell(
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 8.0,
                                      ),
                                      width: double.infinity,
                                      child: Text(
                                        requestItems[index].quantity,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 8.0,
                                      ),
                                      width: double.infinity,
                                      child: Text(
                                        '${requestItems[index].unitPrice} ₩',
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 8.0,
                                      ),
                                      width: double.infinity,
                                      child: Text(
                                        '${requestItems[index].totalAmount} ₩',
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            clipBehavior: Clip.none,
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
                                  color: colorScheme.outline.withValues(
                                    alpha: 0.2,
                                  ),
                                  width: 1.0,
                                ),
                                horizontalInside: BorderSide(
                                  color: colorScheme.outline.withValues(
                                    alpha: 0.2,
                                  ),
                                  width: 1.0,
                                ),
                                bottom: BorderSide(
                                  color: colorScheme.outline.withValues(
                                    alpha: 0.2,
                                  ),
                                  width: 1.0,
                                ),
                              ),
                              columns: [
                                DataColumn(
                                  columnWidth: const FixedColumnWidth(200.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.text_fields_rounded,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_2',
                                          ),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  columnWidth: const FixedColumnWidth(200.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.text_fields_rounded,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_3',
                                          ),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  columnWidth: const FixedColumnWidth(80.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.numbers_rounded,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_4',
                                          ),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  columnWidth: const FixedColumnWidth(150.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.numbers_rounded,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_5',
                                          ),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  columnWidth: const FixedColumnWidth(180.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.numbers_rounded,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_6',
                                          ),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.package_rounded,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_9',
                                          ),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              rows: List.generate(requestItems.length, (
                                itemIndex,
                              ) {
                                final row = requestItems[itemIndex];
                                final url = row.purchaseUrl?.trim();
                                final hasUrl =
                                    row.isOnlinePurchase &&
                                    url != null &&
                                    url.isNotEmpty;

                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 8.0,
                                        ),
                                        width: double.infinity,
                                        child: Text(row.item),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 8.0,
                                        ),
                                        width: double.infinity,
                                        child: Text(row.spec),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 8.0,
                                        ),
                                        width: double.infinity,
                                        child: Text(
                                          row.quantity,
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 8.0,
                                        ),
                                        width: double.infinity,
                                        child: Text(
                                          '${row.unitPrice} ₩',
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 8.0,
                                        ),
                                        width: double.infinity,
                                        child: Text(
                                          '${row.totalAmount} ₩',
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: hasUrl
                                            ? Row(
                                                children: [
                                                  Icon(
                                                    Symbols
                                                        .shopping_cart_rounded,
                                                    size: 20.0,
                                                    color: colorScheme.onSurface
                                                        .withValues(alpha: 0.7),
                                                  ),
                                                  const SizedBox(width: 6.0),
                                                  InkWell(
                                                    onTap: () async {
                                                      final uri = Uri.tryParse(
                                                        url,
                                                      );
                                                      if (uri == null) return;
                                                      await launchUrl(uri);
                                                    },
                                                    child: Text(
                                                      Intl.message(
                                                        'issue_form_procurement_8',
                                                      ),
                                                      style: textTheme.bodySmall
                                                          ?.copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            color: colorScheme
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Text(
                                                '-',
                                                style: textTheme.bodySmall,
                                              ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
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
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Text(
                            '${NumberFormat('#,###').format(total)} ₩',
                            textAlign: TextAlign.end,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (_, _) => const SizedBox(height: 24.0),
          ),
        ],
      ),
    );
  }
}
