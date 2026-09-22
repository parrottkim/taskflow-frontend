import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ProjectCostSummaryWidget extends StatelessWidget {
  final ProjectCostSummary costSummary;

  const ProjectCostSummaryWidget({super.key, required this.costSummary});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final numberFormat = NumberFormat('#,###');

    return ContentContainer(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              Intl.message('project_detail_summary_3'),
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          _CostSummaryRow(
            label: Intl.message('project_detail_summary_3_1'),
            value: '${numberFormat.format(costSummary.contractAmount)} ₩',
          ),
          const SizedBox(height: 12.0),
          _CostSummaryRow(
            label: Intl.message('project_detail_summary_3_2'),
            value: '${numberFormat.format(costSummary.purchaseAmount)} ₩',
          ),
          const SizedBox(height: 12.0),
          _CostSummaryRow(
            label: Intl.message('project_detail_summary_3_3'),
            value: '${numberFormat.format(costSummary.tripSettlementAmount)} ₩',
          ),
          Divider(height: 32.0, color: colorScheme.outline.subtle),
          _CostSummaryRow(
            label: Intl.message('project_detail_summary_4'),
            value: '- ₩',
          ),
          const SizedBox(height: 12.0),
          _CostSummaryRow(
            label: Intl.message('project_detail_summary_5'),
            value: '- ₩',
          ),
          const SizedBox(height: 12.0),
          _CostSummaryRow(
            label: Intl.message('project_detail_summary_6'),
            value: '- ₩',
          ),
          Divider(height: 32.0, color: colorScheme.outline.subtle),
          _CostSummaryTotalRow(
            label: Intl.message('project_detail_summary_3_4'),
            value: '${numberFormat.format(costSummary.totalCost)} ₩',
            subtitle: Intl.message('project_detail_summary_3_4_subtitle'),
          ),
          const SizedBox(height: 16.0),
          _CostSummaryTotalRow(
            label: Intl.message('project_detail_summary_3_5'),
            value: '${numberFormat.format(costSummary.profitAmount)} ₩',
            subtitle: Intl.message('project_detail_summary_3_5_subtitle'),
            highlighted: true,
          ),
        ],
      ),
    );
  }
}

class _CostSummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _CostSummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140.0,
            child: Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface.strong,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface.strong,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CostSummaryTotalRow extends StatelessWidget {
  final String label;
  final String value;
  final String subtitle;
  final bool highlighted;

  const _CostSummaryTotalRow({
    required this.label,
    required this.value,
    required this.subtitle,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final row = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140.0,
          child: Text(
            label,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface.strong,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                textAlign: TextAlign.end,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: highlighted
                      ? colorScheme.primary
                      : colorScheme.onSurface.strong,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                subtitle,
                textAlign: TextAlign.end,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.outline.strong,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    if (highlighted) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLow,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
        ),
        child: row,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: row,
    );
  }
}
