import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ManagerSelectWidget extends ConsumerWidget {
  final int? projectId;
  final User? selectedManager;

  const ManagerSelectWidget({
    super.key,
    this.projectId,
    required this.selectedManager,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _DesktopWidget(
      projectId: projectId,
      selectedManager: selectedManager,
    );
  }
}

class _DesktopWidget extends ConsumerWidget {
  final int? projectId;
  final User? selectedManager;

  const _DesktopWidget({this.projectId, required this.selectedManager});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => showDialog(
        context: context,
        builder: (_) => UserSelectorDialog(
          selectionType: UserSelectionType.single,
          onSingleSelected: (user) {
            ref
                .read(
                  projectFormControllerProvider(projectId: projectId).notifier,
                )
                .setManager(manager: user);
          },
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 12.0,
          top: 16.0,
          bottom: 16.0,
        ),
      ),
      icon: selectedManager == null
          ? Icon(Symbols.person_search_rounded)
          : CircleAvatar(
              backgroundColor: Functions(
                context,
              ).generateColorFromId(selectedManager!.id),
              radius: 10.0,
              child: Text(
                getInitials(selectedManager!.username),
                style: TextStyle(fontSize: 10.0, color: Colors.white),
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
            Icon(Symbols.chevron_right_rounded)
          else
            InkWell(
              onTap: () {
                ref
                    .read(
                      projectFormControllerProvider(
                        projectId: projectId,
                      ).notifier,
                    )
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
