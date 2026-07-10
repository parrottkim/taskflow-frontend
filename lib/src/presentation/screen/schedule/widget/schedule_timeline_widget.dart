import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class ScheduleTimelineWidget extends ConsumerWidget {
  const ScheduleTimelineWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(
      userListControllerProvider(UserFilterScope.scheduleTimeline),
    );
    final schedules = ref.watch(scheduleListControllerProvider());

    return Expanded(
      child: switch ((users, schedules)) {
        (
          AsyncData(value: final userValue),
          AsyncData(value: final scheduleValue),
        ) =>
          _ScheduleTimeline(
            users: userValue.items,
            groups: scheduleValue.items,
            start: scheduleValue.start,
            end: scheduleValue.end,
          ),
        (AsyncError(:final error, :final stackTrace), _) =>
          ErrorContainerWidget(error: error, stackTrace: stackTrace),
        (_, AsyncError(:final error, :final stackTrace)) =>
          ErrorContainerWidget(error: error, stackTrace: stackTrace),
        _ => Skeletonizer(
          child: _ScheduleTimeline(
            users: List.filled(10, User.dummy()),
            groups: List.filled(6, ScheduleGroup.dummy()),
            start: DateTime.now().subtract(const Duration(days: 28)),
            end: DateTime.now().add(const Duration(days: 28)),
          ),
        ),
      },
    );
  }
}

class _ScheduleTimeline extends ConsumerStatefulWidget {
  static const double _userColumnWidth = 260.0;
  static const double _dayWidth = 42.0;
  static const double _headerHeight = 74.0;
  static const double _rowHeight = 40.0;
  static const double _barHeight = 28.0;

  final List<User> users;
  final List<ScheduleGroup> groups;
  final DateTime start;
  final DateTime end;

  const _ScheduleTimeline({
    required this.users,
    required this.groups,
    required this.start,
    required this.end,
  });

  @override
  ConsumerState<_ScheduleTimeline> createState() => _ScheduleTimelineState();
}

class _ScheduleTimelineState extends ConsumerState<_ScheduleTimeline> {
  late final ScrollController _userVerticalController;
  late final ScrollController _timelineVerticalController;
  late final ScrollController _timelineHorizontalController;

  bool _syncingVerticalScroll = false;
  bool _loadingPrevious = false;
  bool _loadingNext = false;
  bool _centeredToday = false;
  late DateTime _visibleDate;

  @override
  void initState() {
    super.initState();

    _visibleDate = _initialVisibleDate();
    _userVerticalController = ScrollController();
    _timelineVerticalController = ScrollController();
    _timelineHorizontalController = ScrollController();

    _userVerticalController.addListener(
      () => _syncVerticalScroll(
        source: _userVerticalController,
        target: _timelineVerticalController,
      ),
    );
    _timelineVerticalController.addListener(
      () => _syncVerticalScroll(
        source: _timelineVerticalController,
        target: _userVerticalController,
      ),
    );
    _timelineHorizontalController.addListener(_handleTimelineScroll);
  }

  @override
  void dispose() {
    _userVerticalController.dispose();
    _timelineVerticalController.dispose();
    _timelineHorizontalController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _ScheduleTimeline oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.start != widget.start || oldWidget.end != widget.end) {
      _updateVisibleDate();
    }

