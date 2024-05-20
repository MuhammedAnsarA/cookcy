import 'package:cookcy/core/res/fonts.dart';
import 'package:cookcy/core/themes/widget_themes/appbar_theme.dart';
import 'package:cookcy/core/themes/widget_themes/bottom_sheet_theme.dart';
import 'package:cookcy/core/themes/widget_themes/checkbox_theme.dart';
import 'package:cookcy/core/themes/widget_themes/chip_theme.dart';
import 'package:cookcy/core/themes/widget_themes/elevated_button_theme.dart';
import 'package:cookcy/core/themes/widget_themes/outlined_button_theme.dart';
import 'package:cookcy/core/themes/widget_themes/text_field_theme.dart';
import 'package:cookcy/core/themes/widget_themes/text_theme.dart';
import 'package:cookcy/core/utils/const/colors.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: Fonts.poppins,
    disabledColor: TColors.grey,
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
}
