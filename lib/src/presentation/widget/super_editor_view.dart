import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:super_editor/super_editor.dart';

typedef InlineWidgetBuilder = Widget? Function(BuildContext, TextStyle, Object);

class SuperEditorView extends HookWidget {
  final Editor editor;
  final Document document;
  final DocumentComposer composer;
  final List<ComponentBuilder>? componentBuilders;
  final Future<void> Function(SuperEditorContext editContext)? onPaste;
  final void Function(SuperEditorContext editContext)? onEvent;

  const SuperEditorView({
    super.key,
    required this.editor,
    required this.document,
    required this.composer,
    this.componentBuilders,
    this.onPaste,
    this.onEvent,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SuperEditor(
      editor: editor,
      inputSource: TextInputSource.ime,
      selectionStyle: SelectionStyles(
        selectionColor: colorScheme.tertiaryContainer.withValues(alpha: 0.5),
      ),
      imePolicies: SuperEditorImePolicies(
        openImeOnNonPrimaryFocusGain: false,
        closeImeOnNonPrimaryFocusLost: false,
      ),
      documentOverlayBuilders: [
        DefaultCaretOverlayBuilder(
          caretStyle: const CaretStyle(),
        ),
      ],
      stylesheet: defaultStylesheet.copyWith(
        inlineWidgetBuilders: [inlineWidgetBuilder],
        addRulesBefore: [
          StyleRule(
            BlockSelector.all,
            (doc, node) => {
              Styles.textStyle: TextStyle(
                fontFamily: 'Pretendard',
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Styles.padding: const CascadingPadding.only(top: 12.0),
            },
          ),
        ],
        addRulesAfter: [
          StyleRule(
            BlockSelector.all,
            (doc, node) => {
              Styles.textStyle: TextStyle(
                fontFamily: 'Pretendard',
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Styles.padding: const CascadingPadding.only(top: 12.0),
            },
          ),
        ],
      ),
      keyboardActions: [
        (
            {required SuperEditorContext editContext,
            required KeyEvent keyEvent}) {
          if (keyEvent is KeyDownEvent) {
            final isMac = defaultTargetPlatform == TargetPlatform.macOS;
            final isCmd = HardwareKeyboard.instance.isMetaPressed;
            final isCtrl = HardwareKeyboard.instance.isControlPressed;

            if ((isMac && isCmd || !isMac && isCtrl) &&
                keyEvent.logicalKey == LogicalKeyboardKey.keyV) {
              if (onPaste != null) {
                onPaste!(editContext);
                return ExecutionInstruction.haltExecution;
              }
            }
          }

          if (keyEvent is KeyUpEvent) {
            if (onEvent != null) onEvent!(editContext);
          }

          return ExecutionInstruction.continueExecution;
        },
        ...defaultImeKeyboardActions,
      ],
      componentBuilders: componentBuilders ?? defaultComponentBuilders,
    );
  }

  Widget? inlineWidgetBuilder(
      BuildContext context, TextStyle textStyle, Object placeholder) {
    if (placeholder is! Placeholder) {
      return null;
    }

    return Skeletonizer(
      child: Container(
        width: double.infinity,
        height: 300.0,
        color: Colors.red,
      ),
    );
  }
}
