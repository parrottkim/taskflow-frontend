part of '../widget.dart';

class DataTableColumnConfig {
  final String label;
  final TableColumnWidth width;
  final bool numeric;
  final MainAxisAlignment? headingRowAlignment;

  const DataTableColumnConfig({
    required this.label,
    required this.width,
    this.numeric = false,
    this.headingRowAlignment,
  });

  DataColumn build(BuildContext context, {required bool showLabel}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DataColumn(
      columnWidth: width,
      numeric: numeric,
      headingRowAlignment: headingRowAlignment,
      label: showLabel
          ? Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface.strong,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

class FixedHeaderDataTable extends StatelessWidget {
  final List<DataTableColumnConfig> columns;
  final List<DataRow> rows;
  final Widget empty;
  final VoidCallback? onLoadMore;
  final double loadMoreThreshold;
  final double headingRowHeight;
  final double? horizontalMargin;
  final double? columnSpacing;
  final bool showDivider;

  const FixedHeaderDataTable({
    super.key,
    required this.columns,
    required this.rows,
    required this.empty,
    this.onLoadMore,
    this.loadMoreThreshold = 20.0,
    this.headingRowHeight = 48.0,
    this.horizontalMargin,
    this.columnSpacing,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Skeleton.keep(
          child: DataTable(
            headingRowHeight: headingRowHeight,
            horizontalMargin: horizontalMargin,
            columnSpacing: columnSpacing,
            showCheckboxColumn: false,
            columns: [
              for (final column in columns)
                column.build(context, showLabel: true),
            ],
            rows: const [],
          ),
        ),
        if (showDivider) const Divider(),
        Expanded(
          child: rows.isEmpty
              ? empty
              : NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (onLoadMore != null &&
                        notification.metrics.pixels >=
                            notification.metrics.maxScrollExtent -
                                loadMoreThreshold) {
                      onLoadMore!();
                    }
                    return false;
                  },
                  child: SingleChildScrollView(
                    child: DataTable(
                      headingRowHeight: 0.0,
                      horizontalMargin: horizontalMargin,
                      columnSpacing: columnSpacing,
                      showCheckboxColumn: false,
                      columns: [
                        for (final column in columns)
                          column.build(context, showLabel: false),
                      ],
                      rows: rows,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
