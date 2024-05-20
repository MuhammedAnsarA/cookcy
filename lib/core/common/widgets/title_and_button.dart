import 'package:cookcy/core/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndButton extends StatelessWidget {
  final String text;
  final String textButtonTitle;
  final double fontSize;
  final void Function()? onTap;
  const TitleAndButton({
    super.key,
    required this.text,
    required this.textButtonTitle,
    required this.fontSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textButtonTitle,
            style: TextStyle(
              fontSize: 11.sp,
              color: TColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
