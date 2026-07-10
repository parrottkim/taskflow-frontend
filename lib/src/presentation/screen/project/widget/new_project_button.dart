import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/router/router.dart';

class NewProjectButton extends StatelessWidget {
  const NewProjectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        context.goNamed(RouteNames.projectNew);
      },
      icon: Icon(Symbols.add_rounded),
      label: Text(Intl.message('project_new')),
    );
  }
}
