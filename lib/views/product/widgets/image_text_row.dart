import 'package:cookcy/core/common/widgets/bold_black_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookcy/core/utils/const/colors.dart';

class ImageTextRow extends StatelessWidget {
  final String image;
  final String text;
  const ImageTextRow({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(5.sp),
          height: 35.h,
          width: 35.h,
          decoration: BoxDecoration(
              color: TColors.primaryBackground,
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        SizedBox(width: 10.h),
        BoldBlackText(text: text, fontSize: 14)
      ],
    );
  }
}
