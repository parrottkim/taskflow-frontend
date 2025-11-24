import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/work/screen/schedule_form/widget/project_selector_dialog.dart';
import 'package:taskflow/src/presentation/widget/preset.dart';

class ProjectSelectorWidget extends ConsumerWidget {
  final int categoryId;
  final int? scheduleId;
  final String? projectName;
  final int? projectClientId;
  final String? projectClientName;

  const ProjectSelectorWidget({
    super.key,
    required this.categoryId,
    this.scheduleId,
    this.projectName,
    this.projectClientId,
    this.projectClientName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(projectFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
          categoryId: categoryId,
          scheduleId: scheduleId,
          projectName: projectName,
          projectClientId: projectClientId,
          projectClientName: projectClientName,
          clientItems: value.clientItems,
        ),
      _ => Skeletonizer(
          ignoreContainers: true,
          child: _DesktopWidget(
            categoryId: categoryId,
            scheduleId: scheduleId,
            clientItems: [],
          ),
        ),
    };
  }
}

class _DesktopWidget extends ConsumerWidget {
  final int categoryId;
  final int? scheduleId;
  final String? projectName;
  final int? projectClientId;
  final String? projectClientName;
  final List<ClientGroup> clientItems;

  const _DesktopWidget({
    required this.categoryId,
    this.scheduleId,
    this.projectName,
    this.projectClientId,
    this.projectClientName,
    required this.clientItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => ProjectSelectorDialog(
            categoryId: categoryId,
            scheduleId: scheduleId,
            clientItems: clientItems,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding:
            EdgeInsets.only(left: 16.0, right: 12.0, top: 16.0, bottom: 16.0),
      ),
      icon: projectClientId == null
          ? Icon(Symbols.work_rounded)
          : Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Color(
                  ClientType.values
                      .singleWhere((client) => client.id == projectClientId)
                      .color,
                ),
              ),
              child: SizedBox(
                width: 12.0,
                height: 12.0,
                child: SvgPicture.asset(
                  ClientType.values
                      .singleWhere((client) => client.id == projectClientId)
                      .asset,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (projectClientId == null)
            Text(Intl.message('schedule_form_project_search'))
          else
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: projectClientName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 4.0),
                  ),
                  TextSpan(
                    text: projectName,
                  ),
                ],
              ),
            ),
          SizedBox(width: 8.0),
          if (projectClientId == null)
            Icon(
              Symbols.chevron_right_rounded,
            )
          else
            InkWell(
              onTap: () {
                ref
                    .read(scheduleFormControllerProvider(
                            categoryId: categoryId, scheduleId: scheduleId)
                        .notifier)
                    .setProject(project: null);
              },
              borderRadius: BorderRadius.circular(4.0),
              child: const Icon(Symbols.close_rounded),
            ),
        ],
      ),
    );
  }
}
