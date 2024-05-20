import 'package:cookcy/core/common/widgets/bold_grey_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookcy/core/utils/const/colors.dart';

class RegisterLoginRowButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final String buttonText;
  const RegisterLoginRowButton({
    super.key,
    required this.text,
    this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GreyText(text: text, fontSize: 13.sp),
        GestureDetector(
          onTap: onTap,
          child: Text(
            buttonText,
            style: TextStyle(
              color: TColors.primary,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
