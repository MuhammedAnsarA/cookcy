import 'package:flutter/material.dart';

import 'package:cookcy/core/utils/const/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilledIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  const FilledIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(40.w, 40.w)),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 23,
          color: TColors.dark,
        ));
  }
}
