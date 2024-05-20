import '../../../application/blocs.dart';
import 'package:cookcy/core/utils/const/colors.dart';
import 'package:cookcy/domain/onboarding/model/page_content.dart';
import 'package:cookcy/views/onboarding/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  static const routeName = "/";

  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          if (state is CheckingIfUserIsFirstTimer ||
              state is CachingFirstTimer) {
            return const Text(
              "We are checking your information...",
            );
          }

          return Stack(
            children: [
              PageView(
                controller: pageController,
                children: const [
                  OnboardingBody(pageContent: PageContent.first()),
                  OnboardingBody(pageContent: PageContent.second()),
                  OnboardingBody(pageContent: PageContent.third()),
                ],
              ),
              Align(
                alignment: const Alignment(0, 0.64),
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  onDotClicked: (index) {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  effect: WormEffect(
                    dotHeight: 8.h,
                    dotWidth: 15.h,
                    spacing: 13.w,
                    activeDotColor: TColors.primary,
                    dotColor: TColors.grey,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
