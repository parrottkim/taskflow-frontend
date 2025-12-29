import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class HeadlineWidget extends HookConsumerWidget {
  final Project project;

  const HeadlineWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final isNameHovered = useState(false);
    final isCodeHovered = useState(false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: project.name));

            ref.read(toastProvider).showToast(
                  child: Toast(
                    type: ToastType.standard,
                    message: Intl.message('common_copied'),
                  ),
                );
          },
          onHover: (value) {
            isNameHovered.value = value;
          },
          borderRadius: BorderRadius.circular(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  project.name,
                  maxLines: Responsive.isMobile(context) ? 2 : 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Responsive.isMobile(context) ? 20.0 : 28.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (isNameHovered.value)
                Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Icon(
                    Symbols.content_copy_rounded,
                    size: 20.0,
                    color: colorScheme.outline.withValues(alpha: 0.7),
                  ),
                ),
            ],
          ),
        ),
        InkWell(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: project.code));

            ref.read(toastProvider).showToast(
                  child: Toast(
                    type: ToastType.standard,
                    message: Intl.message('common_copied'),
                  ),
                );
          },
          onHover: (value) {
            isCodeHovered.value = value;
          },
          borderRadius: BorderRadius.circular(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                project.code,
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              if (isCodeHovered.value)
                Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: Icon(
                    Symbols.content_copy_rounded,
                    size: 12.0,
                    color: colorScheme.outline.withValues(alpha: 0.7),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
