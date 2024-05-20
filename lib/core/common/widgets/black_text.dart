import 'package:flutter/material.dart';

class BlackText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  const BlackText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
