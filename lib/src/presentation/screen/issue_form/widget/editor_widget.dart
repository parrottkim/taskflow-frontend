import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'package:super_editor/super_editor.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/issue_form/widget/blockquote_component_builder.dart';
import 'package:taskflow/src/presentation/screen/issue_form/widget/task_component_builder.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class EditorWidget extends HookConsumerWidget {
  final Editor editor;
  final Document document;
  final DocumentComposer composer;
  final GlobalKey toolbarKey;

  const EditorWidget({
    super.key,
    required this.editor,
    required this.document,
    required this.composer,
    required this.toolbarKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final maxImageSize = Functions(context).maxImageSize;

    Future<void> handlePaste(SuperEditorContext editContext) async {
      final clipboard = SystemClipboard.instance;
      if (clipboard == null) return;

      final reader = await clipboard.read();
      final extentNodeId = composer.selection?.base.nodeId;
      if (extentNodeId == null) return;

      ImageExtension? image;
      for (final e in ImageExtension.values) {
        if (reader.canProvide(e.format)) {
          image = e;
          break;
        }
      }

      if (image == null) {
        if (reader.canProvide(Formats.plainText)) {
          final text = await reader.readValue(Formats.plainText);
          if (text != null && text.isNotEmpty) {
            editContext.commonOps.insertCharacter(text);
          }
        }
        return;
      }

      editor.execute([
        InsertInlinePlaceholderAtCaretRequest(Placeholder()),
      ]);

      if (reader.canProvide(image.format)) {
        reader.getFile(image.format, (file) async {
          try {
            final stream = file.getStream();

            final completer = Completer<Uint8List>();
            final chunks = <int>[];

            stream.listen(
              (chunk) => chunks.addAll(chunk),
              onDone: () => completer.complete(Uint8List.fromList(chunks)),
              onError: completer.completeError,
              cancelOnError: true,
            );

            var bytes = await completer.future;

            if (bytes.lengthInBytes > maxImageSize) {
              final image = decodeImage(bytes);

              if (image != null) {
                final resized = copyResize(
                  image,
                  width: 960,
                );

                bytes = Uint8List.fromList(encodeJpg(resized, quality: 80));
              }
            }

            final base64Data = base64Encode(bytes);
            final mimeType = image!.mime.first;
            final dataUrl = 'data:$mimeType;base64,$base64Data';

            final imageNode = ImageNode(
              id: Editor.createNodeId(),
              imageUrl: dataUrl,
            );

            editContext.commonOps.deleteUpstream();

            editor.execute([
              InsertNodeAtCaretRequest(
                node: imageNode,
              ),
            ]);
            return;
          } catch (e) {
            editContext.commonOps.deleteUpstream();

            ref.read(toastProvider).showToast(
                  child: Toast(
                    type: ToastType.alert,
                    message: Intl.message('error_clipboard_image_paste'),
                  ),
                );
          }
        });
      }
    }

    void handleEvent(SuperEditorContext editContext) {
      final selection = composer.selection;
      if (selection == null || !selection.isCollapsed) return;

      final nodeId = selection.extent.nodeId;
      final node = document.getNodeById(nodeId);

      final fullText = switch (node) {
        ParagraphNode() => node.text.toPlainText().trimLeft(),
        ListItemNode() => node.text.toPlainText().trimLeft(),
        _ => null,
      };

      if (fullText == null || fullText.isEmpty) return;

      final prefixPattern = RegExp(
          r'^((?:[-*]?\s*\[(?: |x|X)\]\s)|(?:[-*]\s)|(?:\d+[.)]\s)|(?:>\s))(.*)$');

      final prefixMatch = prefixPattern.firstMatch(fullText);
      if (prefixMatch == null) return;

      final prefix = prefixMatch.group(1)!;

      final taskMatch =
          RegExp(r'^[-*]?\s*\[( |x|X)\]\s+(.*)$').firstMatch(fullText);
      final unorderedListMatch = RegExp(r'^[-*]\s+(.*)$').firstMatch(fullText);
      final orderdListMatch = RegExp(r'^\d+[.)]\s+(.*)$').firstMatch(fullText);
      final blockquoteMatch = RegExp(r'^>\s+(.*)$').firstMatch(fullText);

      for (int i = 0; i < prefix.length; i++) {
        editContext.commonOps.deleteUpstream();
      }

      if (taskMatch != null) {
        final isComplete = taskMatch.group(1)!.toLowerCase() == 'x';

        if (node is ParagraphNode) {
          editor.execute([
            ConvertParagraphToTaskRequest(
              nodeId: nodeId,
              isComplete: isComplete,
            ),
          ]);
        }

        if (node is ListItemNode) {
          editor.execute([
            ConvertListItemToParagraphRequest(nodeId: nodeId),
            ConvertParagraphToTaskRequest(
              nodeId: nodeId,
              isComplete: isComplete,
            ),
          ]);
        }
        return;
      }

      if (unorderedListMatch != null && node is ParagraphNode) {
        editor.execute([
          ConvertParagraphToListItemRequest(
              nodeId: nodeId, type: ListItemType.unordered),
        ]);
        return;
      }

      if (orderdListMatch != null && node is ParagraphNode) {
        editor.execute([
          ConvertParagraphToListItemRequest(
              nodeId: nodeId, type: ListItemType.ordered),
        ]);
        return;
      }

      if (blockquoteMatch != null && node is ParagraphNode) {
        editor.execute([
          ChangeParagraphBlockTypeRequest(
            nodeId: composer.selection!.extent.nodeId,
            blockType: blockquoteAttribution,
          ),
        ]);
        return;
      }
    }

    return ContainerWidget(
      key: toolbarKey,
      padding: EdgeInsets.only(top: 40.0),
      constraints: BoxConstraints(maxWidth: 600.0),
      child: BoxToSliverAdapter(
        child: SuperEditor(
          editor: editor,
          inputSource: TextInputSource.ime,
          selectionStyle: SelectionStyles(
            selectionColor:
                colorScheme.tertiaryContainer.withValues(alpha: 0.5),
          ),
          imePolicies: SuperEditorImePolicies(
            openImeOnNonPrimaryFocusGain: false,
            closeImeOnNonPrimaryFocusLost: false,
          ),
          documentOverlayBuilders: [
            DefaultCaretOverlayBuilder(
              caretStyle: const CaretStyle().copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.7),
              ),
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
            ({
              required SuperEditorContext editContext,
              required KeyEvent keyEvent,
            }) {
              if (keyEvent is KeyDownEvent) {
                final isMac = defaultTargetPlatform == TargetPlatform.macOS;
                final isCmd = HardwareKeyboard.instance.isMetaPressed;
                final isCtrl = HardwareKeyboard.instance.isControlPressed;

                if ((isMac && isCmd || !isMac && isCtrl) &&
                    keyEvent.logicalKey == LogicalKeyboardKey.keyV) {
                  handlePaste(editContext);
                  return ExecutionInstruction.haltExecution;
                }
              }

              if (keyEvent is KeyUpEvent) {
                handleEvent(editContext);
              }

              return ExecutionInstruction.continueExecution;
            },
            ...defaultImeKeyboardActions,
          ],
          componentBuilders: [
            CustomBlockquoteComponentBuilder(),
            CustomTaskComponentBuilder(editor),
            ...defaultComponentBuilders,
          ],
        ),
      ),
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

class Placeholder {
  const Placeholder();
}

class BoxToSliverAdapter extends SingleChildRenderObjectWidget {
  const BoxToSliverAdapter({super.key, required super.child});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderBoxToSliverAdapter();
  }
}

class _RenderBoxToSliverAdapter extends RenderBox
    with RenderObjectWithChildMixin<RenderSliver>
    implements RenderAbstractViewport {
  @override
  void debugAssertDoesMeetConstraints() {}

  @override
  RevealedOffset getOffsetToReveal(RenderObject target, double alignment,
      {Rect? rect, Axis? axis}) {
    return const RevealedOffset(offset: 0, rect: Rect.zero);
  }

  @override
  void setupParentData(RenderObject child) {}

  @override
  Rect get paintBounds => Rect.zero;

  @override
  void performLayout() {
    final childConstraints = SliverConstraints(
      axisDirection: AxisDirection.down,
      growthDirection: GrowthDirection.forward,
      userScrollDirection: ScrollDirection.forward,
      scrollOffset: 0,
      precedingScrollExtent: 0,
      overlap: 0,
      remainingPaintExtent: constraints.maxHeight,
      crossAxisExtent: constraints.maxWidth,
      crossAxisDirection: AxisDirection.right,
      viewportMainAxisExtent: constraints.maxHeight,
      remainingCacheExtent: double.infinity,
      cacheOrigin: 0,
    );
    child!.layout(childConstraints, parentUsesSize: true);
    final geometry = child!.geometry;
    size = Size(constraints.maxWidth, geometry!.scrollExtent);
  }

  RenderBox _getBox(RenderSliver sliver) {
    RenderSliver? firstSliver;
    RenderBox? firstBox;
    sliver.visitChildren((child) {
      if (child is RenderSliver && firstSliver == null) {
        firstSliver = child;
      }
      if (child is RenderBox && firstBox == null) {
        firstBox = child;
      }
    });
    return firstSliver != null ? _getBox(firstSliver!) : firstBox!;
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) {
    final layoutBox = _getBox(child!);
    return layoutBox.computeDryLayout(constraints);
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    final layoutBox = _getBox(child!);
    return layoutBox.computeMaxIntrinsicWidth(height);
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    final layoutBox = _getBox(child!);
    return layoutBox.computeMinIntrinsicWidth(height);
  }

  @override
  computeMaxIntrinsicHeight(double width) {
    final layoutBox = _getBox(child!);
    return layoutBox.computeMaxIntrinsicHeight(width);
  }

  @override
  computeMinIntrinsicHeight(double width) {
    final layoutBox = _getBox(child!);
    return layoutBox.computeMinIntrinsicHeight(width);
  }

  @override
  void applyPaintTransform(RenderObject child, Matrix4 transform) {}

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return child!.hitTest(
      SliverHitTestResult.wrap(result),
      mainAxisPosition: position.dy,
      crossAxisPosition: position.dx,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);
  }

  @override
  void performResize() {}

  @override
  Rect get semanticBounds => Offset.zero & size;
}
