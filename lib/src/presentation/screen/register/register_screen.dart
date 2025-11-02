import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/layout/fractionally_layout.dart';
import 'package:taskflow/src/presentation/screen/register/widget/register_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  final String? path;

  const RegisterScreen({
    super.key,
    this.path,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallyLayout(
      child: Scaffold(
        appBar: AppBar(),
        body: RegisterFormWidget(path: path),
      ),
    );
  }
}
