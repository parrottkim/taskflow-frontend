import 'package:flutter/material.dart';
import 'package:super_editor/super_editor.dart';

class CustomBlockquoteComponentBuilder implements ComponentBuilder {
  const CustomBlockquoteComponentBuilder();

  @override
  SingleColumnLayoutComponentViewModel? createViewModel(
    Document document,
    DocumentNode node,
  ) {
    if (node is! ParagraphNode) return null;

    final blockType = node.getMetadataValue('blockType');
    if (blockType != blockquoteAttribution) return null;

    return BlockquoteComponentViewModel(
      text: node.text,
      textStyleBuilder: (attributions) => defaultStyleBuilder(attributions),
      nodeId: node.id,
      // 실제 selectionColor/backgroundColor/borderRadius는 createComponent에서 사용하므로
      // 여기에선 기본값만 주셔도 됩니다.
      selectionColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
    );
  }

  @override
  Widget? createComponent(
    SingleColumnDocumentComponentContext componentContext,
    SingleColumnLayoutComponentViewModel componentViewModel,
  ) {
    if (componentViewModel is! BlockquoteComponentViewModel) return null;

    final theme = Theme.of(componentContext.context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4,
              color: colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextComponent(
                  key: componentContext.componentKey,
                  text: componentViewModel.text,
                  textStyleBuilder: (attributions) =>
                      textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  textDirection: componentViewModel.textDirection,
                  textAlign: componentViewModel.textAlignment,
                  textSelection: componentViewModel.selection,
                  selectionColor:
                      colorScheme.tertiaryContainer.withValues(alpha: 0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
