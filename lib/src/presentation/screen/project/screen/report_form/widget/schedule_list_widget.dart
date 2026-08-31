import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/schedule_list_item_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ScheduleListWidget extends HookConsumerWidget {
  final int projectId;
  final ScheduleFilterScope scope;
  final int userId;
  final List<ScheduleGroup> items;
  final bool hasNext;
  final bool hasPrevious;
  final ValueChanged<Schedule> onSelected;

  const ScheduleListWidget({
    super.key,
    required this.projectId,
    required this.scope,
    required this.userId,
    required this.items,
    this.hasNext = false,
    this.hasPrevious = false,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      Future.microtask(() {
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

        if (!context.mounted) return;

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
      return EmptyStateView(
        message: Intl.message('report_form_schedule_empty'),
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
                  scope: scope,
                  projectId: projectId,
                  userId: userId,
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
                  scope: scope,
                  projectId: projectId,
                  userId: userId,
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
              header: ScheduleDateHeader(
                key: headerKeys[i],
                date: group.date,
                isPast: isPast,
              ),
              sliver: SliverPadding(
                padding: EdgeInsets.only(bottom: 16.0),
                sliver: SliverList.builder(
                  itemCount: group.items.length,
                  itemBuilder: (context, index) {
                    final schedule = group.items[index];
                    return ScheduleListItem(
                      schedule: schedule,
                      isPast: isPast,
                      onTap: () => onSelected(schedule),
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
