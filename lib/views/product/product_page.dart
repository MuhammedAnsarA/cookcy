import 'package:cookcy/core/common/pages/custom_curved.dart';
import 'package:cookcy/core/common/widgets/black_text.dart';
import 'package:cookcy/core/common/widgets/bold_black_text.dart';
import 'package:cookcy/core/common/widgets/bold_grey_text.dart';
import 'package:cookcy/core/common/widgets/filled_icon_button.dart';
import 'package:cookcy/core/common/widgets/title_and_button.dart';
import 'package:cookcy/core/res/media_res.dart';
import 'package:cookcy/core/utils/const/colors.dart';
import 'package:cookcy/views/product/widgets/image_text_row.dart';
import 'package:cookcy/views/product/widgets/ingredients_container.dart';
import 'package:cookcy/views/product/widgets/tabbar_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProductPage extends StatelessWidget {
  static const routeName = "/product-page";
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipPath(
                clipper: CustomCurvedEdges(),
                child: Container(
                  height: 255.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1543353071-10c8ba85a904?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZCUyMGJhY2tncm91bmR8ZW58MHx8MHx8fDA%3D"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 15.sp,
                        top: 35.sp,
                        child: FilledIconButton(
                          icon: Icons.close,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Positioned(
                        right: 15.sp,
                        top: 35.sp,
                        child: FilledIconButton(
                          icon: Iconsax.heart,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.sp).copyWith(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoldBlackText(
                          text: "Healthy Taco Salad",
                          fontSize: 19.sp,
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: [
                            Icon(
                              Iconsax.clock,
                              size: 17.sp,
                            ),
                            SizedBox(width: 5.h),
                            const Text("15 min"),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const GreyText(
                        textAlign: TextAlign.start,
                        text:
                            "This Healthy Taco Salad is the universal delight of taco night View More",
                        fontSize: 13),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ImageTextRow(
                                image: MediaRes.pageThree, text: "65g carbs"),
                            SizedBox(height: 15.w),
                            const ImageTextRow(
                                image: MediaRes.pageTwo, text: "120 Kcal"),
                          ],
                        ),
                        SizedBox(width: 25.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ImageTextRow(
                                image: MediaRes.pageOne, text: "27g protiens"),
                            SizedBox(height: 15.w),
                            const ImageTextRow(
                                image: MediaRes.pageOne, text: "91g fats"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      height: 45.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: TColors.primaryBackground),
                      child: TabBar(
                        tabAlignment: TabAlignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        indicatorSize: TabBarIndicatorSize.tab,
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        labelStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        indicator: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        dividerColor: Colors.transparent,
                        tabs: [
                          SizedBox(
                            width: 115.h,
                            child: const Tab(text: 'Ingredients'),
                          ),
                          SizedBox(
                            width: 115.h,
                            child: const Tab(text: 'Instructions'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 280.h,
                      child: TabBarView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 15.h),
                              TitleAndButton(
                                text: "Ingredients",
                                textButtonTitle: "See All",
                                fontSize: 15.sp,
                                onTap: () => Navigator.pushNamed(
                                    context, TabbarSeeAll.routeName),
                              ),
                              SizedBox(height: 2.w),
                              GreyText(text: "6 item", fontSize: 11.sp),
                              SizedBox(height: 12.h),
                              const IngredientsContainer(
                                  image: MediaRes.pageOne,
                                  text: "Tortilla Chips"),
                              const IngredientsContainer(
                                  image: MediaRes.pageTwo,
                                  text: "Tortilla Chips"),
                              const IngredientsContainer(
                                  image: MediaRes.pageThree,
                                  text: "Tortilla Chips"),
                            ],
                          ),
                          const Text("everyones_watching"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    BoldBlackText(
                      text: "Creator",
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 7.h),
                    Row(
                      children: [
                        Container(
                          height: 45.w,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D"))),
                        ),
                        SizedBox(width: 10.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlackText(text: "Natalia Luca", fontSize: 13.sp),
                            SizedBox(height: 3.w),
                            GreyText(
                              text: "i'm the author and recipe developer.",
                              fontSize: 11.sp,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    TitleAndButton(
                      text: "Related Recipes",
                      textButtonTitle: "See All",
                      fontSize: 14.sp,
                      onTap: () {},
                    ),
                    SizedBox(height: 7.h),
                    SizedBox(
                      height: 105.h,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: 80.w,
                            height: 105.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 1),
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: const DecorationImage(
                                            image: AssetImage(MediaRes.chatti),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    "Egg & avilsssss",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
