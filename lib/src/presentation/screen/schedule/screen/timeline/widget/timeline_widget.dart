import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class TimelineWidget extends ConsumerWidget {
  const TimelineWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(
      userListControllerProvider(UserFilterScope.scheduleTimeline),
    );
    final schedules = ref.watch(scheduleListControllerProvider());

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
        child: switch ((users, schedules)) {
          (
            AsyncData(value: final userValue),
            AsyncData(value: final scheduleValue),
          ) =>
            Responsive(
              desktop: _DesktopWidget(
                users: userValue.items,
                groups: scheduleValue.items,
                start: scheduleValue.start,
                end: scheduleValue.end,
              ),
              mobile: _MobileWidget(
                users: userValue.items,
                groups: scheduleValue.items,
                start: scheduleValue.start,
                end: scheduleValue.end,
              ),
            ),
          (AsyncError(:final error, :final stackTrace), _) => ErrorStateView(
            error: error,
            stackTrace: stackTrace,
          ),
          (_, AsyncError(:final error, :final stackTrace)) => ErrorStateView(
            error: error,
            stackTrace: stackTrace,
          ),
          _ => Skeletonizer(
            child: Responsive(
              desktop: _DesktopWidget(
                users: List.filled(10, User.dummy()),
                groups: List.filled(6, ScheduleGroup.dummy()),
                start: DateTime.now().subtract(const Duration(days: 28)),
                end: DateTime.now().add(const Duration(days: 28)),
              ),
              mobile: _MobileWidget(
                users: List.filled(10, User.dummy()),
                groups: List.filled(6, ScheduleGroup.dummy()),
                start: DateTime.now().subtract(const Duration(days: 28)),
                end: DateTime.now().add(const Duration(days: 28)),
              ),
            ),
          ),
        },
      ),
    );
  }
}

class _MobileWidget extends HookConsumerWidget {
  static const double _rowHeight = 96.0;

  final List<User> users;
  final List<ScheduleGroup> groups;
  final DateTime start;
  final DateTime end;

