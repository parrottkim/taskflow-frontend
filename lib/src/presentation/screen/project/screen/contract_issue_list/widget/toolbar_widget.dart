import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/dialog.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ToolbarWidget extends ConsumerWidget {
  final int projectId;
  final int issueId;
  final int categoryId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  const ToolbarWidget({
    super.key,
    required this.projectId,
    required this.issueId,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);
    final detail =
        ref.watch(projectDetailControllerProvider(projectId: projectId));

    return Row(
      children: [
        AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInQuad,
          opacity: Responsive.isDesktop(context) ? 1.0 : 0.0,
          child: Text(
            createdAt == updatedAt
                ? '${formatRelativeDate(createdAt)} ${Intl.message('common_created_at')}'
                : '${formatRelativeDate(updatedAt)} ${Intl.message('common_updated_at')}',
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.outline.withValues(alpha: 0.7),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        CustomIconButton(
          onTap: () async {
            final path = GoRouter.of(context)
                .routerDelegate
                .currentConfiguration
                .uri
                .path;

            final uri = Uri(
              scheme: Uri.base.scheme,
              host: Uri.base.host,
              port: Uri.base.hasPort ? Uri.base.port : null,
              path: path,
              queryParameters: {
                'view': 'contract',
                'issue': issueId.toString(),
              },
            );

            if (isDesktopPlatform()) {
              Clipboard.setData(ClipboardData(text: uri.toString()));

              ref.read(toastProvider).showToast(
                    child: Toast(
                      type: ToastType.standard,
                      message: Intl.message('common_link_copied'),
                    ),
                  );
            } else {
              SharePlus.instance.share(ShareParams(uri: uri));
            }
          },
          icon: Padding(
            padding: const EdgeInsets.all(2.0),
            child: const Icon(
              Symbols.share_rounded,
              size: 20.0,
              weight: 500.0,
            ),
          ),
        ),
        CustomIconButton(
          onTap: () async {
            showDialog(
              context: context,
              builder: (_) => SendEmailDialog(
                title: Intl.message('project_issue_mail'),
                onPressed: () => ref
                    .read(issueSubmitControllerProvider.notifier)
                    .sendEmail(issueId: issueId),
              ),
            );
          },
          icon: const Icon(
            Symbols.forward_to_inbox_rounded,
          ),
        ),
        MenuAnchor(
          alignmentOffset: Offset(-140.0, 0.0),
          builder: (context, controller, child) => CustomIconButton(
            onTap: detail is AsyncData &&
                    detail.value != null &&
                    !detail.value!.project.isClosed
                ? () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  }
                : null,
            icon: Icon(
              Symbols.more_horiz_rounded,
            ),
          ),
          menuChildren: [
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MenuItemButton(
                onPressed: auth is AuthAuthenticated && auth.user.isAdmin ||
                        auth is AuthAuthenticated && auth.user.id == user.id
                    ? () {
                        context.goNamed(
                          RouteNames.issueEdit,
                          pathParameters: {
                            'category_id': categoryId.toString(),
                            'project_id': projectId.toString(),
                            'issue_id': issueId.toString(),
                          },
                        );
                      }
                    : null,
                style: MenuItemButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 16.0, top: 4.0, bottom: 4.0),
                ),
                leadingIcon: Icon(
                  Symbols.edit_square_rounded,
                  size: 18.0,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 120.0),
                  child: Text(
                    Intl.message('common_edit'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MenuItemButton(
                onPressed: auth is AuthAuthenticated && auth.user.isAdmin ||
                        auth is AuthAuthenticated && auth.user.id == user.id
                    ? () async {
                        final result = await showDialog(
                          context: context,
                          builder: (_) => DeleteDialog(
                            title: Intl.message('issue_form_delete_dialog_1'),
                            content: Intl.message('issue_form_delete_dialog_2'),
                          ),
                        );

                        if (result) {
                          await ref
                              .read(issueSubmitControllerProvider.notifier)
                              .deleteIssue(
                                  projectId: projectId, issueId: issueId);
                        }
                      }
                    : null,
                style: MenuItemButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 16.0, top: 4.0, bottom: 4.0),
                ),
                leadingIcon: Icon(
                  Symbols.delete_rounded,
                  size: 18.0,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 120.0),
                  child: Text(
                    Intl.message('common_delete'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),
            if (auth is AuthAuthenticated)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  '${user.username} ${Intl.message('common_edit_by')}',
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.outline.withValues(alpha: 0.7),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                createdAt == updatedAt
                    ? '${formatRelativeDate(createdAt)} ${Intl.message('common_created_at')}'
                    : '${formatRelativeDate(updatedAt)} ${Intl.message('common_updated_at')}',
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.outline.withValues(alpha: 0.7),
                ),
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ],
    );
  }
}
