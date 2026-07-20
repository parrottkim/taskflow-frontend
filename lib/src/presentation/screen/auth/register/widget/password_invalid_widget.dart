import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class PasswordInvalidWidget extends StatelessWidget {
  final String password;
  final List<ValidationItem> items;

  const PasswordInvalidWidget({
    super.key,
    required this.password,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: Duration(milliseconds: 300),
      padding: password.isNotEmpty && items.any((item) => !item.flag)
          ? EdgeInsets.only(bottom: 24.0)
          : EdgeInsets.zero,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) => ValidationListItem(
          visible: password.isNotEmpty,
          item: items[index],
        ),
      ),
    );
  }
}

class ValidationListItem extends HookWidget {
  final bool visible;
  final ValidationItem item;

  const ValidationListItem({
    super.key,
    required this.visible,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (visible && !item.flag) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
      return null;
    }, [visible, item.flag]);

    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: sizeController,
        curve: Curves.easeInQuad,
      ),
      child: FadeTransition(
        opacity: opacityController,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Icon(Symbols.check_circle_rounded, color: colorScheme.error),
              const SizedBox(width: 8.0),
              Text(
                item.label,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
