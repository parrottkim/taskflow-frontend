import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ScheduleWidget extends ConsumerWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final calendar = ref.watch(calendarControllerProvider);

    return LayoutBuilder(
      builder: (context, constraints) => ContainerWidget(
        elevation: 0.0,
        padding: EdgeInsets.zero,
        height: Responsive.isDesktop(context) ? constraints.maxHeight : 300.0,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Intl.message('dashboard_schedule'),
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        DateFormat.yMMMd(Intl.getCurrentLocale())
                            .format(DateTime.now()),
                        style: TextStyle(
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.0),
                switch (calendar) {
                  AsyncData(:final value) => _DesktopWidget(items: value.items),
                  AsyncError(:final error, :final stackTrace) => Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: ErrorContainerWidget(
                        error: error,
                        stackTrace: stackTrace,
                      ),
                    ),
                  _ => Skeletonizer(
                      child: _DesktopWidget(
                          items: List.filled(5, Schedule.dummy()))),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DesktopWidget extends HookWidget {
  final List<Schedule> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final Map<ScheduleCategory, List<Schedule>> groupedItems = {};
    for (var item in items) {
      if (!groupedItems.containsKey(item.category)) {
        groupedItems[item.category] = [];
      }
      groupedItems[item.category]!.add(item);
    }

    if (items.isEmpty) {
      return Padding(
        padding:
            EdgeInsets.only(top: Responsive.isDesktop(context) ? 60.0 : 40.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Symbols.nights_stay_rounded,
                size: 40.0,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              const SizedBox(height: 8.0),
              Text(
                Intl.message('dashboard_no_schedule'),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: groupedItems.keys.length,
      itemBuilder: (context, index) {
        final category = groupedItems.keys.elementAt(index);
        final itemsForCategory = groupedItems[category]!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Skeleton.unite(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 8.0, right: 10.0, top: 2.0, bottom: 2.0),
                    decoration: ShapeDecoration(
                      shape: StadiumBorder(),
                      color: Functions(context)
                          .generateColorFromId(category.id)
                          .withValues(alpha: 0.2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          category is ScheduleDomestic
                              ? Symbols.emoji_transportation_rounded
                              : Symbols.flight_takeoff_rounded,
                          fill: 0.0,
                          size: 16.0,
                          color: Functions(context)
                              .generateColorFromId(category.id),
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          Intl.message('schedule_new_choose_${category.id}_1'),
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Functions(context)
                                .generateColorFromId(category.id),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: itemsForCategory.length,
                itemBuilder: (context, index) {
                  final item = itemsForCategory[index];

                  return Skeleton.unite(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Functions(context)
                            .generateColorFromId(category.id)
                            .withValues(alpha: 0.1),
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Container(
                                width: 4.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Functions(context)
                                      .generateColorFromId(category.id),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          item.user.username,
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Functions(context)
                                                .generateColorFromId(
                                                    category.id),
                                          ),
                                        ),
                                        Text(
                                          ' | ',
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Functions(context)
                                                .generateColorFromId(
                                                    category.id),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            item.summary,
                                            maxLines: 1,
                                            style:
                                                textTheme.bodyMedium?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Functions(context)
                                                  .generateColorFromId(
                                                      category.id),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.0),
                                    Row(
                                      children: [
                                        Icon(
                                          item.end
                                                      .difference(item.start)
                                                      .inDays >
                                                  1
                                              ? Symbols.date_range_rounded
                                              : Symbols.event_rounded,
                                          size: 16.0,
                                          color: Functions(context)
                                              .generateColorFromId(category.id)
                                              .withValues(alpha: 0.7),
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          item.end
                                                      .difference(item.start)
                                                      .inDays >
                                                  1
                                              ? '${DateFormat.MEd().format(item.start)} - ${DateFormat.MEd().format(item.end)}'
                                              : DateFormat.MEd()
                                                  .format(item.start),
                                          style: textTheme.bodySmall?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Functions(context)
                                                .generateColorFromId(
                                                    category.id)
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.0),
                                    Row(
                                      children: [
                                        Icon(
                                          Symbols.location_on_rounded,
                                          size: 16.0,
                                          color: Functions(context)
                                              .generateColorFromId(category.id)
                                              .withValues(alpha: 0.7),
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          item.projectClientName,
                                          style: textTheme.bodySmall?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Functions(context)
                                                .generateColorFromId(
                                                    category.id)
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 8.0),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => SizedBox(height: 12.0),
    );
  }
}
