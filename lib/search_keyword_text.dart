import 'package:flutter/material.dart';

///
class SearchKeywordText extends StatelessWidget {
  final String text;
  final String keyText;
  final TextStyle? style;
  final TextStyle? keyStyle;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int? maxLines;

  const SearchKeywordText({
    Key? key,
    required this.text,
    this.keyText = "",
    this.style,
    this.keyStyle,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaleFactor = 1.0,
    this.maxLines,
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
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      text: TextSpan(children: children),
    );
  }
}
