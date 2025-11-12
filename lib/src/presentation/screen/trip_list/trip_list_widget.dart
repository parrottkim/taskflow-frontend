import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/trip_list/widget/schedule_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_list/widget/toolbar_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_list/widget/trip_item_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_list/widget/user_information_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class TripListWidget extends ConsumerWidget {
  final int projectId;
  final int? tripId;

  const TripListWidget({super.key, required this.projectId, this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripListControllerProvider(projectId: projectId));

    return switch (trip) {
      AsyncData(:final value) => _DesktopWidget(
          projectId: projectId,
          tripId: tripId,
          items: value.items,
        ),
      AsyncError(:final error, :final stackTrace) =>
        ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(
          child: _DesktopWidget(
            projectId: projectId,
            items: List.filled(
              1,
              Trip.dummy(),
            ),
          ),
        ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int projectId;
  final int? tripId;
  final List<Trip> items;

  const _DesktopWidget({
    required this.projectId,
    this.tripId,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);

    final colorScheme = Theme.of(context).colorScheme;

    final selected = useState<int?>(tripId);
    final itemKeys = useMemoized<Map<int, GlobalKey>>(() {
      final Map<int, GlobalKey> keys = {};
      for (final issue in items) {
        keys[issue.id] = GlobalKey();
      }
      return keys;
    }, [items]);

    final controller = PrimaryScrollController.of(context);

    useEffect(() {
      selected.value = tripId;

      if (selected.value != null && items.any((i) => i.id == selected.value)) {
        Future.microtask(() async {
          await WidgetsBinding.instance.endOfFrame;

          final ctx = itemKeys[selected.value]?.currentContext;
          if (ctx == null) return;

          // ⭐️ ScrollController를 사용하는 로직으로 변경
          if (controller.hasClients) {
            final renderBox = ctx.findRenderObject() as RenderBox;
            final viewport = context.findRenderObject() as RenderBox;
            final targetOffset =
                renderBox.localToGlobal(Offset.zero, ancestor: viewport).dy -
                    60.0;

            controller.animateTo(
              targetOffset + controller.offset,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInQuad,
            );
          }
        });
      }
      return null;
    }, [tripId, items]);

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
              Intl.message('project_detail_no_trip'),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        selected.value = null;
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels >=
              notification.metrics.maxScrollExtent - 20.0) {
            ref
                .read(tripListControllerProvider(projectId: projectId).notifier)
                .load();
          }
          return false;
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Responsive.isDesktop(context) ? 16.0 : 8.0),
          child: Column(
            children: List.generate(
              items.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                    bottom: index < items.length - 1 ? 8.0 : 0.0),
                child: Row(
                  key: itemKeys[items[index].id],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isDesktop(context))
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Skeleton.unite(
                          child: CircleAvatar(
                            backgroundColor: Functions(context)
                                .generateColorFromId(items[index].user.id),
                            radius: 16.0,
                            child: Text(
                              getInitials(items[index].user.username),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: items[index].id == selected.value
                                ? colorScheme.primary
                                : Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                        child: ContainerWidget(
                          elevation: 0.0,
                          padding: EdgeInsets.zero,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 12.0,
                                  top: 4.0,
                                  bottom: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                  color: auth is AuthAuthenticated &&
                                          auth.user == items[index].user
                                      ? colorScheme.primary
                                          .withValues(alpha: 0.1)
                                      : colorScheme.surfaceContainerLow,
                                ),
                                child: Row(
                                  children: [
                                    UserInformationWidget(
                                        item: items[index].user),
                                    const Spacer(),
                                    ToolbarWidget(
                                      projectId: projectId,
                                      item: items[index],
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              SizedBox(height: 16.0),
                              ScheduleWidget(schedule: items[index].schedule),
                              SizedBox(height: 16.0),
                              TripItemWidget(
                                item: items[index],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
