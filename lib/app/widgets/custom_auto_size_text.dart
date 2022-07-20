import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomAutoSizeText extends StatelessWidget {
  final String text;
  final double presetFontSizes;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final Rect? shaderRect;

  const CustomAutoSizeText(
      {Key? key,
      required this.text,
      required this.presetFontSizes,
      required this.style,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.shaderRect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AutoSizeText(
            text,
            presetFontSizes: List.generate(
              10,
              (index) => (presetFontSizes - index).toDouble(),
            ),
            style: style,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
          ),
        ),
      ],
    );
  }
}
