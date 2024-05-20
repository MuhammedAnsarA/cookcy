import 'package:cookcy/core/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.buttonColor,
    this.labelColor,
  });

  final Widget label;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? labelColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.sp)),
        backgroundColor: buttonColor ?? TColors.buttonPrimary,
        foregroundColor: labelColor ?? Colors.white,
        minimumSize: Size(double.maxFinite, 40.h),
        side: BorderSide.none,
      ),
      onPressed: onPressed,
      child: label,
    );
  }
}
