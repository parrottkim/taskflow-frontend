import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/layout/fractionally_layout.dart';
import 'package:taskflow/src/presentation/screen/auth/forgot_password/widget/forgot_password_form_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final String? path;

  const ForgotPasswordScreen({super.key, this.path});

  @override
  Widget build(BuildContext context) {
    return FractionallyLayout(
      child: Scaffold(
        appBar: AppBar(),
        body: PasswordFormWidget(path: path),
      ),
    );
  }
}
