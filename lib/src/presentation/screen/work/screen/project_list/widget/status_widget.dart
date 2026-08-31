import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class StatusWidget extends ConsumerWidget {
  const StatusWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(workProjectFilterControllerProvider);

    return CupertinoSlidingSegmentedControl<ProjectStatusFilter>(
      groupValue: filter.status,
      onValueChanged: (status) {
        if (status == null || status == filter.status) return;

        ref
            .read(workProjectFilterControllerProvider.notifier)
            .setStaus(status: status);

        context.goNamed(
          RouteNames.work,
          queryParameters: context.buildQueryParameters(
            updates: {'status': status.key},
          ),
        );
      },
      children: {
        for (final status in ProjectStatusFilter.values)
          status: _ProjectSegment(status: status),
      },
    );
  }
}

class _ProjectSegment extends ConsumerWidget {
  final ProjectStatusFilter status;

  const _ProjectSegment({required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
      child: Text(status.label, style: textTheme.bodyMedium),
    );
  }
}
