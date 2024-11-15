import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlTextData extends StatelessWidget {
  const HtmlTextData({
    super.key,
    required this.textData,
    required this.fontSize,
    required this.fontFamily,
    required this.textDirection,
  });

  final String textData;
  final double fontSize;
  final String fontFamily;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: textData,
      style: {
        '#': Style(
          fontSize: FontSize(fontSize),
          fontFamily: fontFamily,
          direction: textDirection,
          padding: HtmlPaddings.all(8),
          margin: Margins.zero,
        ),
        'small': Style(
          fontSize: FontSize(fontSize - 4),
          color: Colors.grey.shade600,
        ),
      },
    );
  }
}
