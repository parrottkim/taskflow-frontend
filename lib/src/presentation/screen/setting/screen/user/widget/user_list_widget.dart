import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/setting/screen/user/widget/department_select_widget.dart';
import 'package:taskflow/src/presentation/screen/setting/screen/user/widget/position_select_widget.dart';
import 'package:taskflow/src/presentation/screen/setting/screen/user/widget/user_admin_toggle_dialog.dart';
import 'package:taskflow/src/presentation/screen/setting/screen/user/widget/user_approve_toggle_dialog.dart';
import 'package:taskflow/src/presentation/screen/setting/screen/user/widget/user_delete_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class UserListWidget extends ConsumerWidget {
  const UserListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(userListControllerProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ContainerWidget(
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(8.0),
          child: switch (list) {
            AsyncData(:final value) => _DesktopWidget(items: value.items),
            AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
              error: error,
              stackTrace: stackTrace,
            ),
            _ => Skeletonizer(
              child: _DesktopWidget(items: List.filled(30, User.dummy())),
            ),
          },
        ),
      ),
    );
  }
}

class _DesktopWidget extends ConsumerWidget {
  final List<User> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    ref.listen(userSubmitControllerProvider, (_, state) {
      if (state is UserSubmitPending) {
        LoadingOverlay.show(context);
        return;
      }

      LoadingOverlay.hide();

      ref
          .read(toastProvider)
          .showToast(
            child: Toast(
              type: ToastType.verified,
              message: Intl.message(switch (state) {
                UserSubmitEdited() => 'setting_user_success',
                UserSubmitDeleted() => 'setting_user_deleted',
                _ => '',
              }),
            ),
          );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Skeleton.keep(
          child: DataTable(
            headingRowHeight: 48.0,
            showCheckboxColumn: false,
            columns: [
              DataColumn(
                columnWidth: FlexColumnWidth(),
                label: Text(
                  Intl.message('setting_user_column_1'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(),
                label: Text(
                  Intl.message('setting_user_column_2'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(),
                label: Text(
                  Intl.message('setting_user_column_3'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(),
                label: Text(
                  Intl.message('setting_user_column_4'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FixedColumnWidth(100.0),
                label: Text(
                  Intl.message('setting_user_column_5'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FixedColumnWidth(100.0),
                label: Text(
                  Intl.message('setting_user_column_6'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FixedColumnWidth(80.0),
                label: Text(
                  Intl.message('setting_user_column_7'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ],
            rows: [],
          ),
        ),
        Divider(),
        if (items.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/empty.svg',
                    width: 40.0,
                    height: 40.0,
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSurface.withValues(alpha: 0.7),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(Intl.message('setting_user_no_item')),
                ],
              ),
            ),
          )
        else
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels >=
                    notification.metrics.maxScrollExtent - 20.0) {
                  ref.read(userListControllerProvider.notifier).load();
                }
                return false;
              },
              child: SingleChildScrollView(
                child: DataTable(
                  headingRowHeight: 0.0,
                  showCheckboxColumn: false,
                  columns: [
                    DataColumn(
                      columnWidth: FlexColumnWidth(),
                      label: Text(Intl.message('setting_user_column_1')),
                    ),
                    DataColumn(
                      columnWidth: FlexColumnWidth(),
                      label: Text(Intl.message('setting_user_column_2')),
                    ),
                    DataColumn(
                      columnWidth: FlexColumnWidth(),
                      label: Text(Intl.message('setting_user_column_3')),
                    ),
                    DataColumn(
                      columnWidth: FlexColumnWidth(),
                      label: Text(Intl.message('setting_user_column_4')),
                    ),
                    DataColumn(
                      columnWidth: FixedColumnWidth(100.0),
                      label: Text(Intl.message('setting_user_column_5')),
                    ),
                    DataColumn(
                      columnWidth: FixedColumnWidth(100.0),
                      label: Text(Intl.message('setting_user_column_6')),
                    ),
                    DataColumn(
                      columnWidth: FixedColumnWidth(80.0),
                      label: Text(Intl.message('setting_user_column_7')),
                    ),
                  ],
                  rows: List.generate(
                    items.length,
                    (index) => DataRow(
                      onSelectChanged: (value) {},
                      cells: [
                        DataCell(
                          Row(
                            children: [
                              Skeleton.unite(
                                child: CircleAvatar(
                                  backgroundColor: Functions(
                                    context,
                                  ).generateColorFromId(items[index].id),
                                  radius: 16.0,
                                  child: Text(
                                    getInitials(items[index].username),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                items[index].username,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(items[index].email)),
                        DataCell(PositionSelectWidget(user: items[index])),
                        DataCell(DepartmentSelectWidget(user: items[index])),
                        DataCell(
                          CustomToggleButton(
                            value: items[index].isAdmin,
                            onChanged: (value) async {
                              final result = await showDialog(
                                context: context,
                                builder: (_) => UserAdminToggleDialog(),
                              );

                              if (result) {
                                await ref
                                    .read(userSubmitControllerProvider.notifier)
                                    .toggleAdmin(
                                      userId: items[index].id,
                                      flag: value ?? false,
                                    );
                              }
                            },
                          ),
                        ),
                        DataCell(
                          CustomToggleButton(
                            value: items[index].isAuthorized,
                            onChanged: (value) async {
                              final result = await showDialog(
                                context: context,
                                builder: (_) => UserApproveToggleDialog(),
                              );

                              if (result) {
                                await ref
                                    .read(userSubmitControllerProvider.notifier)
                                    .toggleAuthorized(
                                      userId: items[index].id,
                                      flag: value ?? false,
                                    );
                              }
                            },
                          ),
                        ),
                        DataCell(
                          ElevatedIconButton(
                            onTap: () async {
                              final result = await showDialog(
                                context: context,
                                builder: (_) => UserDeleteDialog(),
                              );

                              if (result) {
                                await ref
                                    .read(userSubmitControllerProvider.notifier)
                                    .deleteUser(userId: items[index].id);
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
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
