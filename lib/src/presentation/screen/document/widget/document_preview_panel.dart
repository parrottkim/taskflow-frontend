import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class DocumentPreviewPanel extends HookConsumerWidget {
  final Document document;
  final VoidCallback onClose;
  final bool fullScreen;

  const DocumentPreviewPanel({
    super.key,
    required this.document,
    required this.onClose,
    this.fullScreen = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);

    final isHovered = useState(false);
    final isAttachmentHistoryExpanded = useState(false);
    final attachmentHistoryOpacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );
    final attachmentHistorySizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );
    final isUpdated = document.createdAt != document.updatedAt;
    final date = isUpdated ? document.updatedAt : document.createdAt;
    final dateLabel = Intl.message(
      isUpdated ? 'common_updated_at' : 'common_created_at',
    );
    final fullDate =
        '${DateFormat.yMEd(Localizations.localeOf(context).languageCode).format(date)} $dateLabel';
    final relativeDate = '${formatRelativeDate(date)} $dateLabel';
    final attachments = document.attachments;
    final latestAttachment = attachments.isEmpty ? null : attachments.first;
    final attachmentHistory = attachments.skip(1).toList();

    useEffect(() {
      isAttachmentHistoryExpanded.value = false;
      attachmentHistoryOpacityController.value = 0.0;
      attachmentHistorySizeController.value = 0.0;
      return null;
    }, [document.id]);

    void toggleAttachmentHistory() {
      isAttachmentHistoryExpanded.value = !isAttachmentHistoryExpanded.value;

      if (isAttachmentHistoryExpanded.value) {
        attachmentHistorySizeController.forward().then((_) {
          attachmentHistoryOpacityController.forward();
        });
      } else {
        attachmentHistoryOpacityController.reverse().then((_) {
          attachmentHistorySizeController.reverse();
        });
      }
    }

    return ContainerWidget(
      elevation: fullScreen ? 0.0 : 1.0,
      padding: EdgeInsets.zero,
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(fullScreen ? 0.0 : 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: fullScreen
              ? null
              : Border(
                  left: BorderSide(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.7),
                  ),
                ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  if (!fullScreen)
                    CustomIconButton(
                      onTap: onClose,
                      size: 20.0,
                      weight: 300.0,
                      color: colorScheme.outline,
                      icon: Icon(Symbols.right_panel_close_rounded),
                    ),
                  Spacer(),
                  CustomIconButton(
                    onTap: () async {
                      final location = GoRouter.of(context).namedLocation(
                        RouteNames.documentDetail,
                        pathParameters: {'document_id': document.id.toString()},
                      );
                      final uri = Uri.base.resolve(location);

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
                    padding: 2.0,
                    size: 16.0,
                    opticalSize: 16.0,
                    grade: -25.0,
                    weight: 600.0,
                    icon: const Icon(Symbols.share_rounded),
                  ),
                  CustomIconButton(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (_) => SendEmailDialog(
                          title: Intl.message('document_mail'),
                          onPressed: (users, isAllSelected) => ref
                              .read(documentSubmitControllerProvider.notifier)
                              .sendEmail(
                                documentId: document.id,
                                users: users,
                                isAllSelected: isAllSelected,
                              ),
                        ),
                      );
                    },
                    padding: 2.0,
                    size: 20.0,
                    opticalSize: 20.0,
                    icon: const Icon(Symbols.forward_to_inbox_rounded),
                  ),
                  MenuAnchor(
                    alignmentOffset: Offset(-140.0, 0.0),
                    builder: (context, controller, child) => CustomIconButton(
                      onTap: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      },
                      padding: 2.0,
                      size: 20.0,
                      opticalSize: 20.0,
                      icon: const Icon(Symbols.more_vert_rounded),
                    ),
                    menuChildren: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: MenuItemButton(
                          onPressed:
                              auth is AuthAuthenticated && auth.user.isAdmin ||
                                  auth is AuthAuthenticated &&
                                      auth.user.id == document.createdBy.id
                              ? () {
                                  context.pushNamed(
                                    RouteNames.documentEdit,
                                    pathParameters: {
                                      'document_id': document.id.toString(),
                                    },
                                    queryParameters: context
                                        .buildQueryParameters(
                                          updates: const {},
                                        ),
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
                          leadingIcon: Icon(
                            Symbols.edit_square_rounded,
                            size: 18.0,
                          ),
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
                                      auth.user.id == document.createdBy.id
                              ? () async {
                                  final result = await showDialog(
                                    context: context,
                                    builder: (_) => DeleteDialog(
                                      title: Intl.message(
                                        'document_delete_dialog_1',
                                      ),
                                      content: Intl.message(
                                        'document_delete_dialog_2',
                                      ),
                                    ),
                                  );

                                  if (result) {
                                    await ref
                                        .read(
                                          documentSubmitControllerProvider
                                              .notifier,
                                        )
                                        .deleteDocument(
                                          documentId: document.id,
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
                          '${document.updatedBy?.username ?? document.createdBy.username} ${Intl.message('common_edit_by')}',
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.outline.withValues(alpha: 0.7),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          relativeDate,
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.outline.withValues(alpha: 0.7),
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
                          '${Intl.message('common_view')} ${document.views}',
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.outline.withValues(alpha: 0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 16.0, 12.0),
              child: Row(
                children: [
                  if (document.fixed) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: colorScheme.error.withValues(alpha: 0.12),
                      ),
                      child: Text(
                        Intl.message('document_fixed'),
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.error,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                  ],
                  Expanded(
                    child: Text(
                      document.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _UserRow(
                    icon: Symbols.account_circle_rounded,
                    label: Intl.message('document_created_by'),
                    user: document.createdBy,
                  ),
                  if (document.updatedBy case final user?)
                    _UserRow(
                      icon: Symbols.update_rounded,
                      label: Intl.message('document_updated_by'),
                      user: user,
                    ),
                  const SizedBox(height: 6.0),
                  MouseRegion(
                    onEnter: (_) => isHovered.value = true,
                    onExit: (_) => isHovered.value = false,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 400),
                          opacity: isHovered.value ? 1.0 : 0.0,
                          child: Text(fullDate, style: textTheme.bodySmall),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 400),
                          opacity: isHovered.value ? 0.0 : 1.0,
                          child: Text(
                            relativeDate,
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (latestAttachment != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Text(
                          Intl.message('document_attachment'),
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        if (attachmentHistory.isNotEmpty)
                          TextButton.icon(
                            onPressed: toggleAttachmentHistory,
                            iconAlignment: IconAlignment.end,
                            icon: Icon(
                              isAttachmentHistoryExpanded.value
                                  ? Symbols.keyboard_arrow_up_rounded
                                  : Symbols.keyboard_arrow_down_rounded,
                              size: 18.0,
                            ),
                            label: Text(
                              Intl.message('document_attachment_history'),
                            ),
                          ),
                      ],
                    ),
                    AttachmentListWidget<DocumentAttachment>(
                      attachments: [latestAttachment],
                      padding: EdgeInsets.only(top: 8.0),
                    ),
                    if (attachmentHistory.isNotEmpty)
                      SizeTransition(
                        sizeFactor: CurvedAnimation(
                          parent: attachmentHistorySizeController,
                          curve: Curves.easeInQuad,
                        ),
                        child: FadeTransition(
                          opacity: attachmentHistoryOpacityController,
                          child: AttachmentListWidget<DocumentAttachment>(
                            attachments: attachmentHistory,
                            padding: EdgeInsets.only(top: 8.0),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 20.0),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (document.content.trim().isEmpty)
                      Center(
                        child: Text(
                          Intl.message('document_no_item'),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.5),
                          ),
                        ),
                      )
                    else
                      MarkdownWidget(item: document.content),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final User user;

  const _UserRow({required this.icon, required this.label, required this.user});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.7);

    return SizedBox(
      height: 32.0,
      child: Row(
        children: [
          SizedBox(
            width: 120.0,
            child: Row(
              children: [
                Icon(icon, size: 18.0, color: color),
                const SizedBox(width: 6.0),
                Text(label, style: TextStyle(color: color)),
              ],
            ),
          ),
          UserInformation.compact(user: user),
        ],
      ),
    );
  }
}
