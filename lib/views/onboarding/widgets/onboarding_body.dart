import 'package:cookcy/core/res/fonts.dart';
import 'package:cookcy/core/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:cookcy/domain/onboarding/model/page_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/blocs.dart';
import '../../views.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.pageContent,
  });

  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200.h,
          width: 250.w,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  pageContent.image,
                )),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.all(10.sp).copyWith(bottom: 0),
          child: Column(
            children: [
              Text(
                pageContent.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: Fonts.aeonik,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                pageContent.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.sp),
              ),
              SizedBox(height: 60.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.h,
                    vertical: 15.w,
                  ),
                  backgroundColor: TColors.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  context.read<OnboardingCubit>().cacheFirstTimer();
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginPage.routeName, (route) => false);
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: Fonts.aeonik,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
