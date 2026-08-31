import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/department_select_widget.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/position_select_widget.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/rank_select_widget.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/user_admin_toggle_dialog.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/user_approve_toggle_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class UserListWidget extends ConsumerWidget {
  const UserListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(
      userListControllerProvider(UserFilterScope.dataPage),
    );
    final options = ref.watch(userOptionsProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ContentContainer(
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(8.0),
          child: switch ((list, options)) {
            (AsyncData(value: final list), AsyncData(value: final options)) =>
              _DesktopWidget(
                items: list.items,
                rankItems: options.rankItems,
                positionItems: options.positionItems,
                departmentItems: options.departmentItems,
              ),
            (AsyncError(:final error, :final stackTrace), _) ||
            (
              _,
              AsyncError(:final error, :final stackTrace),
            ) => ErrorStateView(error: error, stackTrace: stackTrace),
            _ => Skeletonizer(
              child: _DesktopWidget(
                items: List.filled(30, User.dummy()),
                rankItems: const [],
                positionItems: const [],
                departmentItems: const [],
              ),
            ),
          },
        ),
      ),
    );
  }
}

class _DesktopWidget extends ConsumerWidget {
  final List<User> items;
  final List<UserRank> rankItems;
  final List<UserPosition> positionItems;
  final List<UserDepartment> departmentItems;

  const _DesktopWidget({
    required this.items,
    required this.rankItems,
    required this.positionItems,
    required this.departmentItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FixedHeaderDataTable(
      columns: [
        DataTableColumnConfig(
          label: Intl.message('data_user_column_1'),
          width: const FixedColumnWidth(160.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('data_user_column_2'),
          width: const FixedColumnWidth(220.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('data_user_column_3'),
          width: const FlexColumnWidth(),
        ),
        DataTableColumnConfig(
          label: Intl.message('data_user_column_4'),
          width: const FlexColumnWidth(),
        ),
        DataTableColumnConfig(
          label: Intl.message('data_user_column_5'),
          width: const FlexColumnWidth(),
        ),
        DataTableColumnConfig(
          label: Intl.message('data_user_column_6'),
          width: const FixedColumnWidth(100.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('data_user_column_7'),
          width: const FixedColumnWidth(100.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('data_user_column_8'),
          width: const FixedColumnWidth(80.0),
        ),
      ],
      rows: [
        for (final item in items)
          DataRow(
            onSelectChanged: (value) {},
            cells: [
              DataCell(
                Row(
                  children: [
                    Skeleton.unite(
                      child: CircleAvatar(
                        backgroundColor: Functions(
                          context,
                        ).generateColorFromId(item.id),
                        radius: 16.0,
                        child: Text(
                          getInitials(item.username),
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      item.username,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              DataCell(Text(item.email)),
              DataCell(RankSelectWidget(user: item, items: rankItems)),
              DataCell(PositionSelectWidget(user: item, items: positionItems)),
              DataCell(
                DepartmentSelectWidget(user: item, items: departmentItems),
              ),
              DataCell(
                AppToggleButton(
                  value: item.isAdmin,
                  onChanged: (value) async {
                    final result = await showDialog(
                      context: context,
                      builder: (_) => UserAdminToggleDialog(),
                    );

                    if (result) {
                      await ref
                          .read(userSubmitControllerProvider.notifier)
                          .toggleAdmin(userId: item.id, flag: value);
                    }
                  },
                ),
              ),
              DataCell(
                AppToggleButton(
                  value: item.isAuthorized,
                  onChanged: (value) async {
                    final result = await showDialog(
                      context: context,
                      builder: (_) => UserApproveToggleDialog(),
                    );

                    if (result) {
                      await ref
                          .read(userSubmitControllerProvider.notifier)
                          .toggleAuthorized(userId: item.id, flag: value);
                    }
                  },
                ),
              ),
              DataCell(
                ElevatedIconButton(
                  onTap: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (_) => DeleteDialog(
                        title: Intl.message('data_user_delete_dialog_1'),
                        content: Intl.message('data_user_delete_dialog_2'),
                      ),
                    );

                    if (result) {
                      await ref
                          .read(userSubmitControllerProvider.notifier)
                          .deleteUser(userId: item.id);
                    }
                  },
                  padding: EdgeInsets.all(4.0),
                  borderRadius: BorderRadius.circular(4.0),
                  icon: Symbols.delete_rounded,
                  size: 20.0,
                ),
              ),
            ],
          ),
      ],
      empty: EmptyStateView(message: Intl.message('data_user_no_item')),
      onLoadMore: () => ref
          .read(userListControllerProvider(UserFilterScope.dataPage).notifier)
          .load(),
    );
  }
}
