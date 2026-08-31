import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ScheduleProjectSelector extends HookConsumerWidget {
  final int categoryId;
  final int? scheduleId;
  final List<ProjectListItem> items;

  const ScheduleProjectSelector({
    super.key,
    required this.categoryId,
    this.scheduleId,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (items.isEmpty) {
      return EmptyStateView(
        message: Intl.message('schedule_form_project_emtpy'),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 20.0) {
          ref
              .read(
                projectListControllerProvider(
                  ProjectFilterScope.scheduleProjectSelector,
                ).notifier,
              )
              .load();
        }
        return false;
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            ref
                .read(
                  scheduleFormControllerProvider(
                    categoryId: categoryId,
                    scheduleId: scheduleId,
                  ).notifier,
                )
                .setProject(
                  projectId: items[index].id,
                  projectName: items[index].name,
                  projectClientId: items[index].clients.first.id,
                  projectClientName: items[index].clients.last.name,
                );
            context.pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton.leaf(
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color(
                        ClientBrand.fromKey(
                          items[index].clients.first.id,
                        ).color,
                      ),
                    ),
                    child: SizedBox(
                      width: 12.0,
                      height: 12.0,
                      child: SvgPicture.asset(
                        ClientBrand.fromKey(
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
                SizedBox(width: 4.0),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            items[index].clients.last.name,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 4.0),
                          Expanded(
                            child: Text(
                              items[index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        items[index].code,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.strong,
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
    );
  }
}
