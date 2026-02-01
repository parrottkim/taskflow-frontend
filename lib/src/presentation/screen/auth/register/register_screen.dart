import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskflow/src/presentation/layout/fractionally_layout.dart';
import 'package:taskflow/src/presentation/screen/auth/register/widget/register_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final path = state.uri.queryParameters['redirect_to'];

    return FractionallyLayout(
      child: Scaffold(
        appBar: AppBar(),
        body: RegisterFormWidget(path: path),
      ),
    );
  }
}
