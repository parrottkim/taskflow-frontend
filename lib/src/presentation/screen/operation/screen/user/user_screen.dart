import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/operation/screen/user/widget/user_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/operation/screen/user/widget/user_list_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userListControllerProvider);

    return switch (user) {
      AsyncData(:final value) => _DesktopWidget(items: value.items),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(items: List.filled(30, User.dummy())),
      ),
    };
  }
}

class _DesktopWidget extends ConsumerWidget {
  final List<User> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userSubmitControllerProvider, (_, state) {
      if (state is UserSubmitPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();

        if (state is UserSubmitSuccess) {
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message('operation_user_success'),
                ),
              );
        }

        if (state is UserSubmitDeleted) {
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('operation_user_delete'),
                ),
              );
        }
      }
    });

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [UserFilterWidget(), SizedBox(height: 8.0), UserListWidget()],
      ),
    );
  }
}
