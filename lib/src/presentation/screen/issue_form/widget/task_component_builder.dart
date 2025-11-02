import 'package:flutter/material.dart';
import 'package:super_editor/super_editor.dart';
import 'package:taskflow/src/presentation/widget/button.dart';

class CustomTaskComponentBuilder implements ComponentBuilder {
  const CustomTaskComponentBuilder(this.editor);

  final Editor editor;

  @override
  SingleColumnLayoutComponentViewModel? createViewModel(
    Document document,
    DocumentNode node,
  ) {
    if (node is! TaskNode) return null;

    return TaskComponentViewModel(
      nodeId: node.id,
      padding: EdgeInsets.zero,
      isComplete: node.isComplete,
      setComplete: (value) {
        editor.execute(
            [ChangeTaskCompletionRequest(nodeId: node.id, isComplete: value)]);
      },
      text: node.text,
      textStyleBuilder: (attributions) => defaultStyleBuilder(attributions),
      selectionColor: Colors.transparent,
    );
  }

  @override
  Widget? createComponent(SingleColumnDocumentComponentContext componentContext,
      SingleColumnLayoutComponentViewModel componentViewModel) {
    if (componentViewModel is! TaskComponentViewModel) return null;

    final theme = Theme.of(componentContext.context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        SizedBox(
          width: componentViewModel.indentCalculator(
            componentViewModel.textStyleBuilder({}),
            componentViewModel.indent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 4.0),
          child: CustomToggleButton(
            value: componentViewModel.isComplete,
            onChanged: (value) =>
                componentViewModel.setComplete!(value ?? false),
          ),
        ),
        Expanded(
          child: TextComponent(
            key: componentContext.componentKey,
            text: componentViewModel.text,
            textStyleBuilder: componentViewModel.textStyleBuilder,
            textSelection: componentViewModel.selection,
            selectionColor:
                colorScheme.tertiaryContainer.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
