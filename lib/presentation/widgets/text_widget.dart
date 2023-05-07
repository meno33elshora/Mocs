import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String txt;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final bool notFontFamily;
  final TextDecoration? textDecoration;
  final Color ? decorationColor;
  final double? decorationThickness;
  final TextDecorationStyle? textDecorationStyle;
  final TextOverflow  textOverflow;
  final int ? maxLines ;
  final TextAlign ? textAlign ;
  final Color ? background ;
  final double ? letterSpace ;


  const TextWidget({
    Key? key,
    required this.txt,
    required this.fontSize,
    required this.color,
    required this.notFontFamily,
    this.fontWeight,
    this.textDecoration,
    this.decorationColor,
    this.decorationThickness,
    this.textDecorationStyle,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxLines ,
    this.textAlign,
    this.background,
    this.letterSpace
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      overflow: textOverflow,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'NotoKufiArabic',
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpace ?? 0,
        backgroundColor: background,
        fontWeight: notFontFamily ? fontWeight : FontWeight.w600,
        decoration: textDecoration,
        decorationColor: decorationColor,
        decorationStyle: textDecorationStyle,
        decorationThickness: decorationThickness,
      ),
    );
  }
}
