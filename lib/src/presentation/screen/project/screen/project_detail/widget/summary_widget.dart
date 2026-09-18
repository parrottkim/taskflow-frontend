import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SummaryWidget extends HookWidget {
  final Project project;
  final ProjectCostSummary costSummary;

  const SummaryWidget({
    super.key,
    required this.project,
    required this.costSummary,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (project.isClosed) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
      return null;
    }, [project]);

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 320.0, maxWidth: 320.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: sizeController,
              curve: Curves.easeInQuad,
            ),
            child: FadeTransition(
              opacity: opacityController,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ContentContainer(
                  color: colorScheme.outline.subtle,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Symbols.mountain_flag_rounded, size: 20.0),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Intl.message('project_closed_title'),
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 4.0),
                            Text(Intl.message('project_closed_description')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (project.isClosed)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ContentContainer(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Intl.message('project_detail_summary_2'),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      project.closureMessage!,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.strong,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ContentContainer(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Intl.message('project_detail_summary_1'),
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.0),
                UserInfo.compact(user: project.createdBy),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ContentContainer(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      Intl.message('project_detail_summary_3'),
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 140.0,
                          child: Text(
                            Intl.message('project_detail_summary_3_1'),
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
                        SizedBox(
                          width: 140.0,
                          child: Text(
                            Intl.message('project_detail_summary_3_2'),
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
                        SizedBox(
                          width: 140.0,
                          child: Text(
                            Intl.message('project_detail_summary_3_3'),
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
                  Divider(height: 32.0, color: colorScheme.outline.subtle),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 140.0,
                          child: Text(
                            Intl.message('project_detail_summary_3_4'),
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface.strong,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${NumberFormat('#,###').format(costSummary.totalCost)} ₩',
                                textAlign: TextAlign.end,
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onSurface.strong,
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
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
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
                        SizedBox(
                          width: 140.0,
                          child: Text(
                            Intl.message('project_detail_summary_3_5'),
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface.strong,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${NumberFormat('#,###').format(costSummary.profitAmount)} ₩',
                                textAlign: TextAlign.end,
                                style: textTheme.titleMedium?.copyWith(
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
          ),
        ],
      ),
    );
  }
}
