import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/router/router.dart';

class CategoryListWidget extends ConsumerWidget {
  final int projectId;
  final List<IssueCategory> categories;

  const CategoryListWidget({
    super.key,
    required this.projectId,
    required this.categories,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final issueList = ref.watch(
      issueListControllerProvider(projectId: projectId),
    );

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ContentContainer(
        elevation: 1.0,
        padding: EdgeInsets.zero,
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final messages = switch (category) {
              IssueContract() => (
                icon: Intl.message('issue_category_contract_icon'),
                title: Intl.message('issue_category_contract_title'),
                description: Intl.message(
                  'issue_category_contract_description',
                ),
              ),
              IssueKickoff() => (
                icon: Intl.message('issue_category_kickoff_icon'),
                title: Intl.message('issue_category_kickoff_title'),
                description: Intl.message('issue_category_kickoff_description'),
              ),
              IssueApproval() => (
                icon: Intl.message('issue_category_approval_icon'),
                title: Intl.message('issue_category_approval_title'),
                description: Intl.message(
                  'issue_category_approval_description',
                ),
              ),
              IssueProcurement() => (
                icon: Intl.message('issue_category_procurement_icon'),
                title: Intl.message('issue_category_procurement_title'),
                description: Intl.message(
                  'issue_category_procurement_description',
                ),
              ),
              IssueTransaction() => (
                icon: Intl.message('issue_category_transaction_icon'),
                title: Intl.message('issue_category_transaction_title'),
                description: Intl.message(
                  'issue_category_transaction_description',
                ),
              ),
              IssuePayment() => (
                icon: Intl.message('issue_category_payment_icon'),
                title: Intl.message('issue_category_payment_title'),
                description: Intl.message('issue_category_payment_description'),
              ),
              _ => (icon: '', title: category.name, description: ''),
            };

            return InkWell(
              onTap: () {
                if (issueList case AsyncData(:final value)) {
                  if (category is IssueContract && value.contract != null) {
                    ref
                        .read(toastProvider)
                        .showToast(
                          child: Toast(
                            message: Intl.message(
                              'conflict_contract_issue_already_exists',
                            ),
                          ),
                        );
                    return;
                  } else if (category is IssueKickoff &&
                      value.kickoff != null) {
                    ref
                        .read(toastProvider)
                        .showToast(
                          child: Toast(
                            message: Intl.message('kickoff_issue_exists'),
                          ),
                        );
                    return;
                  } else if (category is IssueTransaction &&
                      value.transaction != null) {
                    ref
                        .read(toastProvider)
                        .showToast(
                          child: Toast(
                            message: Intl.message('transaction_issue_exists'),
                          ),
                        );
                    return;
                  } else if (category is IssuePayment &&
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

                ref.read(issueValidationControllerProvider.notifier).reset();
                context.pushNamed(
                  RouteNames.issueNew,
                  pathParameters: {
                    'project_id': projectId.toString(),
                    'category_id': category.id.toString(),
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
                              TextSpan(text: messages.icon),
                              TextSpan(
                                text: messages.title,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Symbols.arrow_right_alt_rounded,
                          size: 20.0,
                          color: colorScheme.onSurface.strong,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      messages.description,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.strong,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, _) => Divider(),
        ),
      ),
    );
  }
}