  const _MobileWidget({
    required this.users,
    required this.groups,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibleWeek = useState(
      _weekStart(_initialMobileDate(start: start, end: end)),
    );
    final loadingPrevious = useRef(false);
    final loadingNext = useRef(false);
    final currentStart = useRef(start)..value = start;
    final currentEnd = useRef(end)..value = end;
    final schedulesByUser = _mobileIndexSchedulesByUser(groups);
    final colorScheme = Theme.of(context).colorScheme;

    Future<void> ensureWeekLoaded(DateTime weekStart) async {
      final weekEnd = weekStart.add(const Duration(days: 6));

      if (weekStart.isBefore(_dateOnly(currentStart.value)) &&
          !loadingPrevious.value) {
        loadingPrevious.value = true;
        await ref
            .read(scheduleListControllerProvider().notifier)
            .loadPrevious();
        loadingPrevious.value = false;
      }

      if (weekEnd.isAfter(_dateOnly(currentEnd.value)) && !loadingNext.value) {
        loadingNext.value = true;
        await ref.read(scheduleListControllerProvider().notifier).loadNext();
        loadingNext.value = false;
      }
    }

    void moveWeek(int offset) {
      final nextWeek = visibleWeek.value.add(Duration(days: offset * 7));
      visibleWeek.value = nextWeek;
      ensureWeekLoaded(nextWeek);
    }

    bool handleUserListScroll(ScrollNotification notification) {
      if (notification.metrics.axis != Axis.vertical) return false;
      if (notification.metrics.pixels >=
          notification.metrics.maxScrollExtent - 24.0) {
        ref
            .read(
              userListControllerProvider(
                UserFilterScope.scheduleTimeline,
              ).notifier,
            )
            .load();
      }
      return false;
    }

    return ContentContainer(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(8.0),
      child: Column(
        children: [
          _MobileWeekNavigator(
            weekStart: visibleWeek.value,
            onPrevious: () => moveWeek(-1),
            onNext: () => moveWeek(1),
            onToday: () {
              final todayWeek = _weekStart(DateTime.now());
              visibleWeek.value = todayWeek;
              ensureWeekLoaded(todayWeek);
            },
          ),
          Divider(height: 1.0, color: colorScheme.outline.faint),
          _MobileTimelineHeader(weekStart: visibleWeek.value),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: handleUserListScroll,
              child: ListView.builder(
                itemExtent: _rowHeight,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return _MobileUserTimelineRow(
                    user: user,
                    schedules: schedulesByUser[user.id] ?? const [],
                    weekStart: visibleWeek.value,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileWeekNavigator extends StatelessWidget {
  final DateTime weekStart;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onToday;

  const _MobileWeekNavigator({
    required this.weekStart,
    required this.onPrevious,
    required this.onNext,
    required this.onToday,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final weekEnd = weekStart.add(const Duration(days: 6));
    final locale = Intl.getCurrentLocale();

    return SizedBox(
      height: 48.0,
      child: Row(
        children: [
          AppIconButton(
            onTap: onPrevious,
            icon: const Icon(Symbols.chevron_left_rounded),
          ),
          Expanded(
            child: Text(
              '${DateFormat.MMMd(locale).format(weekStart)} – '
              '${DateFormat.MMMd(locale).format(weekEnd)}',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          AppIconButton(
            onTap: onToday,
            icon: const Icon(Symbols.today_rounded, size: 20.0),
          ),
          AppIconButton(
            onTap: onNext,
            icon: const Icon(Symbols.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}

class _MobileTimelineHeader extends StatelessWidget {
  final DateTime weekStart;

  const _MobileTimelineHeader({required this.weekStart});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final today = _dateOnly(DateTime.now());
    final locale = Intl.getCurrentLocale();

    return SizedBox(
      height: 44.0,
      child: Row(
        children: List.generate(7, (index) {
          final date = weekStart.add(Duration(days: index));
          final isToday = _dateOnly(date) == today;

          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isToday ? colorScheme.primary.faint : null,
                border: Border(
                  right: BorderSide(color: colorScheme.outline.faint),
                  bottom: BorderSide(color: colorScheme.outline.faint),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat.E(locale).format(date),
                    maxLines: 1,
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 9.0,
                      color: colorScheme.onSurface.muted,
                    ),
                  ),
                  Text(
                    DateFormat.d(locale).format(date),
                    style: textTheme.labelMedium?.copyWith(
                      color: isToday
                          ? colorScheme.primary
                          : colorScheme.onSurface,
                      fontWeight: isToday ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _MobileUserTimelineRow extends StatelessWidget {
  final User user;
  final List<Schedule> schedules;
  final DateTime weekStart;

  const _MobileUserTimelineRow({
    required this.user,
    required this.schedules,
    required this.weekStart,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final weekEnd = weekStart.add(const Duration(days: 6));
    final visibleSchedules = schedules
        .where(
          (schedule) =>
              !_dateOnly(schedule.end).isBefore(weekStart) &&
              !_dateOnly(schedule.start).isAfter(weekEnd),
        )
        .toList();

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outline.faint)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 40.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(child: UserInfo.compact(user: user)),
                  const SizedBox(width: 8.0),
                  Text(
                    '일정 ${visibleSchedules.length}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurface.strong,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _MobileScheduleLane(
              schedules: visibleSchedules,
              weekStart: weekStart,
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileScheduleLane extends StatelessWidget {
  final List<Schedule> schedules;
  final DateTime weekStart;

  const _MobileScheduleLane({required this.schedules, required this.weekStart});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final weekEnd = weekStart.add(const Duration(days: 6));
    final today = _dateOnly(DateTime.now());

    return LayoutBuilder(
      builder: (context, constraints) {
        final dayWidth = constraints.maxWidth / 7;

        return Stack(
          children: [
            Positioned.fill(
              child: Row(
                children: List.generate(7, (index) {
                  final date = weekStart.add(Duration(days: index));
                  final isWeekend =
                      date.weekday == DateTime.saturday ||
                      date.weekday == DateTime.sunday;
                  final isToday = _dateOnly(date) == today;

                  return Container(
                    width: dayWidth,
                    decoration: BoxDecoration(
                      color: isToday
                          ? colorScheme.primary.faint
                          : isWeekend
                          ? colorScheme.surfaceContainerLowest.strong
                          : null,
                      border: Border(
                        right: BorderSide(color: colorScheme.outline.faint),
                      ),
                    ),
                  );
                }),
              ),
            ),
            ...schedules
                .where(
                  (schedule) =>
                      !_dateOnly(schedule.end).isBefore(weekStart) &&
                      !_dateOnly(schedule.start).isAfter(weekEnd),
                )
                .map(
                  (schedule) => _ScheduleBar(
                    schedule: schedule,
                    timelineStart: weekStart,
                    timelineEnd: weekEnd,
                    dayWidth: dayWidth,
                    rowHeight: 56.0,
                  ),
                ),
          ],
        );
      },
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  static const double _userColumnWidth = 260.0;
  static const double _dayWidth = 42.0;
  static const double _headerHeight = 74.0;
  static const double _rowHeight = 40.0;
  static const double _barHeight = 28.0;

  final List<User> users;
  final List<ScheduleGroup> groups;
  final DateTime start;
  final DateTime end;

  const _DesktopWidget({
    required this.users,
    required this.groups,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userVerticalController = useScrollController();
    final timelineVerticalController = useScrollController();
    final timelineHorizontalController = useScrollController();
    final syncingVerticalScroll = useRef(false);
    final loadingPrevious = useRef(false);
    final loadingNext = useRef(false);
    final centeredToday = useRef(false);
    final visibleDate = useState(_initialVisibleDate(start, end));
    final currentStart = useRef(start)..value = start;
    final currentEnd = useRef(end)..value = end;

    final colorScheme = Theme.of(context).colorScheme;
    final dates = _buildDateRange(start, end);
    final schedulesByUser = _indexSchedulesByUser(groups);
    final timelineWidth = dates.length * _DesktopWidget._dayWidth;
    final todayOffset = _todayOffset(start, end);

    void syncVerticalScroll({
      required ScrollController source,
      required ScrollController target,
    }) {
      if (syncingVerticalScroll.value ||
          !source.hasClients ||
          !target.hasClients) {
        return;
      }

      final targetOffset = source.offset.clamp(
        target.position.minScrollExtent,
        target.position.maxScrollExtent,
      );
      if ((target.offset - targetOffset).abs() < 0.5) return;

      syncingVerticalScroll.value = true;
      target.jumpTo(targetOffset);
      syncingVerticalScroll.value = false;
    }

    bool handleUserListScroll(ScrollNotification notification) {
      if (notification.metrics.axis != Axis.vertical) return false;

      if (notification.metrics.pixels >=
          notification.metrics.maxScrollExtent - 24.0) {
        ref
            .read(
              userListControllerProvider(
                UserFilterScope.scheduleTimeline,
              ).notifier,
            )
            .load();
      }
      return false;
    }

    void updateVisibleDate() {
      if (!timelineHorizontalController.hasClients) return;

      final rangeStart = currentStart.value;
      final rangeEnd = currentEnd.value;
      final centerOffset =
          timelineHorizontalController.offset +
          timelineHorizontalController.position.viewportDimension / 2;
      final dayIndex = (centerOffset / _DesktopWidget._dayWidth).floor().clamp(
        0,
        _dateOnly(rangeEnd).difference(_dateOnly(rangeStart)).inDays,
      );
      final nextVisibleDate = _dateOnly(
        rangeStart,
      ).add(Duration(days: dayIndex));

      if (_dateOnly(visibleDate.value) == nextVisibleDate) return;
      visibleDate.value = nextVisibleDate;
    }

    Future<void> loadPrevious() async {
      if (loadingPrevious.value) return;

      loadingPrevious.value = true;
      final previousStart = currentStart.value;
      final currentOffset = timelineHorizontalController.offset;

      await ref.read(scheduleListControllerProvider().notifier).loadPrevious();
      if (!context.mounted) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted || !timelineHorizontalController.hasClients) {
          return;
        }

        final addedDays = previousStart.difference(currentStart.value).inDays;
        final nextOffset = currentOffset + addedDays * _DesktopWidget._dayWidth;
        timelineHorizontalController.jumpTo(
          nextOffset.clamp(
            timelineHorizontalController.position.minScrollExtent,
            timelineHorizontalController.position.maxScrollExtent,
          ),
        );
        loadingPrevious.value = false;
      });
    }

    Future<void> loadNext() async {
      if (loadingNext.value) return;

      loadingNext.value = true;
      await ref.read(scheduleListControllerProvider().notifier).loadNext();
      if (!context.mounted) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) loadingNext.value = false;
      });
    }

    void handleTimelineEdgeScroll() {
      if (!timelineHorizontalController.hasClients) return;

      final position = timelineHorizontalController.position;
      if (position.pixels <= 120.0) {
        loadPrevious();
        return;
      }
      if (position.pixels >= position.maxScrollExtent - 120.0) loadNext();
    }

    void handleTimelineScroll() {
      updateVisibleDate();
      handleTimelineEdgeScroll();
    }

    void centerToday() {
      if (!context.mounted || !timelineHorizontalController.hasClients) return;

      final today = _dateOnly(DateTime.now());
      final rangeStart = _dateOnly(currentStart.value);
      final rangeEnd = _dateOnly(currentEnd.value);
      if (today.isBefore(rangeStart) || today.isAfter(rangeEnd)) return;

      final viewportWidth =
          timelineHorizontalController.position.viewportDimension;
      final target =
          today.difference(rangeStart).inDays * _DesktopWidget._dayWidth +
          _DesktopWidget._dayWidth / 2 -
          viewportWidth / 2;

      timelineHorizontalController.jumpTo(
        target.clamp(
          timelineHorizontalController.position.minScrollExtent,
          timelineHorizontalController.position.maxScrollExtent,
        ),
      );
      centeredToday.value = true;
      updateVisibleDate();
    }

    useEffect(
      () {
        void syncFromUserList() => syncVerticalScroll(
          source: userVerticalController,
          target: timelineVerticalController,
        );
        void syncFromTimeline() => syncVerticalScroll(
          source: timelineVerticalController,
          target: userVerticalController,
        );

        userVerticalController.addListener(syncFromUserList);
        timelineVerticalController.addListener(syncFromTimeline);
        timelineHorizontalController.addListener(handleTimelineScroll);

        return () {
          userVerticalController.removeListener(syncFromUserList);
          timelineVerticalController.removeListener(syncFromTimeline);
          timelineHorizontalController.removeListener(handleTimelineScroll);
        };
      },
      [
        userVerticalController,
        timelineVerticalController,
        timelineHorizontalController,
      ],
    );

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;

        updateVisibleDate();
        if (!centeredToday.value) centerToday();
      });
      return null;
    }, [start, end]);

    return ContentContainer(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: _DesktopWidget._userColumnWidth,
                  child: Column(
                    children: [
                      _UserHeader(
                        visibleDate: visibleDate.value,
                        start: start,
                        end: end,
                      ),
                      Expanded(
                        child: NotificationListener<ScrollNotification>(
                          onNotification: handleUserListScroll,
                          child: ListView.builder(
                            controller: userVerticalController,
                            itemExtent: _DesktopWidget._rowHeight,
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              final user = users[index];
                              final userSchedules =
                                  schedulesByUser[user.id] ?? const [];

                              return _UserTimelineRow(
                                user: user,
                                scheduleCount: userSchedules.length,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(width: 1.0, color: colorScheme.outline.subtle),
                Expanded(
                  child: Scrollbar(
                    controller: timelineHorizontalController,
                    thumbVisibility: true,
                    notificationPredicate: (notification) =>
                        notification.metrics.axis == Axis.horizontal,
                    child: SingleChildScrollView(
                      controller: timelineHorizontalController,
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: timelineWidth,
                        child: Column(
                          children: [
                            _TimelineHeader(dates: dates),
                            Expanded(
                              child: Stack(
                                children: [
                                  NotificationListener<ScrollNotification>(
                                    onNotification: handleUserListScroll,
                                    child: ListView.builder(
                                      controller: timelineVerticalController,
                                      itemExtent: _DesktopWidget._rowHeight,
                                      itemCount: users.length,
                                      itemBuilder: (context, index) {
                                        final user = users[index];

                                        return _TimelineRow(
                                          start: start,
                                          end: end,
                                          schedules:
                                              schedulesByUser[user.id] ??
                                              const [],
                                        );
                                      },
                                    ),
                                  ),
                                  if (todayOffset != null)
                                    Positioned(
                                      left: math.max(
                                        0.0,
                                        todayOffset - _TodayMarker.width / 2,
                                      ),
                                      top: 0.0,
                                      bottom: 0.0,
                                      child: IgnorePointer(
                                        child: _TodayMarker(),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<DateTime> _buildDateRange(DateTime start, DateTime end) {
    final normalizedStart = _dateOnly(start);
    final normalizedEnd = _dateOnly(end);

    if (normalizedEnd.isBefore(normalizedStart)) return [];

    final dayCount = normalizedEnd.difference(normalizedStart).inDays + 1;

    return List.generate(
      dayCount,
      (index) => normalizedStart.add(Duration(days: index)),
    );
  }

  Map<int, List<Schedule>> _indexSchedulesByUser(List<ScheduleGroup> groups) {
    final seenIds = <int>{};
    final result = <int, List<Schedule>>{};

    for (final group in groups) {
      for (final schedule in group.items) {
        if (!seenIds.add(schedule.id)) continue;

        result.putIfAbsent(schedule.user.id, () => []).add(schedule);
      }
    }

    for (final schedules in result.values) {
      schedules.sort((a, b) {
        final startCompare = a.start.compareTo(b.start);
        return startCompare == 0 ? a.id.compareTo(b.id) : startCompare;
      });
    }

    return result;
  }

  double? _todayOffset(DateTime start, DateTime end) {
    final today = _dateOnly(DateTime.now());
    final normalizedStart = _dateOnly(start);
    final normalizedEnd = _dateOnly(end);

    if (today.isBefore(normalizedStart) || today.isAfter(normalizedEnd)) {
      return null;
    }

    return today.difference(normalizedStart).inDays * _DesktopWidget._dayWidth +
        _DesktopWidget._dayWidth / 2;
  }

  DateTime _initialVisibleDate(DateTime start, DateTime end) {
    final today = _dateOnly(DateTime.now());
    final normalizedStart = _dateOnly(start);
    final normalizedEnd = _dateOnly(end);

    if (today.isBefore(normalizedStart) || today.isAfter(normalizedEnd)) {
      return normalizedStart;
    }

    return today;
  }
}

class _UserHeader extends StatelessWidget {
  final DateTime visibleDate;
  final DateTime start;
  final DateTime end;

  const _UserHeader({
    required this.visibleDate,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: _DesktopWidget._headerHeight,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outline.faint)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat.yMMMM(Intl.getCurrentLocale()).format(visibleDate),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 3.0),
          Text(
            '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(end)}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurface.strong,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineHeader extends StatelessWidget {
  final List<DateTime> dates;

  const _TimelineHeader({required this.dates});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final months = _monthSegments(dates);
    final today = _dateOnly(DateTime.now());

    return SizedBox(
      height: _DesktopWidget._headerHeight,
      child: Column(
        children: [
          SizedBox(
            height: 36.0,
            child: Row(
              children: months
                  .map(
                    (segment) => Container(
                      width: segment.length * _DesktopWidget._dayWidth,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 12.0),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: colorScheme.outline.subtle),
                        ),
                      ),
                      child: Text(
                        DateFormat.MMMM(
                          Intl.getCurrentLocale(),
                        ).format(segment.date),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.strong,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: Row(
              children: dates.map((date) {
                final isToday = _dateOnly(date) == today;

                return Container(
                  width: _DesktopWidget._dayWidth,
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    border: Border(
                      right: BorderSide(color: colorScheme.outline.faint),
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                        child: Container(
                          height: 1.0,
                          color: colorScheme.outline.faint,
                        ),
                      ),
                      Center(
                        child: Text(
                          DateFormat.d(Intl.getCurrentLocale()).format(date),
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: isToday
                                ? FontWeight.w800
                                : FontWeight.w600,
                            color: isToday
                                ? colorScheme.primary
                                : colorScheme.onSurface.strong,
                          ),
                        ),
                      ),
                      if (isToday)
                        Positioned(
                          left: 9.0,
                          right: 9.0,
                          bottom: 0.0,
                          child: Container(
                            height: 3.0,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(999.0),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  List<_MonthSegment> _monthSegments(List<DateTime> dates) {
    if (dates.isEmpty) return [];

    final segments = <_MonthSegment>[];
    var current = _dateOnly(DateTime(dates.first.year, dates.first.month));
    var length = 0;

    for (final date in dates) {
      final month = _dateOnly(DateTime(date.year, date.month));

      if (month == current) {
        length++;
        continue;
      }

      segments.add(_MonthSegment(date: current, length: length));
      current = month;
      length = 1;
    }

    segments.add(_MonthSegment(date: current, length: length));
    return segments;
  }
}

class _MonthSegment {
  final DateTime date;
  final int length;

  const _MonthSegment({required this.date, required this.length});
}

class _UserTimelineRow extends StatelessWidget {
  final User user;
  final int scheduleCount;

  const _UserTimelineRow({required this.user, required this.scheduleCount});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outline.faint)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        child: Row(
          children: [
            Expanded(child: UserInfo.compact(user: user)),
            Text(
              scheduleCount.toString(),
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurface.muted,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  final DateTime start;
  final DateTime end;
  final List<Schedule> schedules;

  const _TimelineRow({
    required this.start,
    required this.end,
    required this.schedules,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outline.faint)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: _GridBackground(start: start, end: end),
          ),
          ...schedules.map((schedule) {
            return _ScheduleBar(
              schedule: schedule,
              timelineStart: start,
              timelineEnd: end,
            );
          }),
        ],
      ),
    );
  }
}

class _GridBackground extends StatelessWidget {
  final DateTime start;
  final DateTime end;

  const _GridBackground({required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final days = _dateOnly(end).difference(_dateOnly(start)).inDays + 1;

    return Row(
      children: List.generate(days, (index) {
        final date = _dateOnly(start).add(Duration(days: index));
        final isWeekend =
            date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday;

        return Container(
          width: _DesktopWidget._dayWidth,
          decoration: BoxDecoration(
            color: isWeekend
                ? colorScheme.surfaceContainerLowest.strong
                : Colors.transparent,
            border: Border(right: BorderSide(color: colorScheme.outline.faint)),
          ),
        );
      }),
    );
  }
}

class _ScheduleBar extends StatelessWidget {
  final Schedule schedule;
  final DateTime timelineStart;
  final DateTime timelineEnd;
  final double dayWidth;
  final double rowHeight;

  const _ScheduleBar({
    required this.schedule,
    required this.timelineStart,
    required this.timelineEnd,
    this.dayWidth = _DesktopWidget._dayWidth,
    this.rowHeight = _DesktopWidget._rowHeight,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = ClientBrand.fromKey(schedule.projectClientId).color;

    final clampedStart = schedule.start.isBefore(timelineStart)
        ? _dateOnly(timelineStart)
        : _dateOnly(schedule.start);
    final clampedEnd = schedule.end.isAfter(timelineEnd)
        ? _dateOnly(timelineEnd)
        : _dateOnly(schedule.end);
    final left =
        clampedStart.difference(_dateOnly(timelineStart)).inDays * dayWidth +
        6.0;
    final width =
        (clampedEnd.difference(clampedStart).inDays + 1) * dayWidth - 12.0;
    final top = (rowHeight - _DesktopWidget._barHeight) / 2;

    return Positioned(
      left: left,
      top: top,
      width: math.max(26.0, width),
      height: _DesktopWidget._barHeight,
      child: Tooltip(
        message:
            '${schedule.projectClientName} | ${schedule.projectName}\n${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule.start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule.end)}',
        child: Material(
          elevation: 1.0,
          color: Color(color),
          borderRadius: BorderRadius.circular(6.0),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              context.pushNamed(
                RouteNames.projectDetail,
                pathParameters: {'project_id': schedule.projectId.toString()},
              );
            },
            borderRadius: BorderRadius.circular(6.0),
            child: OverflowBox(
              alignment: Alignment.centerLeft,
              maxWidth: double.infinity,
              child: SizedBox(
                width: 180.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Container(
                        width: 3.0,
                        height: 14.0,
                        decoration: BoxDecoration(
                          color: Colors.white.strong,
                          borderRadius: BorderRadius.circular(999.0),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Skeleton.leaf(
                        child: SizedBox(
                          width: 16.0,
                          height: 16.0,
                          child: SvgPicture.asset(
                            ClientBrand.fromKey(schedule.projectClientId).asset,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          schedule.summary.isEmpty
                              ? schedule.projectClientName
                              : schedule.summary,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.labelMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '${schedule.end.difference(schedule.start).inDays + 1}d',
                        style: textTheme.labelSmall?.copyWith(
                          color: Colors.white.strong,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TodayMarker extends StatelessWidget {
  static const double width = 36.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      alignment: Alignment.center,
      child: Container(width: 2.0, color: colorScheme.primary),
    );
  }
}

Map<int, List<Schedule>> _mobileIndexSchedulesByUser(
  List<ScheduleGroup> groups,
) {
  final seenIds = <int>{};
  final result = <int, List<Schedule>>{};

  for (final group in groups) {
    for (final schedule in group.items) {
      if (!seenIds.add(schedule.id)) continue;
      result.putIfAbsent(schedule.user.id, () => []).add(schedule);
    }
  }

  for (final schedules in result.values) {
    schedules.sort((a, b) {
      final startCompare = a.start.compareTo(b.start);
      return startCompare == 0 ? a.id.compareTo(b.id) : startCompare;
    });
  }

  return result;
}

DateTime _weekStart(DateTime date) {
  final normalized = _dateOnly(date);
  return normalized.subtract(Duration(days: normalized.weekday - 1));
}

DateTime _initialMobileDate({required DateTime start, required DateTime end}) {
  final today = _dateOnly(DateTime.now());
  final normalizedStart = _dateOnly(start);
  final normalizedEnd = _dateOnly(end);

  if (today.isBefore(normalizedStart) || today.isAfter(normalizedEnd)) {
    return normalizedStart;
  }

  return today;
}

DateTime _dateOnly(DateTime date) => DateTime(date.year, date.month, date.day);
