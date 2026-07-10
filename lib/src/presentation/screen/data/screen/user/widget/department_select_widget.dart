import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DepartmentSelectWidget extends ConsumerWidget {
  final User user;
  final List<UserDepartment> items;

  const DepartmentSelectWidget({
    super.key,
    required this.user,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Skeletonizer(
      ignoreContainers: true,
      enabled: items.isEmpty,
      child: SizedBox(
        width: 160.0,
        child: ElevatedDropdownButton<UserDepartment>(
          isExpanded: true,
          showClose: false,
          items: items,
          selectedItem: ValueNotifier(user.department),
          label: Text(Intl.message('data_user_column_3')),
          itemBuilder: (value) => Text(value.name),
          onChanged: (value) async {
            ref
                .read(userSubmitControllerProvider.notifier)
                .updateUser(userId: user.id, departmentId: value?.id);
          },
        ),
      ),
    );
  }
}
