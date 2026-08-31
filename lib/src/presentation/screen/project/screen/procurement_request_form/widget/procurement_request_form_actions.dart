import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ProcurementRequestFormActions extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final VoidCallback? onDelete;

  const ProcurementRequestFormActions({
    super.key,
    required this.label,
    required this.onPressed,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Container(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 16.0,
            bottom: 32.0,
          ),
          constraints: const BoxConstraints(maxWidth: 430.0),
          child: Row(
            children: [
              Expanded(
                child: FilledButton(onPressed: onPressed, child: Text(label)),
              ),
              if (onDelete != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: FilledButton(
                    onPressed: onDelete,
                    style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.error,
                      iconColor: colorScheme.onError,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Icon(Symbols.delete_rounded, size: 19.0),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
