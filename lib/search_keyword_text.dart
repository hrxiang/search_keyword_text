import 'package:flutter/material.dart';

///
class SearchKeywordText extends StatelessWidget {
  final String text;
  final String keyText;
  final TextStyle? style;
  final TextStyle? keyStyle;

  const SearchKeywordText({
    Key? key,
    required this.text,
    this.keyText = "",
    this.style,
    this.keyStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<InlineSpan> children = <InlineSpan>[];
    if (keyText.trim().isNotEmpty) {
      text.splitMapJoin(
        RegExp(keyText, caseSensitive: false),
        onMatch: (Match m) {
          children.add(TextSpan(text: '${m.group(0)}', style: keyStyle));
          return m.group(0)!;
        },
        onNonMatch: (text) {
          children.add(TextSpan(text: text, style: style));
          return text;
        },
      );
    } else {
      children.add(TextSpan(text: text, style: style));
    }
    return RichText(
      text: TextSpan(children: children),
    );
  }
}
