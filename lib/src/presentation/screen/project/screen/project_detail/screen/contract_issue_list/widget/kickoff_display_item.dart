import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/shared/theme/color_extension.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class KickoffDisplayItem extends StatelessWidget {
  final DateTime kickoffDate;
  final List<KickoffIssueParticipantItem> participantItems;
  final List<KickoffIssueTripItem> tripItems;

  const KickoffDisplayItem({
    super.key,
    required this.kickoffDate,
    required this.participantItems,
    required this.tripItems,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final totalDays = tripItems.fold<int>(0, (sum, item) => sum + item.days);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: colorScheme.surfaceContainer,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Intl.message('project_detail_kickoff'),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 8.0),
                Text(
                  DateFormat.yMMMd(
                    Intl.getCurrentLocale(),
                  ).format(kickoffDate.toLocal()),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        if (Responsive.isDesktop(context))
          DataTable(
            headingRowHeight: 36.0,
            showCheckboxColumn: false,
            horizontalMargin: 0.0,
            dataRowMinHeight: 36.0,
            dataRowMaxHeight: 36.0,
            showBottomBorder: true,
            border: TableBorder(
              verticalInside: BorderSide(
                color: colorScheme.outline.subtle,
                width: 1.0,
              ),
              horizontalInside: BorderSide(
                color: colorScheme.outline.subtle,
                width: 1.0,
              ),
              bottom: BorderSide(color: colorScheme.outline.subtle, width: 1.0),
            ),
            columns: [
              DataColumn(
                columnWidth: const FixedColumnWidth(160.0),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.person_rounded,
                        color: colorScheme.onSurface.strong,
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        Intl.message('issue_form_kickoff_5'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.strong,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataColumn(
                columnWidth: const FlexColumnWidth(),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.numbers_rounded,
                        color: colorScheme.onSurface.strong,
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        Intl.message('issue_form_kickoff_6'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.strong,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            rows: List.generate(
              participantItems.length,
              (index) => DataRow(
                cells: [
                  DataCell(
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Functions(context)
                                .generateColorFromId(
                                  participantItems[index].participant!.id,
                                ),
                            radius: 10.0,
                            child: Text(
                              getInitials(
                                participantItems[index].participant!.username,
                              ),
                              style: const TextStyle(
                                fontSize: 10.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              participantItems[index].participant!.username,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      child: Text(participantItems[index].role),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 36.0,
              showCheckboxColumn: false,
              horizontalMargin: 0.0,
              dataRowMinHeight: 36.0,
              dataRowMaxHeight: 36.0,
              showBottomBorder: true,
              border: TableBorder(
                verticalInside: BorderSide(
                  color: colorScheme.outline.subtle,
                  width: 1.0,
                ),
                horizontalInside: BorderSide(
                  color: colorScheme.outline.subtle,
                  width: 1.0,
                ),
                bottom: BorderSide(
                  color: colorScheme.outline.subtle,
                  width: 1.0,
                ),
              ),
              columns: [
                DataColumn(
                  columnWidth: const FixedColumnWidth(160.0),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.person_rounded,
                          color: colorScheme.onSurface.strong,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          Intl.message('issue_form_kickoff_5'),
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.strong,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  columnWidth: const FixedColumnWidth(240.0),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.numbers_rounded,
                          color: colorScheme.onSurface.strong,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          Intl.message('issue_form_kickoff_6'),
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.strong,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              rows: List.generate(
                participantItems.length,
                (index) => DataRow(
                  cells: [
                    DataCell(
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Functions(context)
                                  .generateColorFromId(
                                    participantItems[index].participant!.id,
                                  ),
                              radius: 10.0,
                              child: Text(
                                getInitials(
                                  participantItems[index].participant!.username,
                                ),
                                style: const TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                participantItems[index].participant!.username,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Text(participantItems[index].role),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (Responsive.isDesktop(context))
          DataTable(
            headingRowHeight: 36.0,
            showCheckboxColumn: false,
            horizontalMargin: 0.0,
            dataRowMinHeight: 36.0,
            dataRowMaxHeight: 36.0,
            showBottomBorder: true,
            border: TableBorder(
              verticalInside: BorderSide(
                color: colorScheme.outline.subtle,
                width: 1.0,
              ),
              horizontalInside: BorderSide(
                color: colorScheme.outline.subtle,
                width: 1.0,
              ),
              bottom: BorderSide(color: colorScheme.outline.subtle, width: 1.0),
            ),
            columns: [
              DataColumn(
                columnWidth: const FixedColumnWidth(160.0),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.category_rounded,
                        color: colorScheme.onSurface.strong,
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        Intl.message('issue_form_kickoff_9'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.strong,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataColumn(
                columnWidth: const FixedColumnWidth(100.0),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.numbers_rounded,
                        color: colorScheme.onSurface.strong,
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        Intl.message('issue_form_kickoff_10'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.strong,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataColumn(
                columnWidth: const FlexColumnWidth(),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.text_fields_rounded,
                        color: colorScheme.onSurface.strong,
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        Intl.message('issue_form_kickoff_11'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.strong,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            rows: List.generate(
              tripItems.length,
              (index) => DataRow(
                cells: [
                  DataCell(
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      child: Text(tripItems[index].category!.name),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        '${tripItems[index].days} ${Intl.message('issue_form_kickoff_14')}',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      child: Text(tripItems[index].note ?? '-'),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 36.0,
              showCheckboxColumn: false,
              horizontalMargin: 0.0,
              dataRowMinHeight: 36.0,
              dataRowMaxHeight: 36.0,
              showBottomBorder: true,
              border: TableBorder(
                verticalInside: BorderSide(
                  color: colorScheme.outline.subtle,
                  width: 1.0,
                ),
                horizontalInside: BorderSide(
                  color: colorScheme.outline.subtle,
                  width: 1.0,
                ),
                bottom: BorderSide(
                  color: colorScheme.outline.subtle,
                  width: 1.0,
                ),
              ),
              columns: [
                DataColumn(
                  columnWidth: const FixedColumnWidth(160.0),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.category_rounded,
                          color: colorScheme.onSurface.strong,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          Intl.message('issue_form_kickoff_9'),
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.strong,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  columnWidth: const FixedColumnWidth(120.0),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.numbers_rounded,
                          color: colorScheme.onSurface.strong,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          Intl.message('issue_form_kickoff_10'),
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.strong,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  columnWidth: const FixedColumnWidth(240.0),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.text_fields_rounded,
                          color: colorScheme.onSurface.strong,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          Intl.message('issue_form_kickoff_11'),
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.strong,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              rows: List.generate(
                tripItems.length,
                (index) => DataRow(
                  cells: [
                    DataCell(
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Text(tripItems[index].category!.name),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          '${tripItems[index].days} ${Intl.message('issue_form_kickoff_14')}',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Text(tripItems[index].note ?? '-'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: colorScheme.outline.subtle, width: 1.0),
            ),
            color: colorScheme.surfaceContainer,
          ),
          child: Row(
            children: [
              Text(
                Intl.message('issue_form_kickoff_13'),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Text(
                  '$totalDays ${Intl.message('issue_form_kickoff_14')}',
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
