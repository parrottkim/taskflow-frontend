import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ToolbarWidget extends HookConsumerWidget {
  final int projectId;
  final Report item;

  const ToolbarWidget({super.key, required this.projectId, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);

    final isHovered = useState(false);

    final fullDate = item.createdAt == item.updatedAt
        ? '${DateFormat.yMEd(Localizations.localeOf(context).languageCode).format(item.createdAt)} ${Intl.message('common_created_at')}'
        : '${DateFormat.yMEd(Localizations.localeOf(context).languageCode).format(item.updatedAt)} ${Intl.message('common_updated_at')}';

    final relativeDate = item.createdAt == item.updatedAt
        ? '${formatRelativeDate(item.createdAt)} ${Intl.message('common_created_at')}'
        : '${formatRelativeDate(item.updatedAt)} ${Intl.message('common_updated_at')}';

    return Row(
      children: [
        MouseRegion(
          onEnter: (event) => isHovered.value = true,
          onExit: (event) => isHovered.value = false,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: isHovered.value ? 1.0 : 0.0,
                child: Text(
                  fullDate,
                  textAlign: TextAlign.right,
                  style: textTheme.bodySmall,
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: isHovered.value ? 0.0 : 1.0,
                child: Text(
                  relativeDate,
                  textAlign: TextAlign.right,
                  style: textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8.0),
        AppIconButton(
          onTap: () async {
            final path = GoRouter.of(
              context,
            ).routerDelegate.currentConfiguration.uri.path;

            final uri = Uri(
              scheme: Uri.base.scheme,
              host: Uri.base.host,
              port: Uri.base.hasPort ? Uri.base.port : null,
              path: path,
              queryParameters: {'view': 'report', 'report': item.id.toString()},
            );

            if (isDesktopPlatform()) {
              Clipboard.setData(ClipboardData(text: uri.toString()));

              ref
                  .read(toastProvider)
                  .showToast(
                    child: Toast(
                      type: ToastType.standard,
                      message: Intl.message('common_link_copied'),
                    ),
                  );
            } else {
              SharePlus.instance.share(ShareParams(uri: uri));
            }
          },
          size: 20.0,
          opticalSize: 20.0,
          grade: -25.0,
          weight: 600.0,
          icon: const Icon(Symbols.share_rounded),
        ),
        AppIconButton(
          onTap: () async {
            showDialog(
              context: context,
              builder: (_) => SendEmailDialog(
                title: Intl.message('project_report_mail'),
                onPressed: (users, isAllSelected) => ref
                    .read(reportSubmitControllerProvider.notifier)
                    .sendEmail(
                      reportId: item.id,
                      users: users,
                      isAllSelected: isAllSelected,
                    ),
              ),
            );
          },
          icon: const Icon(Symbols.forward_to_inbox_rounded),
        ),
        MenuAnchor(
          alignmentOffset: Offset(-140.0, 0.0),
          builder: (context, controller, child) => AppIconButton(
            onTap: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            icon: Icon(Symbols.more_vert_rounded, opticalSize: 20.0),
          ),
          menuChildren: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MenuItemButton(
                onPressed:
                    auth is AuthAuthenticated && auth.user.isAdmin ||
                        auth is AuthAuthenticated &&
                            auth.user.id == item.createdBy.id
                    ? () {
                        context.pushNamed(
                          RouteNames.reportEdit,
                          pathParameters: {
                            'project_id': projectId.toString(),
                            'report_id': item.id.toString(),
                          },
                        );
                      }
                    : null,
                style: MenuItemButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 16.0,
                    top: 4.0,
                    bottom: 4.0,
                  ),
                ),
                leadingIcon: Icon(Symbols.edit_square_rounded, size: 18.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 120.0),
                  child: Text(Intl.message('common_edit')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MenuItemButton(
                onPressed:
                    auth is AuthAuthenticated && auth.user.isAdmin ||
                        auth is AuthAuthenticated &&
                            auth.user.id == item.createdBy.id
                    ? () async {
                        final result = await showDialog(
                          context: context,
                          builder: (_) => DeleteDialog(
                            title: Intl.message('report_form_delete_dialog_1'),
                            content: Intl.message(
                              'report_form_delete_dialog_2',
                            ),
                          ),
                        );

                        if (result) {
                          await ref
                              .read(reportSubmitControllerProvider.notifier)
                              .deleteReport(
                                projectId: projectId,
                                reportId: item.id,
                              );
                        }
                      }
                    : null,
                style: MenuItemButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 16.0,
                    top: 4.0,
                    bottom: 4.0,
                  ),
                ),
                leadingIcon: Icon(Symbols.delete_rounded, size: 18.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 120.0),
                  child: Text(Intl.message('common_delete')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                '${item.updatedBy?.username ?? item.updatedBy?.username} ${Intl.message('common_edit_by')}',
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.outline.strong,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                item.createdAt == item.updatedAt
                    ? '${formatRelativeDate(item.createdAt)} ${Intl.message('common_created_at')}'
                    : '${formatRelativeDate(item.updatedAt)} ${Intl.message('common_updated_at')}',
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.outline.strong,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
