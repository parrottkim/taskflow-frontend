import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ScheduleListWidget extends HookConsumerWidget {
  final int projectId;
  final ValueNotifier<Schedule?> selectedSchedule;
  final List<ScheduleGroup> items;
  final bool hasNext;
  final bool hasPrevious;

  const ScheduleListWidget({
    super.key,
    required this.projectId,
    required this.selectedSchedule,
    required this.items,
    this.hasNext = false,
    this.hasPrevious = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final controller = useScrollController();

    final headerKeys = useMemoized(
      () => List.generate(items.length, (_) => GlobalKey()),
      [items.length],
    );

    final throttleTimer = useRef<Timer?>(null);

    bool canLoad() {
      if (throttleTimer.value?.isActive ?? false) return false;
      throttleTimer.value = Timer(const Duration(milliseconds: 300), () {});
      return true;
    }

    useEffect(() {
      Future.microtask(() async {
        final today = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        );

        // 2. 날짜 정규화 비교를 통해 initialIndex를 찾습니다.
        int initialIndex = items.indexWhere((g) {
          final normalizedDate = DateTime(
            g.date.year,
            g.date.month,
            g.date.day,
          );
          return !normalizedDate.isBefore(today);
        });

        if (initialIndex == -1) {
          initialIndex = items.isNotEmpty ? items.length - 1 : 0;
        }

        if (items.isEmpty || initialIndex >= items.length) return;

        final key = headerKeys[initialIndex];

        // ⭐️ 3. key.currentContext가 아닌 RenderBox를 통해 위치를 계산합니다.
        if (key.currentContext != null) {
          final renderBox = key.currentContext!.findRenderObject() as RenderBox;

          // ⭐️ 4. 현재 스크롤 뷰의 RenderBox를 찾습니다.
          final viewport = context.findRenderObject() as RenderBox;

          // ⭐️ 5. 목표 헤더의 절대 위치를 스크롤 뷰 내에서의 상대적인 위치(offset)로 변환합니다.
          final offset = renderBox
              .localToGlobal(Offset.zero, ancestor: viewport)
              .dy;

          // 6. 계산된 offset으로 스크롤을 이동시킵니다.
          controller.animateTo(
            offset + controller.offset, // 현재 스크롤 위치 + 상대 위치
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });

      return null;
    }, []);

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
            Text(Intl.message('report_form_schedule_empty')),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final metrics = notification.metrics;

        if (metrics.pixels <= metrics.minScrollExtent + 20 &&
            hasPrevious &&
            canLoad()) {
          ref
              .read(
                scheduleListControllerProvider(
                  scope: ScheduleFilterScope.projectReportCategory,
                  projectId: projectId,
                ).notifier,
              )
              .loadPrevious();
        }
        // 하단 로드
        else if (metrics.pixels >= metrics.maxScrollExtent - 20 &&
            hasNext &&
            canLoad()) {
          ref
              .read(
                scheduleListControllerProvider(
                  scope: ScheduleFilterScope.projectReportCategory,
                  projectId: projectId,
                ).notifier,
              )
              .loadNext();
        }

        return false; // 이벤트를 소비하지 않고 상위 위젯으로 전달
      },
      child: CustomScrollView(
        controller: controller,
        slivers: [
          ...items.asMap().entries.map((entry) {
            final i = entry.key;
            final group = entry.value;

            final isPast = group.date.isBefore(
              DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
              ),
            );

            return SliverStickyHeader(
              header: Container(
                key: headerKeys[i],
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                  color: colorScheme.surfaceBright,
                ),
                child: Text(
                  '${DateFormat.MMMMd(Intl.getCurrentLocale()).format(group.date)} ${DateFormat.EEEE(Intl.getCurrentLocale()).format(group.date)}',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isPast
                        ? colorScheme.onSurface.withValues(alpha: 0.4)
                        : colorScheme.primary,
                  ),
                ),
              ),
              sliver: SliverPadding(
                padding: EdgeInsets.only(bottom: 16.0),
                sliver: SliverList.builder(
                  itemCount: group.items.length,
                  itemBuilder: (context, index) {
                    final schedule = group.items[index];

                    return InkWell(
                      onTap: () {
                        context.pop();
                        context.goNamed(
                          RouteNames.reportNewChoose,
                          pathParameters: {'project_id': projectId.toString()},
                          queryParameters: {
                            'schedule_id': schedule.id.toString(),
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          children: [
                            Skeleton.unite(
                              child: Opacity(
                                opacity: isPast ? 0.4 : 1.0,
                                child: Container(
                                  margin: EdgeInsets.only(right: 8.0),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 2.0,
                                  ),
                                  decoration: ShapeDecoration(
                                    shape: StadiumBorder(
                                      side: BorderSide(
                                        color: Functions(context)
                                            .generateColorFromId(
                                              schedule.category.id,
                                            ),
                                      ),
                                    ),
                                    color: Functions(context)
                                        .generateColorFromId(
                                          schedule.category.id,
                                        )
                                        .withValues(alpha: 0.2),
                                  ),
                                  child: Text(
                                    schedule.category.name,
                                    style: textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Functions(context)
                                          .generateColorFromId(
                                            schedule.category.id,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                schedule.summary,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: isPast
                                      ? colorScheme.onSurface.withValues(
                                          alpha: 0.4,
                                        ) // 지난 날짜는 흐리게
                                      : colorScheme.onSurface,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Text(
                                '${DateFormat('MM/dd').format(schedule.start)} - ${DateFormat('MM/dd').format(schedule.start)}',
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurface.withValues(
                                    alpha: 0.7,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
