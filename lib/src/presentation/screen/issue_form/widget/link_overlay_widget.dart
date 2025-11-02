import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:follow_the_leader/follow_the_leader.dart';
import 'package:intl/intl.dart';
import 'package:super_editor/super_editor.dart';

class LinkOverlayWidget extends HookWidget {
  final Editor editor;
  final Document document;
  final DocumentComposer composer;
  final GlobalKey overlayKey;
  final LeaderLink link;
  final OverlayPortalController linkOverlayController;

  const LinkOverlayWidget({
    super.key,
    required this.editor,
    required this.document,
    required this.composer,
    required this.overlayKey,
    required this.link,
    required this.linkOverlayController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final urlController = useTextEditingController();
    final titleController = useTextEditingController();

    final urlFocus = useFocusNode();
    final titleFocus = useFocusNode();

    useEffect(() {
      if (linkOverlayController.isShowing) {
        urlFocus.requestFocus();

        if (composer.selection == null) return;

        final selection = composer.selection!;
        final baseOffset = (selection.base.nodePosition as TextPosition).offset;
        final extentOffset =
            (selection.extent.nodePosition as TextPosition).offset;
        final start = min(baseOffset, extentOffset);
        final end = max(baseOffset, extentOffset);

        final nodeId = selection.extent.nodeId;
        final node = document.getNodeById(nodeId);
        if (node is! TextNode) return null;

        final attributedText = node.text;
        titleController.text = attributedText.toPlainText();

        final spans = attributedText.getAttributionSpansInRange(
          attributionFilter: (attr) => attr is LinkAttribution,
          range: SpanRange(start, end - 1), // end-1 은 exclusive 보정
        );

        if (spans.isNotEmpty) {
          final linkAttr = spans.first.attribution as LinkAttribution;
          final uri = linkAttr.plainTextUri; // LinkAttribution 의 uri 프로퍼티

          urlController.text = uri;
        }
      }
      return null;
    }, [linkOverlayController]);

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => linkOverlayController.hide(),
            child: const SizedBox.expand(), // 투명한 배경
          ),
        ),
        Follower.withOffset(
          link: link,
          leaderAnchor: Alignment.bottomCenter,
          followerAnchor: Alignment.topCenter,
          repaintWhenLeaderChanges: true,
          child: Material(
            elevation: 1.0,
            color: Theme.of(context).colorScheme.surfaceBright,
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              constraints: BoxConstraints(maxWidth: 320.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Intl.message('issue_form_link_1'),
                    style: textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4.0),
                  TextField(
                    focusNode: urlFocus,
                    controller: urlController,
                    style: textTheme.bodySmall,
                    decoration: InputDecoration(
                      filled: true,
                    ),
                    onSubmitted: (value) => titleFocus.requestFocus(),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    Intl.message('issue_form_link_2'),
                    style: textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4.0),
                  TextField(
                    focusNode: titleFocus,
                    controller: titleController,
                    style: textTheme.bodySmall,
                    decoration: InputDecoration(
                      filled: true,
                    ),
                    onSubmitted: (value) {
                      final url = Uri.tryParse(urlController.text.trim());

                      if (url == null) return;

                      final selection = composer.selection!;
                      final nodeId = selection.extent.nodeId;

                      final baseOffset =
                          (selection.base.nodePosition as TextNodePosition)
                              .offset;
                      final extentOffset =
                          (selection.extent.nodePosition as TextNodePosition)
                              .offset;

                      final start =
                          baseOffset < extentOffset ? baseOffset : extentOffset;
                      final end =
                          baseOffset > extentOffset ? baseOffset : extentOffset;

                      final newText = titleController.text;

                      final rawUrl = urlController.text.trim();
                      final linkUrl = Uri.tryParse(rawUrl);
                      if (linkUrl == null) {
                        return;
                      }
                      final linkAttribution = LinkAttribution.fromUri(linkUrl);

                      editor.execute([
                        DeleteContentRequest(
                          documentRange: DocumentRange(
                            start: DocumentPosition(
                                nodeId: nodeId,
                                nodePosition: TextNodePosition(offset: start)),
                            end: DocumentPosition(
                                nodeId: nodeId,
                                nodePosition: TextNodePosition(offset: end)),
                          ),
                        ),
                        InsertTextRequest(
                          documentPosition: DocumentPosition(
                              nodeId: nodeId,
                              nodePosition: TextNodePosition(offset: start)),
                          textToInsert: newText,
                          attributions: {linkAttribution},
                        ),
                      ]);

                      linkOverlayController.hide();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
