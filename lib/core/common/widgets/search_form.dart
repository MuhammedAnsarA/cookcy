import 'package:cookcy/core/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 60.h,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Iconsax.search_normal_1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: const BorderSide(color: TColors.darkGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: const BorderSide(color: TColors.darkGrey),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
          hintText: "Search",
          hintStyle: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
