import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class LoginInvalidWidget extends HookWidget {
  final bool visible;

  const LoginInvalidWidget({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (visible) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
      return null;
    }, [visible]);

    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: sizeController,
        curve: Curves.easeInQuad,
      ),
      child: FadeTransition(
        opacity: opacityController,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          margin: const EdgeInsets.only(bottom: 16.0),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: colorScheme.error,
          ),
          child: Text(
            Intl.message('login_invalid'),
            textAlign: TextAlign.center,
            style: textTheme.labelLarge?.copyWith(color: colorScheme.onError),
          ),
        ),
      ),
    );
  }
}
