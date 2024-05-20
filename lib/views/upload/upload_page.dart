import 'package:cookcy/application/slider/slider_cubit.dart';
import 'package:cookcy/core/common/widgets/black_text.dart';
import 'package:cookcy/core/common/widgets/bold_black_text.dart';
import 'package:cookcy/core/common/widgets/bold_grey_text.dart';
import 'package:cookcy/core/common/widgets/input_field.dart';
import 'package:cookcy/core/common/widgets/rounded_button.dart';
import 'package:cookcy/core/utils/const/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class UploadPage extends HookWidget {
  static const routeName = "/upload-page";
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final foodNameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Text(
            "Cancel",
            style: TextStyle(color: TColors.error),
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: [
              Padding(
                padding: EdgeInsets.all(15.sp).copyWith(top: 5.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(20.sp),
                      dashPattern: const [10, 10],
                      color: Colors.grey,
                      strokeWidth: 2,
                      child: SizedBox(
                        width: double.infinity,
                        height: 160.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.gallery_add5,
                              size: 50.sp,
                              color: Colors.grey,
                            ),
                            BlackText(text: "Add Cover Photo", fontSize: 18.sp),
                            GreyText(text: "(up to 12 mb)", fontSize: 11.sp)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    BoldBlackText(text: "Food Name", fontSize: 16.sp),
                    SizedBox(height: 7.h),
                    InputField(
                      controller: foodNameController,
                      hintText: "Enter food name",
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Food Name is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    BoldBlackText(text: "Description", fontSize: 16.sp),
                    SizedBox(height: 7.h),
                    InputField(
                      controller: descriptionController,
                      hintText: "Tell a little about your food",
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Description is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        BoldBlackText(
                            text: "Cooking Duration ", fontSize: 16.sp),
                        GreyText(text: " (in minutes)", fontSize: 11.sp)
                      ],
                    ),
                    SizedBox(height: 15.h),
                    BlocBuilder<SliderCubit, double>(
                      builder: (context, sliderValue) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 7,
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 12),
                                overlayShape: SliderComponentShape.noOverlay,
                              ),
                              child: Slider(
                                value: sliderValue,
                                onChanged: (value) {
                                  context
                                      .read<SliderCubit>()
                                      .updateSlider(value);
                                },
                                min: 1,
                                max: 120,
                                activeColor: TColors.primary,
                                inactiveColor: TColors.grey,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Cook time: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${sliderValue.round()} min',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: TColors.primary),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 120.h),
                    RoundedButton(
                      label: const Text("Next"),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.sp).copyWith(top: 5.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(20.sp),
                      dashPattern: const [10, 10],
                      color: Colors.grey,
                      strokeWidth: 2,
                      child: SizedBox(
                        width: double.infinity,
                        height: 160.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.gallery_add5,
                              size: 50.sp,
                              color: Colors.grey,
                            ),
                            BlackText(text: "Add Cover Photo", fontSize: 18.sp),
                            GreyText(text: "(up to 12 mb)", fontSize: 11.sp)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    BoldBlackText(text: "Food Name", fontSize: 16.sp),
                    SizedBox(height: 7.h),
                    InputField(
                      controller: foodNameController,
                      hintText: "Enter food name",
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Food Name is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    BoldBlackText(text: "Description", fontSize: 16.sp),
                    SizedBox(height: 7.h),
                    InputField(
                      controller: descriptionController,
                      hintText: "Tell a little about your food",
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Description is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        BoldBlackText(
                            text: "Cooking Duration ", fontSize: 16.sp),
                        GreyText(text: " (in minutes)", fontSize: 11.sp)
                      ],
                    ),
                    SizedBox(height: 15.h),
                    BlocBuilder<SliderCubit, double>(
                      builder: (context, sliderValue) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 7,
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 12),
                                overlayShape: SliderComponentShape.noOverlay,
                              ),
                              child: Slider(
                                value: sliderValue,
                                onChanged: (value) {
                                  context
                                      .read<SliderCubit>()
                                      .updateSlider(value);
                                },
                                min: 1,
                                max: 120,
                                activeColor: TColors.primary,
                                inactiveColor: TColors.grey,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Cook time: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${sliderValue.round()} min',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: TColors.primary),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 120.h),
                    RoundedButton(
                      label: const Text("Next"),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
