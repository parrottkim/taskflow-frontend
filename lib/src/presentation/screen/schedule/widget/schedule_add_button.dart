import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/router/router.dart';

class ScheduleAddButton extends StatelessWidget {
  const ScheduleAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        context.goNamed(RouteNames.scheduleNewChoose);
      },
      icon: Icon(Symbols.add_rounded),
      label: Text(Intl.message('schedule_new')),
    );
  }
}
