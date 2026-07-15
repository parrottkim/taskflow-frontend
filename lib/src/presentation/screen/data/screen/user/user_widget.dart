import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/user_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/user_list_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class UserWidget extends ConsumerWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userSubmitControllerProvider, (_, state) {
      if (state is UserSubmitPending) {
        LoadingOverlay.show(context);
        return;
      }

      LoadingOverlay.hide();

      switch (state) {
        case UserSubmitUpdated():
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message('data_user_updated'),
                ),
              );

        case UserSubmitDeleted():
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('data_user_deleted'),
                ),
              );

        default:
          break;
      }
    });

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [UserFilterWidget(), SizedBox(height: 8.0), UserListWidget()],
      ),
    );
  }
}
