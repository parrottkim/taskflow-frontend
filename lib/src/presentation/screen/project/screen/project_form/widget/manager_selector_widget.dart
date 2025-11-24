import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_form/widget/manager_selector_dialog.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ManagerSelectorWidget extends ConsumerWidget {
  final int? projectId;
  final User? selectedManager;

  const ManagerSelectorWidget({
    super.key,
    this.projectId,
    required this.selectedManager,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(userFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
          projectId: projectId,
          selectedManager: selectedManager,
          departmentItems: value.departmentItems,
          positionItems: value.positionItems,
        ),
      _ => Skeletonizer(
          ignoreContainers: true,
          child: _DesktopWidget(
            selectedManager: selectedManager,
            departmentItems: [],
            positionItems: [],
          ),
        ),
    };
  }
}

class _DesktopWidget extends ConsumerWidget {
  final int? projectId;
  final User? selectedManager;
  final List<UserDepartment> departmentItems;
  final List<UserPosition> positionItems;

  const _DesktopWidget({
    this.projectId,
    required this.selectedManager,
    required this.departmentItems,
    required this.positionItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => showDialog(
        context: context,
        builder: (_) => ManagerSelectorDialog(
          projectId: projectId,
          departmentItems: departmentItems,
          positionItems: positionItems,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding:
            EdgeInsets.only(left: 16.0, right: 12.0, top: 16.0, bottom: 16.0),
      ),
      icon: selectedManager == null
          ? Icon(
              Symbols.person_search_rounded,
            )
          : CircleAvatar(
              backgroundColor:
                  Functions(context).generateColorFromId(selectedManager!.id),
              radius: 10.0,
              child: Text(
                getInitials(selectedManager!.username),
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.white,
                ),
              ),
            ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectedManager == null
                ? Intl.message('project_form_user_search')
                : selectedManager!.username,
          ),
          SizedBox(width: 8.0),
          if (selectedManager == null)
            Icon(
              Symbols.chevron_right_rounded,
            )
          else
            InkWell(
              onTap: () {
                ref
                    .read(projectFormControllerProvider(projectId: projectId)
                        .notifier)
                    .setManager(manager: null);
              },
              borderRadius: BorderRadius.circular(4.0),
              child: const Icon(Symbols.close_rounded),
            ),
        ],
      ),
    );
  }
}
