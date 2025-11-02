import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/dialog.dart';
import 'package:taskflow/src/presentation/widget/overlay.dart';
import 'package:taskflow/src/presentation/screen/login/widget/background_widget.dart';
import 'package:taskflow/src/presentation/screen/login/widget/login_form_widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class LoginScreen extends ConsumerWidget {
  final String? path;

  const LoginScreen({
    super.key,
    this.path,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (_, state) {
      if (state is AuthPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();
        if (state is AuthForbidden) {
          showDialog(
              context: context, builder: (_) => const LoginForbiddenDialog());
        }
        if (state is AuthRequest) {
          context.goNamed(
            RouteNames.login,
            queryParameters: {if (path != null) 'redirect_to': path},
          );

          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (_) => const LoginRequestDialog(),
            );
          });
        }
      }
    });

    return Responsive(
      desktop: _DesktopWidget(path: path),
      mobile: _MobileWidget(path: path),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final String? path;

  const _DesktopWidget({
    this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: LoginFormWidget(path: path),
          ),
          Expanded(
            child: BackgroundWidget(),
          ),
        ],
      ),
    );
  }
}

class _MobileWidget extends StatelessWidget {
  final String? path;

  const _MobileWidget({
    this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoginFormWidget(path: path),
      ),
    );
  }
}
