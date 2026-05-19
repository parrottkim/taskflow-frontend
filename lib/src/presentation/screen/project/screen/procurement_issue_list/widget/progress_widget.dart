import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class ProgressWidget extends ConsumerWidget {
  final int projectId;
  final int issueId;
  final List<ProcurementIssueItem> items;
  final List<ProcurementIssueRequest> requests;

  const ProgressWidget({
    super.key,
    required this.projectId,
    required this.issueId,
    required this.items,
    required this.requests,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);

    final targetSupplierIds = items
        .map((item) => item.supplier)
        .whereType<Supplier>()
        .where((supplier) => supplier.id != 47)
        .map((supplier) => supplier.id)
        .toSet();

    final requestedSupplierIds = requests
        .map((request) => request.supplier.id)
        .toSet();

    final isAllRequested =
        targetSupplierIds.isNotEmpty &&
        targetSupplierIds.difference(requestedSupplierIds).isEmpty;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isAllRequested)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton.unite(
                  child: ElevatedButton.icon(
                    onPressed: auth is AuthAuthenticated && auth.user.isAdmin
                        ? () {
                            context.goNamed(
                              RouteNames.issueProcurementRequest,
                              pathParameters: {
                                'project_id': projectId.toString(),
                                'issue_id': issueId.toString(),
                              },
                            );
                          }
                        : null,
                    icon: Icon(Symbols.shopping_cart_rounded),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Intl.message('issue_form_procurement_idle')),
                        SizedBox(width: 8.0),
                        Icon(Symbols.chevron_right_rounded),
                      ],
                    ),
                  ),
                ),
                if (auth is AuthAuthenticated && !auth.user.isAdmin)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      Intl.message('issue_form_procurement_25'),
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.error,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        if (isAllRequested)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ContainerWidget(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              borderRadius: BorderRadius.circular(8.0),
              borderColor: colorScheme.outline.withValues(alpha: 0.2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Symbols.assignment_turned_in_rounded,
                    size: 18.0,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  SizedBox(width: 8.0),
                  Text(Intl.message('issue_form_procurement_requested')),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
