import 'package:flutter/material.dart';

class FractionallyLayout extends StatelessWidget {
  final Widget child;

  const FractionallyLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.surfaceContainerLow,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 430),
          child: child,
        ),
      ),
    );
  }
}
