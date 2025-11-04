import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ScheduleListWidget extends HookConsumerWidget {
  final int projectId;
  final int? tripId;
  final List<ScheduleGroup> items;
  final bool hasNext;
  final bool hasPrevious;

  const ScheduleListWidget({
    super.key,
    required this.projectId,
    this.tripId,
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
        () => List.generate(items.length, (_) => GlobalKey()), [items.length]);

    useEffect(() {
      if (items.isEmpty) return null;

      final today = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);
      int initialIndex = items.indexWhere((g) => !g.date.isBefore(today));
      if (initialIndex == -1) initialIndex = 0;

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final key = headerKeys[initialIndex];
        if (key.currentContext != null) {
          await Scrollable.ensureVisible(
            key.currentContext!,
            duration: const Duration(
                milliseconds: 300), // animate or Duration.zero for instant
            alignment: -0.2,
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
            Text(
              Intl.message('trip_from_schedule_empty'),
            ),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final metrics = notification.metrics;

        // 상단 100 픽셀 근처에 도달했고 이전 페이지가 있을 때 로드
        if (metrics.pixels <= metrics.minScrollExtent + 100) {
          if (hasPrevious == true) {
            ref
                .read(scheduleListControllerProvider(projectId: projectId)
                    .notifier)
                .loadPrevious();
          }
        }

        // 하단 100 픽셀 근처에 도달했고 다음 페이지가 있을 때 로드
        else if (metrics.pixels >= metrics.maxScrollExtent - 100) {
          if (hasNext == true) {
            ref
                .read(scheduleListControllerProvider(projectId: projectId)
                    .notifier)
                .loadNext();
          }
        }
        return false; // 이벤트를 소비하지 않고 상위 위젯으로 전달
      },
      child: CustomScrollView(
        controller: controller,
        slivers: [
          ...items.asMap().entries.map(
            (entry) {
              final i = entry.key;
              final group = entry.value;

              final isPast = group.date.isBefore(DateTime(DateTime.now().year,
                  DateTime.now().month, DateTime.now().day));

              return SliverStickyHeader(
                header: Container(
                  key: headerKeys[i],
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
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
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 8.0),
                          child: Text(
                            schedule.summary,
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: isPast
                                  ? colorScheme.onSurface
                                      .withValues(alpha: 0.4) // 지난 날짜는 흐리게
                                  : colorScheme.onSurface,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
