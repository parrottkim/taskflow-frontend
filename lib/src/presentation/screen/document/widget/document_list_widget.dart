import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/document/widget/document_preview_panel.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class DocumentListWidget extends ConsumerWidget {
  final int? selectedDocumentId;

  const DocumentListWidget({super.key, this.selectedDocumentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(documentListControllerProvider);

    return switch (list) {
      AsyncData(:final value) => _DesktopWidget(
        items: value.items,
        selectedDocumentId: selectedDocumentId,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          items: [
            ...List.filled(5, Document.dummy().copyWith(fixed: true)),
            ...List.filled(20, Document.dummy()),
          ],
          selectedDocumentId: selectedDocumentId,
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final List<Document> items;
  final int? selectedDocumentId;

  const _DesktopWidget({required this.items, this.selectedDocumentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final filter =
        ref.watch(documentFilterControllerProvider).value ??
        DocumentFilterState();
    final selectedDocument = useState<Document?>(null);
    final previewDocument = useState<Document?>(null);
    final previewController = useAnimationController(
      duration: const Duration(milliseconds: 250),
    );
    final previewAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: previewController,
            curve: Curves.easeOutCubic,
          ),
        );

    final fixedItems = items.where((document) => document.fixed).toList();
    final normalItems = items.where((document) => !document.fixed).toList();

    void openPreview(Document document) {
      previewDocument.value = document;
      selectedDocument.value = document;
      previewController.forward();

      if (selectedDocumentId != document.id) {
        context.goNamed(
          RouteNames.document,
          queryParameters: {
            'folder_id': filter.folderId.toString(),
            'sort': filter.sort.key,
            'order': filter.order.key,
            if (filter.search != null) 'search': filter.search,
            'document_id': document.id.toString(),
          },
        );
      }
    }

    void closePreview() {
      selectedDocument.value = null;
      previewController.reverse();

      if (selectedDocumentId != null) {
        context.goNamed(
          RouteNames.document,
          queryParameters: {
            'folder_id': filter.folderId.toString(),
            'sort': filter.sort.key,
            'order': filter.order.key,
            if (filter.search != null) 'search': filter.search,
          },
        );
      }
    }

    useEffect(() {
      void clearClosedPreview(AnimationStatus status) {
        if (status == AnimationStatus.dismissed &&
            selectedDocument.value == null) {
          previewDocument.value = null;
        }
      }

      previewController.addStatusListener(clearClosedPreview);
      return () => previewController.removeStatusListener(clearClosedPreview);
    }, [previewController]);

    useEffect(() {
      Document? selected;
      for (final document in items) {
        if (document.id == selectedDocumentId) {
          selected = document;
          break;
        }
      }

      if (selected != null && selectedDocument.value?.id != selected.id) {
        previewDocument.value = selected;
        selectedDocument.value = selected;
        previewController.forward();
      }

      return null;
    }, [items, selectedDocumentId]);

    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final panelWidth = constraints.maxWidth < 560.0
              ? constraints.maxWidth
              : 460.0;

          return Stack(
            children: [
              ContainerWidget(
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Skeleton.keep(child: const _DocumentTableColumns()),
                    Divider(),
                    if (items.isEmpty)
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/empty.svg',
                                width: 40.0,
                                height: 40.0,
                                colorFilter: ColorFilter.mode(
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(Intl.message('document_no_item')),
                            ],
                          ),
                        ),
                      )
                    else ...[
                      if (fixedItems.isNotEmpty) ...[
                        _DocumentTableRows(
                          items: fixedItems,
                          selectedDocumentId: selectedDocument.value?.id,
                          onSelectDocument: (document) {
                            openPreview(document);
                          },
                        ),
                        if (normalItems.isNotEmpty) Divider(),
                      ],
                      Expanded(
                        child: normalItems.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/empty.svg',
                                      width: 40.0,
                                      height: 40.0,
                                      colorFilter: ColorFilter.mode(
                                        colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(Intl.message('document_no_item')),
                                  ],
                                ),
                              )
                            : _DocumentTableRows(
                                items: normalItems,
                                selectedDocumentId: selectedDocument.value?.id,
                                onSelectDocument: (document) {
                                  openPreview(document);
                                },
                              ),
                      ),
                    ],
                  ],
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: selectedDocument.value == null,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ClipRect(
                      child: SlideTransition(
                        position: previewAnimation,
                        child: SizedBox(
                          width: panelWidth,
                          height: double.infinity,
                          child: previewDocument.value == null
                              ? const SizedBox.shrink()
                              : DocumentPreviewPanel(
                                  document: previewDocument.value!,
                                  onClose: closePreview,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DocumentTableColumns extends StatelessWidget {
  const _DocumentTableColumns();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Text label(String message) {
      return Text(
        message,
        style: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      );
    }

    return DataTable(
      headingRowHeight: 48.0,
      showCheckboxColumn: false,
      columns: [
        DataColumn(
          columnWidth: FlexColumnWidth(2.5),
          label: label(Intl.message('document_column_1')),
        ),
        DataColumn(
          columnWidth: FlexColumnWidth(),
          label: label(Intl.message('document_column_2')),
        ),
        DataColumn(
          columnWidth: FixedColumnWidth(120.0),
          label: label(Intl.message('document_column_3')),
        ),
        DataColumn(
          columnWidth: FixedColumnWidth(200.0),
          label: label(Intl.message('document_column_4')),
        ),
        DataColumn(
          columnWidth: FixedColumnWidth(100.0),
          label: label(Intl.message('document_column_5')),
        ),
      ],
      rows: const [],
    );
  }
}

class _DocumentTableRows extends HookConsumerWidget {
  final List<Document> items;
  final int? selectedDocumentId;
  final ValueChanged<Document> onSelectDocument;

  const _DocumentTableRows({
    required this.items,
    required this.selectedDocumentId,
    required this.onSelectDocument,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);
    final hoveredDocumentId = useState<int?>(null);

    WidgetStateProperty<Color?>? fixedRowColor(Document item) {
      if (!item.fixed) {
        return null;
      }

      if (selectedDocumentId == item.id) {
        return WidgetStatePropertyAll(colorScheme.surfaceContainerHighest);
      }

      if (hoveredDocumentId.value == item.id) {
        return WidgetStatePropertyAll(colorScheme.surfaceContainerHigh);
      }

      return WidgetStatePropertyAll(colorScheme.surfaceContainerLow);
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 20.0) {
          ref.read(documentListControllerProvider.notifier).load();
        }
        return false;
      },
      child: SingleChildScrollView(
        child: DataTable(
          headingRowHeight: 0.0,
          showCheckboxColumn: false,
          columns: const [
            DataColumn(columnWidth: FlexColumnWidth(2.5), label: SizedBox()),
            DataColumn(columnWidth: FlexColumnWidth(), label: SizedBox()),
            DataColumn(columnWidth: FixedColumnWidth(120.0), label: SizedBox()),
            DataColumn(columnWidth: FixedColumnWidth(200.0), label: SizedBox()),
            DataColumn(columnWidth: FixedColumnWidth(100.0), label: SizedBox()),
          ],
          rows: [
            for (final item in items)
              DataRow(
                selected: selectedDocumentId == item.id,
                onHover: (hovered) {
                  hoveredDocumentId.value = hovered ? item.id : null;
                },
                onSelectChanged: (_) => onSelectDocument(item),
                color: fixedRowColor(item),
                cells: [
                  DataCell(
                    Row(
                      children: [
                        if (item.fixed)
                          Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 2.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: colorScheme.error.withValues(alpha: 0.6),
                              ),
                              child: Text(
                                Intl.message('document_fixed'),
                                style: textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: colorScheme.onError,
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: Text(
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataCell(UserInformation.compact(user: item.createdBy)),
                  DataCell(
                    Row(
                      children: [
                        Skeleton.unite(
                          child: Icon(
                            Symbols.attachment_rounded,
                            size: 20.0,
                            weight: 300.0,
                            color: colorScheme.outline.withValues(alpha: 0.7),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            item.attachments.length >= 10
                                ? '10+'
                                : item.attachments.length.toString(),
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    Text(
                      item.createdAt == item.updatedAt
                          ? '${formatRelativeDate(item.createdAt)} ${Intl.message('common_created_at')}'
                          : '${formatRelativeDate(item.updatedAt)} ${Intl.message('common_updated_at')}',
                      style: TextStyle(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedIconButton(
                          onTap: () => context.pushNamed(
                            RouteNames.documentEdit,
                            pathParameters: {'document_id': item.id.toString()},
                            queryParameters: GoRouterState.of(
                              context,
                            ).uri.queryParameters,
                          ),
                          padding: EdgeInsets.all(4.0),
                          borderRadius: BorderRadius.circular(4.0),
                          icon: Symbols.edit_rounded,
                          size: 20.0,
                        ),
                        if (auth is AuthAuthenticated && auth.user.isAdmin ||
                            auth is AuthAuthenticated &&
                                auth.user.id == item.createdBy.id)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ElevatedIconButton(
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (_) => DeleteDialog(
                                    title: Intl.message(
                                      'data_supplier_delete_dialog_1',
                                    ),
                                    content: Intl.message(
                                      'data_supplier_delete_dialog_2',
                                    ),
                                  ),
                                );
                              },
                              padding: EdgeInsets.all(4.0),
                              borderRadius: BorderRadius.circular(4.0),
                              icon: Symbols.delete_rounded,
                              size: 20.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
