import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/core/core.dart';

class CategoryListWidget extends ConsumerWidget {
  final int projectId;
  final List<IssueCategory> categoryItems;

  const CategoryListWidget({
    super.key,
    required this.projectId,
    required this.categoryItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ContainerWidget(
      padding: EdgeInsets.zero,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: categoryItems.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () async {
            final list = await ref
                .read(issueListControllerProvider(projectId: projectId).future);

            if (categoryItems[index] is IssueContract &&
                list.contract != null) {
              ref.read(toastProvider).showToast(
                    child: Toast(
                      message: Intl.message('contract_issue_exists'),
                    ),
                  );
              return;
            } else if (categoryItems[index] is IssueKickoff &&
                list.kickoff != null) {
              ref.read(toastProvider).showToast(
                    child: Toast(
                      message: Intl.message('kickoff_issue_exists'),
                    ),
                  );
              return;
            } else if (categoryItems[index] is IssueTransaction &&
                list.transaction != null) {
              ref.read(toastProvider).showToast(
                    child: Toast(
                      message: Intl.message('transaction_issue_exists'),
                    ),
                  );
              return;
            } else if (categoryItems[index] is IssuePayment &&
                list.payment != null) {
              ref.read(toastProvider).showToast(
                    child: Toast(
                      message: Intl.message('payment_issue_exists'),
                    ),
                  );
              return;
            }

            // ref
            //     .read(
            //         issueFormControllerProvider(projectId: projectId, categoryId: ).notifier)
            //     .setCategory(category: categoryItems[index]);
            context.goNamed(
              RouteNames.issueNew,
              pathParameters: {
                'category_id': categoryItems[index].id.toString(),
                'project_id': projectId.toString(),
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text.rich(
                      style: textTheme.titleMedium,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: Intl.message('issue_new_choose_${index + 1}'),
                          ),
                          TextSpan(
                            text:
                                Intl.message('issue_new_choose_${index + 1}_1'),
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Symbols.arrow_right_alt_rounded,
                      size: 20.0,
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Text(
                  Intl.message('issue_new_choose_${index + 1}_2'),
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (_, __) => Divider(),
      ),
    );
  }
}
