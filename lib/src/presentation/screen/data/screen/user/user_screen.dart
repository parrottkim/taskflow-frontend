import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/user_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/data/screen/user/widget/user_list_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [UserFilterWidget(), SizedBox(height: 8.0), UserListWidget()],
      ),
    );
  }
}
