import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class InfoWidget extends HookWidget {
  final Project project;
  final ProjectCostSummary costSummary;

  const InfoWidget({
    super.key,
    required this.project,
    required this.costSummary,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCostSummaryExpanded = useState(false);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32.0,
            child: Row(
              children: [
                SizedBox(
                  width: Responsive.isDesktop(context) ? 160.0 : 100.0,
                  child: Row(
                    children: [
                      Icon(
                        Symbols.factory_rounded,
                        size: 18.0,
                        color: colorScheme.onSurface.strong,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        Intl.message('project_detail_client'),
                        style: TextStyle(color: colorScheme.onSurface.strong),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Skeleton.leaf(
                            child: Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Color(
                                  ClientBrand.fromKey(
                                    project.clients[0].id,
                                  ).color,
                                ),
                              ),
                              child: SizedBox(
                                width: 12.0,
                                height: 12.0,
                                child: SvgPicture.asset(
                                  ClientBrand.fromKey(
                                    project.clients[0].id,
                                  ).asset,
                                  colorFilter: ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            project.clients.last.name,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: Responsive.isDesktop(context) ? 160.0 : 100.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Symbols.account_circle_rounded,
                        size: 18.0,
                        color: colorScheme.onSurface.strong,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        Intl.message('project_detail_pm'),
                        style: TextStyle(color: colorScheme.onSurface.strong),
                      ),
                    ],
                  ),
                ),
                project.manager != null
                    ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: UserInfo.compact(user: project.manager!),
                      )
                    : InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(4.0),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 4.0,
                            right: 8.0,
                            top: 4.0,
                            bottom: 4.0,
                          ),
                          child: Row(
                            children: [
                              Icon(Symbols.person_search_rounded, size: 20.0),
                              SizedBox(width: 8.0),
                              Text(
                                Intl.message('project_detail_pm_empty'),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationColor: colorScheme.onSurface.muted,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 32.0,
            child: Row(
              children: [
                SizedBox(
                  width: Responsive.isDesktop(context) ? 160.0 : 100.0,
                  child: Row(
                    children: [
                      Icon(
                        Symbols.progress_activity_rounded,
                        size: 18.0,
                        color: colorScheme.onSurface.strong,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        Intl.message('project_detail_status'),
                        style: TextStyle(color: colorScheme.onSurface.strong),
                      ),
                    ],
                  ),
                ),
                if (project.isPreexecuted)
                  Flexible(
                    child: Skeleton.leaf(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: colorScheme.error.strong,
                        ),
                        child: Text(
                          Intl.message('project_preexecuted'),
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onError,
                          ),
                        ),
                      ),
                    ),
                  )
                else if (project.isClosed)
                  Flexible(
                    child: Skeleton.leaf(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: colorScheme.onSurface.strong,
                        ),
                        child: Text(
                          Intl.message('project_closed'),
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  Flexible(
                    child: Skeleton.leaf(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: colorScheme.primary.strong,
                        ),
                        child: Text(
                          Intl.message('project_in_progress'),
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (Responsive.isMobile(context)) ...[
            InkWell(
              onTap: () {
                isCostSummaryExpanded.value = !isCostSummaryExpanded.value;
              },
              borderRadius: BorderRadius.circular(4.0),
              child: SizedBox(
                height: 32.0,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100.0,
                      child: Row(
                        children: [
                          Icon(
                            Symbols.finance_rounded,
                            size: 18.0,
                            color: colorScheme.onSurface.strong,
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            Intl.message('project_detail_summary_3'),
                            style: TextStyle(
                              color: colorScheme.onSurface.strong,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    AnimatedRotation(
                      turns: isCostSummaryExpanded.value ? 0.5 : 0.0,
                      duration: Duration(milliseconds: 150),
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(Symbols.expand_more_rounded, size: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 150),
              curve: Curves.easeOut,
              child: isCostSummaryExpanded.value
                  ? Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: ContentContainer(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 16.0),
                        borderRadius: BorderRadius.circular(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      Intl.message(
                                        'project_detail_summary_3_1',
                                      ),
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: colorScheme.onSurface.strong,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${NumberFormat('#,###').format(costSummary.contractAmount)} ₩',
                                      textAlign: TextAlign.end,
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: colorScheme.onSurface.strong,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      Intl.message(
                                        'project_detail_summary_3_2',
                                      ),
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: colorScheme.onSurface.strong,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${NumberFormat('#,###').format(costSummary.purchaseAmount)} ₩',
                                      textAlign: TextAlign.end,
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: colorScheme.onSurface.strong,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      Intl.message(
                                        'project_detail_summary_3_3',
                                      ),
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: colorScheme.onSurface.strong,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${NumberFormat('#,###').format(costSummary.tripSettlementAmount)} ₩',
                                      textAlign: TextAlign.end,
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: colorScheme.onSurface.strong,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 32.0,
                              color: colorScheme.outline.subtle,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      Intl.message(
                                        'project_detail_summary_3_4',
                                      ),
                                      style: textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: colorScheme.onSurface.strong,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${NumberFormat('#,###').format(costSummary.totalCost)} ₩',
                                          textAlign: TextAlign.end,
                                          style: textTheme.titleMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: colorScheme
                                                    .onSurface
                                                    .strong,
                                              ),
                                        ),
                                        SizedBox(height: 2.0),
                                        Text(
                                          Intl.message(
                                            'project_detail_summary_3_4_subtitle',
                                          ),
                                          textAlign: TextAlign.end,
                                          style: textTheme.bodySmall?.copyWith(
                                            color: colorScheme.outline.strong,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12.0,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainerLow,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      Intl.message(
                                        'project_detail_summary_3_5',
                                      ),
                                      style: textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: colorScheme.onSurface.strong,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${NumberFormat('#,###').format(costSummary.profitAmount)} ₩',
                                          textAlign: TextAlign.end,
                                          style: textTheme.titleMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: colorScheme.primary,
                                              ),
                                        ),
                                        SizedBox(height: 2.0),
                                        Text(
                                          Intl.message(
                                            'project_detail_summary_3_5_subtitle',
                                          ),
                                          textAlign: TextAlign.end,
                                          style: textTheme.bodySmall?.copyWith(
                                            color: colorScheme.outline.strong,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(width: double.infinity),
            ),
          ],
        ],
      ),
    );
  }
}
