import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/schedule_list/widget/schedule_list_item_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ScheduleListScreen extends ConsumerWidget {
  const ScheduleListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider) as AuthAuthenticated;
    final schedule = ref.watch(
      scheduleListControllerProvider(
        scope: ScheduleFilterScope.schedulePage,
        userId: auth.user.id,
      ),
    );

    ref.listen(scheduleSubmitControllerProvider, (_, state) {
      if (state is ScheduleSubmitPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();

        if (state is ScheduleSubmitDeleted) {
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('schedule_form_deleted'),
                ),
              );
        }
      }
    });

    return Align(
      alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 430.0),
        child: switch (schedule) {
          AsyncData(:final value) => _DesktopWidget(
            userId: auth.user.id,
            items: value.items,
            hasNext: value.hasNext,
            hasPrevious: value.hasPrevious,
          ),
          AsyncError(:final error, :final stackTrace) => ErrorStateView(
            error: error,
            stackTrace: stackTrace,
          ),
          _ => Skeletonizer(
            child: _DesktopWidget(
              items: List.filled(30, ScheduleGroup.dummy()),
            ),
          ),
        },
      ),
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int? userId;
  final List<ScheduleGroup> items;
  final bool hasNext;
  final bool hasPrevious;

  const _DesktopWidget({
    this.userId,
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
      () => List.generate(items.length, (_) => GlobalKey()),
      [items.length],
    );

    final throttleTimer = useRef<Timer?>(null);
    final isLoadingPrevious = useRef(false);
    final isLoadingNext = useRef(false);
    final didScrollToToday = useRef(false);

    bool canLoad() {
      if (throttleTimer.value?.isActive ?? false) return false;
      throttleTimer.value = Timer(const Duration(milliseconds: 300), () {});
      return true;
    }

    useEffect(() {
      if (userId == null) {
        didScrollToToday.value = false;
        return null;
      }

      if (items.isEmpty || didScrollToToday.value) {
        return null;
      }

      didScrollToToday.value = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted || !controller.hasClients) return;

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
        final targetContext = key.currentContext;
        if (targetContext == null) return;

        Scrollable.ensureVisible(
          targetContext,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          alignment: 0,
        );
      });

      return null;
    }, [userId, items]);

    useEffect(() {
      return () => throttleTimer.value?.cancel();
    }, const []);

    Future<void> loadPrevious() async {
      if (isLoadingPrevious.value || !controller.hasClients) return;

      isLoadingPrevious.value = true;
      final previousMaxScrollExtent = controller.position.maxScrollExtent;

      try {
        await ref
            .read(
              scheduleListControllerProvider(
                scope: ScheduleFilterScope.schedulePage,
                userId: userId,
              ).notifier,
            )
            .loadPrevious();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!controller.hasClients) return;

          final addedExtent =
              controller.position.maxScrollExtent - previousMaxScrollExtent;
          if (addedExtent > 0) {
            controller.jumpTo(
              (controller.offset + addedExtent).clamp(
                controller.position.minScrollExtent,
                controller.position.maxScrollExtent,
              ),
            );
          }
        });
      } finally {
        isLoadingPrevious.value = false;
      }
    }

    Future<void> loadNext() async {
      if (isLoadingNext.value) return;

      isLoadingNext.value = true;
      try {
        await ref
            .read(
              scheduleListControllerProvider(
                scope: ScheduleFilterScope.schedulePage,
                userId: userId,
              ).notifier,
            )
            .loadNext();
      } finally {
        isLoadingNext.value = false;
      }
    }

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
          unawaited(loadPrevious());
        }
        // 하단 로드
        else if (metrics.pixels >= metrics.maxScrollExtent - 20 &&
            hasNext &&
            canLoad()) {
          unawaited(loadNext());
        }

        return false; // 이벤트를 소비하지 않고 상위 위젯으로 전달
      },
      child: CustomScrollView(
        controller: controller,
        physics: ClampingScrollPhysics(),
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
                    bottom: BorderSide(color: colorScheme.outline.subtle),
                  ),
                  color: colorScheme.surfaceContainerLow,
                ),
                child: Text(
                  '${DateFormat.MMMMd(Intl.getCurrentLocale()).format(group.date)} ${DateFormat.EEEE(Intl.getCurrentLocale()).format(group.date)}',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isPast
                        ? colorScheme.onSurface.muted
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

                    return ScheduleListItemWidget(
                      schedule: schedule,
                      isPast: isPast,
                      selectedSchedule: selectedSchedule,
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