    if (!_centeredToday) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _centerToday());
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final dates = _buildDateRange(widget.start, widget.end);
    final schedulesByUser = _indexSchedulesByUser(widget.groups);
    final timelineWidth = dates.length * _ScheduleTimeline._dayWidth;
    final todayOffset = _todayOffset(widget.start, widget.end);

    if (!_centeredToday) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _centerToday());
    }

    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
      child: ContainerWidget(
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
                    width: _ScheduleTimeline._userColumnWidth,
                    child: Column(
                      children: [
                        _UserHeader(
                          visibleDate: _visibleDate,
                          start: widget.start,
                          end: widget.end,
                        ),
                        Expanded(
                          child: NotificationListener<ScrollNotification>(
                            onNotification: _handleUserListScroll,
                            child: ListView.builder(
                              controller: _userVerticalController,
                              itemExtent: _ScheduleTimeline._rowHeight,
                              itemCount: widget.users.length,
                              itemBuilder: (context, index) {
                                final user = widget.users[index];
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
                  VerticalDivider(
                    width: 1.0,
                    color: colorScheme.outline.withValues(alpha: 0.18),
                  ),
                  Expanded(
                    child: Scrollbar(
                      controller: _timelineHorizontalController,
                      thumbVisibility: true,
                      notificationPredicate: (notification) =>
                          notification.metrics.axis == Axis.horizontal,
                      child: SingleChildScrollView(
                        controller: _timelineHorizontalController,
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
                                      onNotification: _handleUserListScroll,
                                      child: ListView.builder(
                                        controller: _timelineVerticalController,
                                        itemExtent:
                                            _ScheduleTimeline._rowHeight,
                                        itemCount: widget.users.length,
                                        itemBuilder: (context, index) {
                                          final user = widget.users[index];

                                          return _TimelineRow(
                                            start: widget.start,
                                            end: widget.end,
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
      ),
    );
  }

  void _syncVerticalScroll({
    required ScrollController source,
    required ScrollController target,
  }) {
    if (_syncingVerticalScroll || !source.hasClients || !target.hasClients) {
      return;
    }

    final targetOffset = source.offset.clamp(
      target.position.minScrollExtent,
      target.position.maxScrollExtent,
    );

    if ((target.offset - targetOffset).abs() < 0.5) return;

    _syncingVerticalScroll = true;
    target.jumpTo(targetOffset);
    _syncingVerticalScroll = false;
  }

  bool _handleUserListScroll(ScrollNotification notification) {
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

  void _handleTimelineScroll() {
    _updateVisibleDate();
    _handleTimelineEdgeScroll();
  }

  void _handleTimelineEdgeScroll() {
    if (!_timelineHorizontalController.hasClients) return;

    final position = _timelineHorizontalController.position;

    if (position.pixels <= 120.0) {
      _loadPrevious();
      return;
    }

    if (position.pixels >= position.maxScrollExtent - 120.0) {
      _loadNext();
    }
  }

  Future<void> _loadPrevious() async {
    if (_loadingPrevious) return;

    _loadingPrevious = true;
    final previousStart = widget.start;
    final currentOffset = _timelineHorizontalController.offset;

    await ref.read(scheduleListControllerProvider().notifier).loadPrevious();

    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_timelineHorizontalController.hasClients) return;

      final addedDays = previousStart.difference(widget.start).inDays;
      final nextOffset =
          currentOffset + addedDays * _ScheduleTimeline._dayWidth;
      _timelineHorizontalController.jumpTo(
        nextOffset.clamp(
          _timelineHorizontalController.position.minScrollExtent,
          _timelineHorizontalController.position.maxScrollExtent,
        ),
      );
      _loadingPrevious = false;
    });
  }

  Future<void> _loadNext() async {
    if (_loadingNext) return;

    _loadingNext = true;
    await ref.read(scheduleListControllerProvider().notifier).loadNext();

    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadingNext = false;
    });
  }

  void _centerToday() {
    if (!mounted || !_timelineHorizontalController.hasClients) return;

    final today = _dateOnly(DateTime.now());
    final start = _dateOnly(widget.start);
    final end = _dateOnly(widget.end);

    if (today.isBefore(start) || today.isAfter(end)) return;

    final viewportWidth =
        _timelineHorizontalController.position.viewportDimension;
    final target =
        today.difference(start).inDays * _ScheduleTimeline._dayWidth +
        _ScheduleTimeline._dayWidth / 2 -
        viewportWidth / 2;

    _timelineHorizontalController.jumpTo(
      target.clamp(
        _timelineHorizontalController.position.minScrollExtent,
        _timelineHorizontalController.position.maxScrollExtent,
      ),
    );
    _centeredToday = true;
    _updateVisibleDate();
  }

  void _updateVisibleDate() {
    if (!_timelineHorizontalController.hasClients) return;

    final centerOffset =
        _timelineHorizontalController.offset +
        _timelineHorizontalController.position.viewportDimension / 2;
    final dayIndex = (centerOffset / _ScheduleTimeline._dayWidth).floor().clamp(
      0,
      _dateOnly(widget.end).difference(_dateOnly(widget.start)).inDays,
    );
    final nextVisibleDate = _dateOnly(
      widget.start,
    ).add(Duration(days: dayIndex));

    if (_dateOnly(_visibleDate) == nextVisibleDate) return;

    setState(() {
      _visibleDate = nextVisibleDate;
    });
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

    return today.difference(normalizedStart).inDays *
            _ScheduleTimeline._dayWidth +
        _ScheduleTimeline._dayWidth / 2;
  }

  DateTime _initialVisibleDate() {
    final today = _dateOnly(DateTime.now());
    final start = _dateOnly(widget.start);
    final end = _dateOnly(widget.end);

    if (today.isBefore(start) || today.isAfter(end)) return start;

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
      height: _ScheduleTimeline._headerHeight,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.12),
          ),
        ),
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
              color: colorScheme.onSurface.withValues(alpha: 0.54),
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
      height: _ScheduleTimeline._headerHeight,
      child: Column(
        children: [
          SizedBox(
            height: 36.0,
            child: Row(
              children: months
                  .map(
                    (segment) => Container(
                      width: segment.length * _ScheduleTimeline._dayWidth,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 12.0),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: colorScheme.outline.withValues(alpha: 0.18),
                          ),
                        ),
                      ),
                      child: Text(
                        DateFormat.MMMM(
                          Intl.getCurrentLocale(),
                        ).format(segment.date),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.withValues(alpha: 0.62),
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
                  width: _ScheduleTimeline._dayWidth,
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    border: Border(
                      right: BorderSide(
                        color: colorScheme.outline.withValues(alpha: 0.11),
                      ),
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
                          color: colorScheme.outline.withValues(alpha: 0.12),
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
                                : colorScheme.onSurface.withValues(alpha: 0.52),
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
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.12),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        child: Row(
          children: [
            Expanded(child: UserInformation.compact(user: user)),
            Text(
              scheduleCount.toString(),
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.44),
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
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.12),
          ),
        ),
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
          width: _ScheduleTimeline._dayWidth,
          decoration: BoxDecoration(
            color: isWeekend
                ? colorScheme.surfaceContainerLowest.withValues(alpha: 0.55)
                : Colors.transparent,
            border: Border(
              right: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.09),
              ),
            ),
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

  const _ScheduleBar({
    required this.schedule,
    required this.timelineStart,
    required this.timelineEnd,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = ClientType.fromKey(schedule.projectClientId).color;

    final clampedStart = schedule.start.isBefore(timelineStart)
        ? _dateOnly(timelineStart)
        : _dateOnly(schedule.start);
    final clampedEnd = schedule.end.isAfter(timelineEnd)
        ? _dateOnly(timelineEnd)
        : _dateOnly(schedule.end);
    final left =
        clampedStart.difference(_dateOnly(timelineStart)).inDays *
            _ScheduleTimeline._dayWidth +
        6.0;
    final width =
        (clampedEnd.difference(clampedStart).inDays + 1) *
            _ScheduleTimeline._dayWidth -
        12.0;
    const top =
        (_ScheduleTimeline._rowHeight - _ScheduleTimeline._barHeight) / 2;

    return Positioned(
      left: left,
      top: top,
      width: math.max(26.0, width),
      height: _ScheduleTimeline._barHeight,
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
              context.goNamed(
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
                          color: Colors.white.withValues(alpha: 0.65),
                          borderRadius: BorderRadius.circular(999.0),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Skeleton.leaf(
                        child: SizedBox(
                          width: 16.0,
                          height: 16.0,
                          child: SvgPicture.asset(
                            ClientType.fromKey(schedule.projectClientId).asset,
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
                          color: Colors.white.withValues(alpha: 0.86),
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

DateTime _dateOnly(DateTime date) => DateTime(date.year, date.month, date.day);
