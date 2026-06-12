import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/data/widget/overview_widget.dart';
import 'package:taskflow/src/router/router.dart';

class DataScreen extends HookConsumerWidget {
  final String? view;

  const DataScreen({super.key, this.view});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final location = GoRouter.of(context).name;

      if (location != RouteNames.data) return;

      Future.microtask(
        () => ref.read(dataFilterControllerProvider.notifier).init(view: view),
      );

      return null;
    }, [view]);

    return BranchLayout(child: _DesktopWidget());
  }
}

class _DesktopWidget extends StatelessWidget {
  const _DesktopWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.0),
      child: OverviewWidget(),
    );
  }
}
