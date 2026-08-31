part of '../widget.dart';

const _markdownImageMaxWidth = 600.0;
const _markdownImageMaxHeight = 400.0;

final _markdownComponents = MarkdownComponent.globalComponents
    .map((component) => component is HTag ? _PaddedHeadingTag() : component)
    .toList(growable: false);

class _PaddedHeadingTag extends HTag {
  @override
  Widget build(BuildContext context, String text, GptMarkdownConfig config) {
    final level = RegExp(r'^\s*(#{1,6})\s').firstMatch(text)?.group(1)?.length;
    final topPadding = switch (level) {
      1 => 16.0,
      2 => 12.0,
      3 => 8.0,
      _ => 4.0,
    };

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: super.build(context, text, config),
    );
  }
}

String _normalizeOrderedListMarkdown(String markdown) {
  final lines = markdown.replaceAll('\r\n', '\n').split('\n');
  final normalized = <String>[];
  final orderedPattern = RegExp(r'^(\s*)(\d+)\.\s+(.*)$');

  int currentOrder = 0;

  for (var i = 0; i < lines.length; i++) {
    final line = lines[i];
    final orderedMatch = orderedPattern.firstMatch(line);

    if (orderedMatch != null) {
      final indent = orderedMatch.group(1)!;
      final content = orderedMatch.group(3)!;
      currentOrder += 1;
      normalized.add('$indent$currentOrder. $content');
      continue;
    }

    if (line.trim().isEmpty) {
      final previousIsOrdered =
          normalized.isNotEmpty && orderedPattern.hasMatch(normalized.last);
      final nextLine = i + 1 < lines.length ? lines[i + 1] : null;
      final nextIsOrdered =
          nextLine != null && orderedPattern.hasMatch(nextLine);

      if (previousIsOrdered && nextIsOrdered) {
        continue;
      }
    }

    currentOrder = 0;
    normalized.add(line);
  }

  return normalized.join('\n');
}

class MarkdownWidget extends StatelessWidget {
  final String item;

  const MarkdownWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final textStyle = textTheme.bodyLarge!.copyWith(height: 1.5);
    final codeStyle = textTheme.bodyMedium!.copyWith(
      fontFamily: 'SpaceMono',
      color: colorScheme.error,
      height: 1.5,
    );
    final normalizedItem = _normalizeOrderedListMarkdown(item);

    TextStyle headingStyle(double fontSize) {
      return textStyle.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GptMarkdownTheme(
        gptThemeData: GptMarkdownThemeData(
          brightness: theme.brightness,
          h1: headingStyle(32.0),
          h2: headingStyle(28.0),
          h3: headingStyle(24.0),
          h4: headingStyle(18.0),
          h5: headingStyle(18.0),
          h6: headingStyle(18.0),
          hrLineThickness: 0,
          linkColor: Colors.lightBlue,
          linkHoverColor: Colors.lightBlue,
        ),
        child: GptMarkdown(
          normalizedItem,
          style: textStyle,
          components: _markdownComponents,
          imageBuilder: (context, imageUrl, width, height) {
            return InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => ImageDetailDialog(imageUrl: imageUrl),
                );
              },
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: _markdownImageMaxWidth,
                  maxHeight: _markdownImageMaxHeight,
                ),
                child: Image.network(
                  imageUrl,
                  width: width,
                  height: height,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return const SizedBox(
                      width: 32.0,
                      height: 32.0,
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return ContentContainer(
                      width: _markdownImageMaxWidth,
                      height: _markdownImageMaxHeight,
                      color: colorScheme.surfaceDim,
                      child: Icon(Symbols.broken_image_rounded),
                    );
                  },
                ),
              ),
            );
          },
          linkBuilder: (context, text, url, style) {
            return Text.rich(
              text,
              style: style.copyWith(
                color: Colors.lightBlue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.lightBlue,
              ),
            );
          },
          unOrderedListBuilder: (context, child, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 26.0,
                    height: 22.0,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '●',
                        textScaler: const TextScaler.linear(0.5),
                        style: textStyle,
                      ),
                    ),
                  ),
                  Flexible(child: child),
                ],
              ),
            );
          },
          orderedListBuilder: (context, no, child, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 26.0,
                    height: 22.0,
                    child: Text('$no.', style: textStyle),
                  ),
                  Flexible(child: child),
                ],
              ),
            );
          },
          highlightBuilder: (context, text, _) {
            return Text(text, style: codeStyle);
          },
          codeBuilder: (context, _, code, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(code, style: codeStyle),
            );
          },
        ),
      ),
    );
  }
}
