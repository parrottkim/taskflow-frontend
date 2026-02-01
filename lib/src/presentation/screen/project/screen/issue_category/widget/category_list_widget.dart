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
  final List<IssueCategory> categories;

  const CategoryListWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final projectId = int.parse(state.pathParameters['project_id']!);
    final issueList = ref.watch(
      issueListControllerProvider(projectId: projectId),
    );

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ContainerWidget(
      elevation: 1.0,
      padding: EdgeInsets.zero,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            if (issueList case AsyncData(:final value)) {
              if (categories[index] is IssueContract &&
                  value.contract != null) {
                ref
                    .read(toastProvider)
                    .showToast(
                      child: Toast(
                        message: Intl.message('contract_issue_exists'),
                      ),
                    );
                return;
              } else if (categories[index] is IssueKickoff &&
                  value.kickoff != null) {
                ref
                    .read(toastProvider)
                    .showToast(
                      child: Toast(
                        message: Intl.message('kickoff_issue_exists'),
                      ),
                    );
                return;
              } else if (categories[index] is IssueTransaction &&
                  value.transaction != null) {
                ref
                    .read(toastProvider)
                    .showToast(
                      child: Toast(
                        message: Intl.message('transaction_issue_exists'),
                      ),
                    );
                return;
              } else if (categories[index] is IssuePayment &&
                  value.payment != null) {
                ref
                    .read(toastProvider)
                    .showToast(
                      child: Toast(
                        message: Intl.message('payment_issue_exists'),
                      ),
                    );
                return;
              }
            }

            context.goNamed(
              RouteNames.issueNew,
              pathParameters: {
                'project_id': projectId.toString(),
                'category_id': categories[index].id.toString(),
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
                            text: Intl.message(
                              'issue_new_choose_${index + 1}_1',
                            ),
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
