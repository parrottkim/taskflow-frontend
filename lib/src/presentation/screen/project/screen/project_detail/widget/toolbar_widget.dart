import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:taskflow/src/shared/tool/responsive.dart';
import 'package:universal_html/html.dart' hide Platform;

class ToolbarWidget extends ConsumerWidget {
  final Project project;

  const ToolbarWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Spacer(),
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInQuad,
            opacity: Responsive.isDesktop(context) ? 1.0 : 0.0,
            child: Text(
              project.createdAt == project.updatedAt
                  ? '${formatRelativeDate(project.createdAt)} ${Intl.message('common_created_at')}'
                  : '${formatRelativeDate(project.updatedAt)} ${Intl.message('common_updated_at')}',
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.outline.withValues(alpha: 0.7),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          CustomIconButton(
            onTap: () async {
              final url = window.location.href;

              if (isDesktopPlatform()) {
                await Clipboard.setData(ClipboardData(text: url));

                ref.read(toastProvider).showToast(
                      child: Toast(
                        type: ToastType.standard,
                        message: Intl.message('common_link_copied'),
                      ),
                    );
              } else {
                SharePlus.instance.share(ShareParams(uri: Uri.parse(url)));
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
              await ref
                  .read(projectDetailControllerProvider(projectId: project.id)
                      .notifier)
                  .toggleBookmark(bookmarked: !project.isBookmarked);
            },
            icon: Icon(
              Symbols.bookmark_rounded,
              fill: project.isBookmarked ? 1.0 : 0.0,
            ),
          ),
          MenuAnchor(
            alignmentOffset: Offset(-140.0, 0.0),
            builder: (context, controller, child) => CustomIconButton(
              onTap: !project.isClosed
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
                          auth is AuthAuthenticated &&
                              auth.user.id == project.user.id
                      ? () {
                          context.goNamed(RouteNames.projectEdit,
                              pathParameters: {
                                'project_id': project.id.toString()
                              });
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
                          auth is AuthAuthenticated &&
                              auth.user.id == project.user.id
                      ? () async {
                          final result = await showDialog(
                            context: context,
                            builder: (_) => DeleteDialog(
                              title:
                                  Intl.message('project_form_delete_dialog_1'),
                              content:
                                  Intl.message('project_form_delete_dialog_2'),
                            ),
                          );

                          if (result) {
                            context.pop();

                            await ref
                                .read(projectDetailControllerProvider(
                                        projectId: project.id)
                                    .notifier)
                                .delete();

                            ref.read(toastProvider).showToast(
                                  child: Toast(
                                    type: ToastType.standard,
                                    message:
                                        Intl.message('project_form_delete'),
                                  ),
                                );
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
                    '${project.user.username} ${Intl.message('common_edit_by')}',
                    style: textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.outline.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  project.createdAt == project.updatedAt
                      ? '${formatRelativeDate(project.createdAt)} ${Intl.message('common_created_at')}'
                      : '${formatRelativeDate(project.updatedAt)} ${Intl.message('common_updated_at')}',
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
      ),
    );
  }
}
