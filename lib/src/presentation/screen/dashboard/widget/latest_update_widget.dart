import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LatestUpdateWidget extends ConsumerWidget {
  const LatestUpdateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final state = ref.watch(latestUpdateControllerProvider);
    final dummy = List.filled(3, LatestIssue.dummy());

    return LayoutBuilder(
      builder: (context, constraints) => ContainerWidget(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        height: Responsive.isDesktop(context) ? constraints.maxHeight : 340.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                Intl.message('dashboard_latest_update'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Expanded(
              child: switch (state) {
                AsyncData(:final value) => _DesktopWidget(items: value.items),
                AsyncError(:final error, :final stackTrace) =>
                  ErrorContainerWidget(error: error, stackTrace: stackTrace),
                _ => Skeletonizer(child: _DesktopWidget(items: dummy)),
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DesktopWidget extends HookWidget {
  final List<LatestIssue> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (items.isEmpty) {
      return Center(
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
            Text(Intl.message('dashboard_no_issue')),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) => ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: Responsive.isDesktop(context)
            ? PageScrollPhysics()
            : BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        itemCount: items.length,
        itemBuilder: (context, index) => SizedBox(
          width: Responsive.isDesktop(context)
              ? constraints.maxWidth / 3
              : constraints.maxWidth - 48.0,
          child: InkWell(
            onTap: () {
              context.pushNamed(
                RouteNames.projectDetail,
                pathParameters: {
                  'project_id': items[index].projectId.toString(),
                },
                queryParameters: {'issue': items[index].id.toString()},
              );
            },
            borderRadius: BorderRadius.circular(16.0),
            child: ContainerWidget(
              padding: EdgeInsets.all(16.0),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryWidget(item: items[index].category),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Skeleton.leaf(
                        child: Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Color(
                              ClientType.fromKey(
                                items[index].clients.first.id,
                              ).color,
                            ),
                          ),
                          child: SizedBox(
                            width: 16.0,
                            height: 16.0,
                            child: SvgPicture.asset(
                              ClientType.fromKey(
                                items[index].clients.first.id,
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
                        items[index].clients.last.name,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    items[index].projectName,
                    maxLines: 1,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    items[index].projectCode,
                    style: TextStyle(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(),
                  ),
                  Row(
                    children: [
                      Icon(
                        Symbols.calendar_today_rounded,
                        size: 18.0,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '${formatRelativeDate(items[index].createdAt)}, ${DateFormat.MMMd(Intl.getCurrentLocale()).format(items[index].createdAt)} ${DateFormat.jm(Intl.getCurrentLocale()).format(items[index].createdAt)}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(
                        Symbols.person_rounded,
                        size: 18.0,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        items[index].createdBy.username,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        separatorBuilder: (_, _) => SizedBox(width: 16.0),
      ),
    );
  }
}
