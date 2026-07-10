import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class DocumentPreviewPanel extends HookWidget {
  final Document document;
  final VoidCallback onClose;

  const DocumentPreviewPanel({
    super.key,
    required this.document,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isHovered = useState(false);
    final isUpdated = document.createdAt != document.updatedAt;
    final date = isUpdated ? document.updatedAt : document.createdAt;
    final dateLabel = Intl.message(
      isUpdated ? 'common_updated_at' : 'common_created_at',
    );
    final fullDate =
        '${DateFormat.yMEd(Localizations.localeOf(context).languageCode).format(date)} $dateLabel';
    final relativeDate = '${formatRelativeDate(date)} $dateLabel';

    return ContainerWidget(
      elevation: 1.0,
      padding: EdgeInsets.zero,
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: colorScheme.outlineVariant.withValues(alpha: 0.7),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 16.0, 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
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
                  const SizedBox(width: 8.0),
                  ElevatedIconButton(
                    onTap: () => context.pushNamed(
                      RouteNames.documentEdit,
                      pathParameters: {'document_id': document.id.toString()},
                      queryParameters: GoRouterState.of(
                        context,
                      ).uri.queryParameters,
                    ),
                    padding: EdgeInsets.all(4.0),
                    borderRadius: BorderRadius.circular(4.0),
                    icon: Symbols.edit_rounded,
                    size: 18.0,
                  ),
                  const SizedBox(width: 4.0),
                  ElevatedIconButton(
                    onTap: onClose,
                    padding: EdgeInsets.all(4.0),
                    borderRadius: BorderRadius.circular(4.0),
                    icon: Symbols.close_rounded,
                    size: 18.0,
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
            if (document.attachments.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      Intl.message('document_attachment'),
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    AttachmentListWidget<DocumentAttachment>(
                      attachments: document.attachments,
                      padding: EdgeInsets.only(top: 8.0),
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
