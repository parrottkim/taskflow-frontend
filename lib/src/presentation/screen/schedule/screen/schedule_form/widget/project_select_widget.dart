import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/schedule_form/widget/project_select_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ProjectSelectWidget extends ConsumerWidget {
  final int categoryId;
  final int? scheduleId;
  final String? projectName;
  final int? projectClientId;
  final String? projectClientName;

  const ProjectSelectWidget({
    super.key,
    required this.categoryId,
    this.scheduleId,
    this.projectName,
    this.projectClientId,
    this.projectClientName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(projectOptionsProvider);

    return switch (options) {
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
        child: _DesktopWidget(categoryId: categoryId, clientItems: []),
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
          builder: (_) => ProjectSelectDialog(
            categoryId: categoryId,
            scheduleId: scheduleId,
            clientItems: clientItems,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 12.0,
          top: 16.0,
          bottom: 16.0,
        ),
      ),
      icon: projectClientId == null
          ? Icon(Symbols.work_rounded)
          : Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Color(ClientBrand.fromKey(projectClientId!).color),
              ),
              child: SizedBox(
                width: 12.0,
                height: 12.0,
                child: SvgPicture.asset(
                  ClientBrand.fromKey(projectClientId!).asset,
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
            Flexible(
              child: Text.rich(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                TextSpan(
                  children: [
                    TextSpan(
                      text: projectClientName,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    WidgetSpan(child: SizedBox(width: 4.0)),
                    TextSpan(text: projectName),
                  ],
                ),
              ),
            ),
          SizedBox(width: 8.0),
          if (projectClientId == null)
            Icon(Symbols.chevron_right_rounded)
          else
            InkWell(
              onTap: () {
                ref
                    .read(
                      scheduleFormControllerProvider(
                        categoryId: categoryId,
                        scheduleId: scheduleId,
                      ).notifier,
                    )
                    .setProject(
                      projectId: null,
                      projectName: null,
                      projectClientId: null,
                      projectClientName: null,
                    );
              },
              borderRadius: BorderRadius.circular(4.0),
              child: const Icon(Symbols.close_rounded),
            ),
        ],
      ),
    );
  }
}
