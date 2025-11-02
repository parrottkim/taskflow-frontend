import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/router/router.dart';

class NewTripButton extends StatelessWidget {
  const NewTripButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        final state = GoRouterState.of(context);
        final projectId = state.pathParameters['project_id'];

        context.goNamed(RouteNames.tripNew,
            pathParameters: {'project_id': projectId!});
      },
      icon: Icon(Symbols.add_rounded),
      label: Text(
        Intl.message('trip_new'),
      ),
    );
  }
}
