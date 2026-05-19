part of 'widget.dart';

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
    final brightness = Theme.of(context).brightness;
    final normalizedItem = _normalizeOrderedListMarkdown(item);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GptMarkdownTheme(
        gptThemeData: GptMarkdownThemeData(brightness: brightness),
        child: GptMarkdown(normalizedItem),
      ),
    );
  }
}
