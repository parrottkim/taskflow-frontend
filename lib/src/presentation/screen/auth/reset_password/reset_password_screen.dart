import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/fractionally_layout.dart';
import 'package:taskflow/src/presentation/screen/auth/reset_password/widget/reset_password_form_widget.dart';
import 'package:taskflow/src/presentation/screen/auth/reset_password/widget/retry_dialog.dart';

class ResetPasswordScreen extends ConsumerWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final path = state.uri.queryParameters['redirect_to'];
    final token = state.uri.queryParameters['token'];

    ref.listen(errorControllerProvider, (_, state) {
      if (state is ErrorUnauthorized &&
          state.message == 'reset_token_expired_or_invalid') {
        showDialog(context: context, builder: (_) => RetryDialog());
      }
    });

    return FractionallyLayout(
      child: Scaffold(
        appBar: AppBar(),
        body: ResetPasswordFormWidget(path: path, token: token),
      ),
    );
  }
}
