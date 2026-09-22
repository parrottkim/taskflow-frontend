import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/project_cost_summary_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/project_participant_summary_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class InfoWidget extends HookWidget {
  final Project project;
  final ProjectParticipantSummary participantSummary;
  final ProjectCostSummary costSummary;

  const InfoWidget({
    super.key,
    required this.project,
    required this.participantSummary,
    required this.costSummary,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isParticipantSummaryExpanded = useState(false);
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
          if (!Responsive.isDesktop(context)) ...[
            InkWell(
              onTap: () {
                isParticipantSummaryExpanded.value =
                    !isParticipantSummaryExpanded.value;
              },
              borderRadius: BorderRadius.circular(4.0),
              child: SizedBox(
                height: 28.0,
                child: Row(
                  children: [
                    SizedBox(
                      width: 120.0,
                      child: Row(
                        children: [
                          Icon(
                            Symbols.groups_rounded,
                            size: 18.0,
                            color: colorScheme.onSurface.strong,
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            '${Intl.message('project_detail_summary_7')} · ${Intl.message('project_detail_summary_8')}',
                            style: TextStyle(
                              color: colorScheme.onSurface.strong,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    AnimatedRotation(
                      turns: isParticipantSummaryExpanded.value ? 0.5 : 0.0,
                      duration: const Duration(milliseconds: 150),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(Symbols.expand_more_rounded, size: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              child: isParticipantSummaryExpanded.value
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: ProjectParticipantSummaryWidget(
                        project: project,
                        participantSummary: participantSummary,
                      ),
                    )
                  : const SizedBox(width: double.infinity),
            ),
            const SizedBox(height: 4.0),
            InkWell(
              onTap: () {
                isCostSummaryExpanded.value = !isCostSummaryExpanded.value;
              },
              borderRadius: BorderRadius.circular(4.0),
              child: SizedBox(
                height: 28.0,
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
                      duration: const Duration(milliseconds: 150),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(Symbols.expand_more_rounded, size: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              child: isCostSummaryExpanded.value
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ProjectCostSummaryWidget(costSummary: costSummary),
                    )
                  : const SizedBox(width: double.infinity),
            ),
          ],
        ],
      ),
    );
  }
}
