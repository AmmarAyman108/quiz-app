import 'package:flutter/material.dart';

// ignore: camel_case_types
class text extends StatelessWidget {
  const text(
      {super.key,
      required this.title,
      this.color = Colors.white,
      this.fontSize = 20,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start});
  final String title;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 3,
      overflow: TextOverflow.visible,
      title,
      textAlign: textAlign,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
