import 'package:cookcy/core/utils/const/colors.dart';
import 'package:flutter/material.dart';

class GreyText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  const GreyText({
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
        color: TColors.darkGrey,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
