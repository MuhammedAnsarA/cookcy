import 'package:cookcy/core/utils/const/colors.dart';
import 'package:cookcy/core/utils/const/sizes.dart';
import 'package:flutter/material.dart';

/* -- Light & Dark Outlined Button Themes -- */
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.dark,
      side: const BorderSide(color: TColors.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16, color: TColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );
}
