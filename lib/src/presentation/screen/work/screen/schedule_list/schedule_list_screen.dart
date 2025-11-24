import 'dart:async';

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
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/dialog.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ScheduleListScreen extends ConsumerWidget {
  const ScheduleListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(scheduleListControllerProvider());

    return Align(
      alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 430.0),
        child: switch (schedule) {
          AsyncData(:final value) => _DesktopWidget(
              items: value.items,
              hasNext: value.hasNext,
              hasPrevious: value.hasPrevious,
            ),
          AsyncError(:final error, :final stackTrace) =>
            ErrorContainerWidget(error: error, stackTrace: stackTrace),
          _ => Skeletonizer(
              child: _DesktopWidget(
                items: List.filled(
                  30,
                  ScheduleGroup.dummy(),
                ),
              ),
            ),
        },
      ),
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final List<ScheduleGroup> items;
  final bool hasNext;
  final bool hasPrevious;

  const _DesktopWidget({
    required this.items,
    this.hasNext = false,
    this.hasPrevious = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final selectedSchedule = useState<Schedule?>(null);

    final controller = useScrollController();

    final headerKeys = useMemoized(
        () => List.generate(items.length, (_) => GlobalKey()), [items.length]);

    final throttleTimer = useRef<Timer?>(null);

    bool canLoad() {
      if (throttleTimer.value?.isActive ?? false) return false;
      throttleTimer.value = Timer(const Duration(milliseconds: 300), () {});
      return true;
    }

    useEffect(() {
      Future.microtask(() async {
        final today = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day);

        // 2. 날짜 정규화 비교를 통해 initialIndex를 찾습니다.
        int initialIndex = items.indexWhere((g) {
          final normalizedDate =
              DateTime(g.date.year, g.date.month, g.date.day);
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
          final offset =
              renderBox.localToGlobal(Offset.zero, ancestor: viewport).dy;

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
            Text(
              Intl.message('report_from_schedule_empty'),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ScheduleDateRangeFilterWidget(),
        // Divider(),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final metrics = notification.metrics;

              if (metrics.pixels <= metrics.minScrollExtent + 20 &&
                  hasPrevious &&
                  canLoad()) {
                ref
                    .read(scheduleListControllerProvider().notifier)
                    .loadPrevious();
              }

              // 하단 로드
              else if (metrics.pixels >= metrics.maxScrollExtent - 20 &&
                  hasNext &&
                  canLoad()) {
                ref.read(scheduleListControllerProvider().notifier).loadNext();
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

                    final isPast = group.date.isBefore(DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day));

                    return SliverStickyHeader(
                      header: Container(
                        key: headerKeys[i],
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: colorScheme.outline.withValues(alpha: 0.2),
                            ),
                          ),
                          color: colorScheme.surfaceContainerLow,
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

                            return Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 24.0,
                                      right: 12.0,
                                      top: 8.0,
                                      bottom: 8.0),
                                  child: Row(
                                    children: [
                                      Skeleton.unite(
                                        child: Opacity(
                                          opacity: isPast ? 0.4 : 1.0,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 8.0),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 2.0),
                                            decoration: ShapeDecoration(
                                              shape: StadiumBorder(
                                                side: BorderSide(
                                                  color: Functions(context)
                                                      .generateColorFromId(
                                                          schedule.category.id),
                                                ),
                                              ),
                                              color: Functions(context)
                                                  .generateColorFromId(
                                                      schedule.category.id)
                                                  .withValues(alpha: 0.2),
                                            ),
                                            child: Text(
                                              schedule.category.name,
                                              style: textTheme.labelMedium
                                                  ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Functions(context)
                                                    .generateColorFromId(
                                                        schedule.category.id),
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
                                                ? colorScheme.onSurface
                                                    .withValues(
                                                        alpha:
                                                            0.4) // 지난 날짜는 흐리게
                                                : colorScheme.onSurface,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 4.0),
                                        child: Text(
                                          '${DateFormat('MM/dd').format(schedule.start)} - ${DateFormat('MM/dd').format(schedule.start)}',
                                          style: textTheme.bodySmall?.copyWith(
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned.fill(
                                  child: AnimatedOpacity(
                                    duration: Duration(milliseconds: 300),
                                    opacity: selectedSchedule.value != null &&
                                            selectedSchedule.value == schedule
                                        ? 1.0
                                        : 0.0,
                                    child: ColoredBox(
                                      color:
                                          Colors.black87.withValues(alpha: 0.2),
                                      child: InkWell(
                                        onTap: () {
                                          if (selectedSchedule.value != null &&
                                              selectedSchedule.value ==
                                                  schedule) {
                                            selectedSchedule.value = null;
                                          } else {
                                            selectedSchedule.value = schedule;
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            children: [
                                              Spacer(),
                                              ElevatedIconButton(
                                                onTap: () {
                                                  context.goNamed(
                                                      RouteNames.scheduleEdit,
                                                      pathParameters: {
                                                        'schedule_id': schedule
                                                            .id
                                                            .toString(),
                                                      },
                                                      queryParameters: {
                                                        'category': schedule
                                                            .category.id
                                                            .toString(),
                                                      });
                                                },
                                                padding: EdgeInsets.all(4.0),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                icon:
                                                    Symbols.edit_square_rounded,
                                                size: 16.0,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4.0),
                                                child: ElevatedIconButton(
                                                  onTap: () async {
                                                    final result =
                                                        await showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          DeleteDialog(
                                                        title: Intl.message(
                                                            'schedule_form_delete_dialog_1'),
                                                        content: Intl.message(
                                                            'schedule_form_delete_dialog_2'),
                                                      ),
                                                    );

                                                    if (result) {
                                                      await ref
                                                          .read(
                                                              scheduleSubmitControllerProvider
                                                                  .notifier)
                                                          .deleteSchedule(
                                                              scheduleId:
                                                                  schedule.id);

                                                      ref
                                                          .read(toastProvider)
                                                          .showToast(
                                                            child: Toast(
                                                              type: ToastType
                                                                  .standard,
                                                              message: Intl.message(
                                                                  'schedule_form_delete'),
                                                            ),
                                                          );
                                                    }
                                                  },
                                                  padding: EdgeInsets.all(4.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  icon: Symbols.delete_rounded,
                                                  size: 16.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Divider(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: FilledButton(
            onPressed: () {
              context.goNamed(RouteNames.scheduleNewChoose);
            },
            child: Text(
              Intl.message('schedule_new'),
            ),
          ),
        ),
      ],
    );
  }
}
