import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ClosureDialog extends HookConsumerWidget {
  final Project project;

  const ClosureDialog({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final controller = useTextEditingController();

    final message = useListenableSelector(controller, () => controller.text);

    return Dialog(
      child: ContainerWidget(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: const BoxConstraints(maxWidth: 430.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                Intl.message('issue_new_choose_8'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerWidget(
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                    color: colorScheme.errorContainer,
                    borderColor: colorScheme.error,
                    child: Row(
                      children: [
                        Icon(
                          Symbols.warning_rounded,
                          size: 20.0,
                          color: colorScheme.error,
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            Intl.message('issue_new_choose_8_1'),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    Intl.message('issue_new_choose_8_2'),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    Intl.message('issue_new_choose_8_3'),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    Intl.message('issue_new_choose_8_4'),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    Intl.message('issue_new_choose_8_5'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: project.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(text: ' '),
                        TextSpan(
                          text: Intl.message('issue_new_choose_8_6'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: controller,
                    maxLines: 1,
                  ),
                  SizedBox(height: 8.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: message.isNotEmpty
                          ? () {
                              ref
                                  .read(
                                      projectSubmitControllerProvider.notifier)
                                  .closeProject(
                                    projectId: project.id,
                                    closureMessage: controller.text,
                                  );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.error,
                      ),
                      child: Text(
                        Intl.message('issue_new_choose_8_7'),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
