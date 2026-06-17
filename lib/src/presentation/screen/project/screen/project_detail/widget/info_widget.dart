import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class InfoWidget extends StatelessWidget {
  final Project project;

  const InfoWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
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
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      Intl.message('project_detail_client'),
                      style: TextStyle(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
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
                                ClientType.fromKey(project.clients[0].id).color,
                              ),
                            ),
                            child: SizedBox(
                              width: 12.0,
                              height: 12.0,
                              child: SvgPicture.asset(
                                ClientType.fromKey(project.clients[0].id).asset,
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
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      Intl.message('project_detail_pm'),
                      style: TextStyle(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              project.manager != null
                  ? Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: UserInformation.compact(user: project.manager!),
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
                                decorationColor: colorScheme.onSurface
                                    .withValues(alpha: 0.3),
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
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      Intl.message('project_detail_status'),
                      style: TextStyle(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
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
                        color: colorScheme.error.withValues(alpha: 0.6),
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
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
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
                        color: colorScheme.primary.withValues(alpha: 0.6),
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
      ],
    );
  }
}
