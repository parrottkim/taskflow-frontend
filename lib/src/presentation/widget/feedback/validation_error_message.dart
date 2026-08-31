part of '../widget.dart';

class ValidationErrorMessage extends HookWidget {
  final bool visible;
  final String text;

  const ValidationErrorMessage({
    super.key,
    required this.visible,
    required this.text,
  });

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
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            children: [
              Icon(Symbols.error_rounded, size: 16.0, color: colorScheme.error),
              const SizedBox(width: 4.0),
              Text(
                text,
                style: textTheme.bodySmall?.copyWith(
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
