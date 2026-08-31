import 'dart:convert';

import 'package:appflowy_editor/appflowy_editor.dart' as appflowy;
import 'package:mime/mime.dart';
import 'package:taskflow/src/data/data.dart';

final class DraftEncodedContent {
  final String content;
  final List<DraftAsset> assets;

  const DraftEncodedContent({required this.content, required this.assets});
}

abstract final class DraftContentCodec {
  static DraftEncodedContent encode({
    required String content,
    required String draftId,
    required DateTime now,
  }) {
    final document = appflowy.markdownToDocument(content);
    final imageParser = _DraftImageNodeParser(draftId: draftId, now: now);

    try {
      return DraftEncodedContent(
        content: appflowy.documentToMarkdown(
          document,
          customParsers: [imageParser],
        ),
        assets: imageParser.assets,
      );
    } finally {
      document.dispose();
    }
  }

  static String restore({
    required String content,
    required List<DraftAsset> assets,
  }) {
    final assetsById = {for (final asset in assets) asset.id: asset};
    final document = appflowy.markdownToDocument(content);

    void restoreNode(appflowy.Node node) {
      if (node.type == appflowy.ImageBlockKeys.type) {
        final url = node.attributes[appflowy.ImageBlockKeys.url] as String?;
        const prefix = 'draft-asset://';

        if (url?.startsWith(prefix) ?? false) {
          final asset = assetsById[url!.substring(prefix.length)];
          if (asset == null || asset.type != DraftAssetType.inlineImage) {
            throw StateError('Draft inline asset not found: $url');
          }

          node.updateAttributes({
            appflowy.ImageBlockKeys.url:
                'data:${asset.mime};base64,${base64Encode(asset.bytes)}',
          });
        }
      }

      for (final child in node.children) {
        restoreNode(child);
      }
    }

    try {
      for (final node in document.root.children) {
        restoreNode(node);
      }

      return appflowy.documentToMarkdown(document);
    } finally {
      document.dispose();
    }
  }
}

final class _DraftImageNodeParser extends appflowy.NodeParser {
  final String draftId;
  final DateTime now;
  final List<DraftAsset> assets = [];

  _DraftImageNodeParser({required this.draftId, required this.now});

  @override
  String get id => appflowy.ImageBlockKeys.type;

  @override
  String transform(
    appflowy.Node node,
    appflowy.DocumentMarkdownEncoder? encoder,
  ) {
    final imageUrl = node.attributes[appflowy.ImageBlockKeys.url] as String?;
    if (imageUrl == null) return '';

    final nextNode = node.next;
    final isTrailingImageParagraph =
        nextNode?.extraInfos?['markdownTrailingImageParagraph'] == true;
    final suffix = nextNode == null || isTrailingImageParagraph ? '' : '\n';

    final isLocalImage =
        imageUrl.startsWith('data:') ||
        !(Uri.tryParse(imageUrl)?.hasScheme ?? false);
    if (!isLocalImage) return '![]($imageUrl)$suffix';

    try {
      final bytes = base64Decode(imageUrl.split(',').last);
      final mimeType =
          lookupMimeType('', headerBytes: bytes) ?? 'application/octet-stream';
      final extension = extensionFromMime(mimeType) ?? 'bin';
      final assetId = '${draftId}_inline_${assets.length}';

      assets.add(
        DraftAsset(
          id: assetId,
          draftId: draftId,
          bytes: bytes,
          mime: mimeType,
          type: DraftAssetType.inlineImage,
          fileName: '$assetId.$extension',
          createdAt: now,
          updatedAt: now,
        ),
      );
      return '![](draft-asset://$assetId)$suffix';
    } on FormatException {
      return '![]($imageUrl)$suffix';
    }
  }
}
