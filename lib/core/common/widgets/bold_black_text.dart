import 'package:flutter/material.dart';

class BoldBlackText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  const BoldBlackText({
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
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
