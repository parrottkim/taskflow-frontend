import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:follow_the_leader/follow_the_leader.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:super_editor/super_editor.dart';
import 'package:taskflow/src/presentation/widget/button.dart';

class ToolbarOverlayWidget extends HookWidget {
  final Editor editor;
  final Document document;
  final DocumentComposer composer;
  final GlobalKey toolbarKey;
  final GlobalKey overlayKey;
  final LeaderLink toolbarLink;
  final LeaderLink overlayLink;
  final OverlayPortalController linkOverlayController;
  final OverlayPortalController imageOverlayController;

  const ToolbarOverlayWidget({
    super.key,
    required this.editor,
    required this.document,
    required this.composer,
    required this.toolbarKey,
    required this.overlayKey,
    required this.toolbarLink,
    required this.overlayLink,
    required this.linkOverlayController,
    required this.imageOverlayController,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final boundary = WidgetFollowerBoundary(
      boundaryKey: toolbarKey,
      devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
    );

    final hasHistory = useState(editor.history.isNotEmpty);
    final hasFuture = useState(editor.future.isNotEmpty);

    useEffect(() {
      document.addListener((DocumentChangeLog event) {
        hasHistory.value = editor.history.isNotEmpty;
        hasFuture.value = editor.future.isNotEmpty;
      });

      return null;
    }, [document]);

    return Follower.withOffset(
      link: toolbarLink,
      boundary: boundary,
      leaderAnchor: Alignment.topCenter,
      followerAnchor: Alignment.bottomCenter,
      repaintWhenLeaderChanges: true,
      child: Leader(
        link: overlayLink,
        child: Container(
          key: overlayKey,
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLow,
            border: Border.all(
              color: colorScheme.surfaceContainerLow,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
              color: colorScheme.surfaceBright,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ToolbarButton(
                        onTap: editor.history.isNotEmpty
                            ? () {
                                editor.undo();
                              }
                            : null,
                        icon: Symbols.undo_rounded,
                      ),
                      ToolbarButton(
                        onTap: editor.future.isNotEmpty
                            ? () {
                                editor.redo();
                              }
                            : null,
                        icon: Symbols.redo_rounded,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: VerticalDivider(),
                      ),
                      ToolbarButton(
                        onTap: () {
                          final selection = composer.selection;

                          if (selection == null) return;
                          if (selection.isCollapsed) return;

                          final selectedNode =
                              document.getNodeById(selection.extent.nodeId);
                          final type =
                              selectedNode?.getMetadataValue('blockType');

                          if (type == blockquoteAttribution) {
                            editor.execute([
                              ChangeParagraphBlockTypeRequest(
                                nodeId: composer.selection!.extent.nodeId,
                                blockType: paragraphAttribution,
                              ),
                            ]);
                          }

                          editor.execute([
                            ToggleTextAttributionsRequest(
                              documentRange: composer.selection!,
                              attributions: {boldAttribution},
                            ),
                          ]);
                        },
                        icon: Symbols.format_bold_rounded,
                      ),
                      ToolbarButton(
                        onTap: () {
                          final selection = composer.selection;

                          if (selection == null) return;
                          if (selection.isCollapsed) return;

                          final selectedNode =
                              document.getNodeById(selection.extent.nodeId);
                          final type =
                              selectedNode?.getMetadataValue('blockType');

                          if (type == blockquoteAttribution) {
                            editor.execute([
                              ChangeParagraphBlockTypeRequest(
                                nodeId: composer.selection!.extent.nodeId,
                                blockType: paragraphAttribution,
                              ),
                            ]);
                          }

                          editor.execute([
                            ToggleTextAttributionsRequest(
                              documentRange: composer.selection!,
                              attributions: {italicsAttribution},
                            ),
                          ]);
                        },
                        icon: Symbols.format_italic_rounded,
                      ),
                      ToolbarButton(
                        onTap: () {
                          final selectedNode = document
                              .getNodeById(composer.selection!.extent.nodeId);
                          final type =
                              selectedNode?.getMetadataValue('blockType');

                          if (selectedNode is ListItemNode) {
                            editor.execute([
                              ConvertListItemToParagraphRequest(
                                nodeId: composer.selection!.extent.nodeId,
                                paragraphMetadata: {
                                  'blockType': header3Attribution,
                                },
                              ),
                            ]);
                            return;
                          }

                          if (selectedNode is TaskNode) {
                            editor.execute([
                              ConvertTaskToParagraphRequest(
                                nodeId: composer.selection!.extent.nodeId,
                                paragraphMetadata: {
                                  'blockType': header3Attribution,
                                },
                              ),
                            ]);
                          }

                          Attribution? attribution;

                          if (type == paragraphAttribution) {
                            attribution = header3Attribution;
                          } else if (type == header3Attribution) {
                            attribution = header2Attribution;
                          } else if (type == header2Attribution) {
                            attribution = header1Attribution;
                          } else if (type == header1Attribution) {
                            attribution = paragraphAttribution;
                          } else if (type == blockquoteAttribution) {
                            attribution = paragraphAttribution;
                          } else {
                            attribution = null;
                          }

                          editor.execute([
                            ChangeParagraphBlockTypeRequest(
                              nodeId: composer.selection!.extent.nodeId,
                              blockType: attribution,
                            ),
                          ]);
                        },
                        icon: Symbols.format_size_rounded,
                      ),
                      ToolbarButton(
                        onTap: () {
                          final selection = composer.selection;

                          if (selection == null) return;
                          if (selection.isCollapsed) return;

                          final selectedNode =
                              document.getNodeById(selection.extent.nodeId);
                          final type =
                              selectedNode?.getMetadataValue('blockType');

                          if (type == blockquoteAttribution) {
                            editor.execute([
                              ChangeParagraphBlockTypeRequest(
                                nodeId: composer.selection!.extent.nodeId,
                                blockType: paragraphAttribution,
                              ),
                            ]);
                          }

                          editor.execute([
                            ToggleTextAttributionsRequest(
                              documentRange: composer.selection!,
                              attributions: {strikethroughAttribution},
                            ),
                          ]);
                        },
                        icon: Symbols.strikethrough_s_rounded,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: VerticalDivider(),
                      ),
                      ToolbarButton(
                        onTap: () {
                          final selectedNode = document
                              .getNodeById(composer.selection!.extent.nodeId);

                          if (selectedNode is TaskNode) {
                            editor.execute([
                              ConvertTaskToParagraphRequest(
                                nodeId: composer.selection!.extent.nodeId,
                              ),
                            ]);
                          }

                          EditRequest? request;

                          if (selectedNode is ListItemNode) {
                            switch (selectedNode.type) {
                              case ListItemType.ordered:
                                request = ChangeListItemTypeRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                  newType: ListItemType.unordered,
                                );
                                break;
                              case ListItemType.unordered:
                                request = ConvertListItemToParagraphRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                );
                                break;
                            }
                          } else {
                            request = ConvertParagraphToListItemRequest(
                              nodeId: composer.selection!.extent.nodeId,
                              type: ListItemType.unordered,
                            );
                          }

                          editor.execute([request]);
                        },
                        icon: Symbols.format_list_bulleted_rounded,
                      ),
                      ToolbarButton(
                        onTap: () {
                          final selectedNode = document
                              .getNodeById(composer.selection!.extent.nodeId);

                          if (selectedNode is TaskNode) {
                            editor.execute([
                              ConvertTaskToParagraphRequest(
                                nodeId: composer.selection!.extent.nodeId,
                              ),
                            ]);
                          }

                          EditRequest? request;

                          if (selectedNode is ListItemNode) {
                            switch (selectedNode.type) {
                              case ListItemType.unordered:
                                request = ChangeListItemTypeRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                  newType: ListItemType.ordered,
                                );
                                break;
                              case ListItemType.ordered:
                                request = ConvertListItemToParagraphRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                );
                                break;
                            }
                          } else {
                            request = ConvertParagraphToListItemRequest(
                              nodeId: composer.selection!.extent.nodeId,
                              type: ListItemType.ordered,
                            );
                          }

                          editor.execute([request]);
                        },
                        icon: Symbols.format_list_numbered_rounded,
                      ),
                      ToolbarButton(
                        onTap: () {
                          final selectedNode = document
                              .getNodeById(composer.selection!.extent.nodeId);

                          if (selectedNode is ListItemNode) {
                            editor.execute([
                              ConvertListItemToParagraphRequest(
                                nodeId: composer.selection!.extent.nodeId,
                              )
                            ]);
                          }

                          EditRequest? request;

                          if (selectedNode is TaskNode) {
                            request = ConvertTaskToParagraphRequest(
                              nodeId: composer.selection!.extent.nodeId,
                            );
                          } else {
                            request = ConvertParagraphToTaskRequest(
                              nodeId: composer.selection!.extent.nodeId,
                            );
                          }

                          editor.execute([request]);
                        },
                        icon: Symbols.checklist_rounded,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: VerticalDivider(),
                      ),
                      ToolbarButton(
                        onTap: () {
                          final selection = composer.selection;

                          if (selection == null) return;
                          if (selection.isCollapsed) return;

                          final selectedNode =
                              document.getNodeById(selection.extent.nodeId);
                          final type =
                              selectedNode?.getMetadataValue('blockType');

                          if (selectedNode is ListItemNode) {
                            editor.execute([
                              ConvertListItemToParagraphRequest(
                                nodeId: composer.selection!.extent.nodeId,
                                paragraphMetadata: {
                                  'blockType': blockquoteAttribution,
                                },
                              ),
                            ]);
                            return;
                          }

                          if (selectedNode is TaskNode) {
                            editor.execute([
                              ConvertTaskToParagraphRequest(
                                nodeId: composer.selection!.extent.nodeId,
                                paragraphMetadata: {
                                  'blockType': blockquoteAttribution,
                                },
                              ),
                            ]);
                          }

                          Attribution? attribution;

                          if (type == blockquoteAttribution) {
                            attribution = paragraphAttribution;
                          } else {
                            attribution = blockquoteAttribution;
                          }

                          editor.execute([
                            ChangeParagraphBlockTypeRequest(
                              nodeId: composer.selection!.extent.nodeId,
                              blockType: attribution,
                            ),
                          ]);
                        },
                        icon: Symbols.format_quote_rounded,
                      ),
                      ToolbarButton(
                        onTap: null,
                        icon: Symbols.code_rounded,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: VerticalDivider(),
                      ),
                      ToolbarButton(
                        onTap: () {
                          final selection = composer.selection;
                          if (selection == null) return;

                          final selectedNode = document
                              .getNodeById(composer.selection!.extent.nodeId);
                          if (selectedNode is! ParagraphNode) return;

                          final startOffset =
                              (selection.base.nodePosition as TextNodePosition)
                                  .offset;
                          final endOffset =
                              (selection.end.nodePosition as TextNodePosition)
                                  .offset;

                          if (endOffset - startOffset == 0) return;

                          linkOverlayController.toggle();
                          imageOverlayController.hide();
                        },
                        icon: Symbols.link_rounded,
                      ),
                      ToolbarButton(
                        onTap: () {
                          imageOverlayController.toggle();
                          linkOverlayController.hide();
                        },
                        icon: Symbols.image_rounded,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
