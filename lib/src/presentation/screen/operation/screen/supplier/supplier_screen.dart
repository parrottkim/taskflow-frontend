import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ClientScreen extends ConsumerWidget {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(projectFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(clientItems: value.clientItems),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(child: _DesktopWidget(clientItems: [])),
    };
  }
}

class _DesktopWidget extends StatelessWidget {
  final List<ClientGroup> clientItems;

  const _DesktopWidget({required this.clientItems});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
