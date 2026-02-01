import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(
        Duration(milliseconds: 2000),
        () => ref.read(authControllerProvider.notifier).init(),
      );
      return null;
    }, []);

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(child: Logo()),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: SvgPicture.asset(
              'assets/icons/dantech_ci${MediaQuery.of(context).platformBrightness == Brightness.dark ? '_dark' : ''}.svg',
              width: 64.0,
            ),
          ),
        ],
      ),
    );
  }
}
