import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';

class UserDepartmentFilterWidget extends HookConsumerWidget {
  final List<UserDepartment> departmentItems;

  const UserDepartmentFilterWidget({super.key, required this.departmentItems});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [null, ...departmentItems];

    final selectedItem = useState<UserDepartment?>(items.first);

    final controller = useTabController(
      initialLength: items.length,
    );

    return TabBar(
      controller: controller,
      onTap: (index) async {
        selectedItem.value = items[index];

        ref
            .read(userFilterControllerProvider.notifier)
            .updateDepartment(department: selectedItem.value);
      },
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
      tabs: List.generate(
        items.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(items[index]?.name ??
              Intl.message('project_form_user_department_all')),
        ),
      ),
    );
  }
}
