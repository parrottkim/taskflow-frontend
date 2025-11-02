import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/dropdown.dart';

class UserPositionFilterWidget extends HookConsumerWidget {
  final List<UserPosition> positionItems;

  const UserPositionFilterWidget({
    super.key,
    required this.positionItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = useState<UserPosition?>(null);

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: ElevatedDropdownButton(
        onChanged: (value) {
          ref
              .read(userFilterControllerProvider.notifier)
              .updatePosition(position: value);
        },
        items: positionItems,
        selectedItem: selectedItem,
        icon: Icon(Symbols.chair_rounded),
        label: Text(Intl.message('project_form_user_position')),
        itemBuilder: (value) => Text(value.name),
      ),
    );
  }
}
