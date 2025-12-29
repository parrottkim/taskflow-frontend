part of 'widget.dart';

class MarkdownWidget extends StatelessWidget {
  final String item;

  const MarkdownWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return GptMarkdownTheme(
      gptThemeData: GptMarkdownThemeData(brightness: brightness),
      child: GptMarkdown(
        item,
      ),
    );
  }
}
