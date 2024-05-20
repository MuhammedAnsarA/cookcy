import 'package:cookcy/core/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.overrideValidator = false,
    this.readOnly = false,
    this.filled = false,
    this.validator,
    this.onChanged,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.keyboardType,
    this.hintStyle,
  });

  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final TextEditingController controller;
  final bool filled;
  final Color? fillColor;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: overrideValidator
          ? validator
          : (value) {
              if (value == null || value.isEmpty) {
                return "This field is required";
              }
              return validator?.call(value);
            },
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90),
          borderSide: const BorderSide(color: TColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90),
          borderSide: const BorderSide(color: TColors.primary),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
        filled: filled,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
