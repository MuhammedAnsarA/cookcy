import 'package:cookcy/core/common/widgets/bold_black_text.dart';
import 'package:cookcy/core/common/widgets/bold_grey_text.dart';
import 'package:cookcy/core/common/widgets/title_and_button.dart';
import 'package:cookcy/core/res/media_res.dart';
import 'package:cookcy/core/utils/const/colors.dart';
import 'package:cookcy/views/product/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.sp),
            ),
            elevation: 0,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 6.sp),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.setting,
                    )),
              ),
            ],
            expandedHeight: 25.h,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(17.sp),
                        child: Container(
                          width: double.infinity,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.sp),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(11.sp),
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40.h,
                                      height: 40.h,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(MediaRes.chatti))),
                                    ),
                                    SizedBox(width: 11.h),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BoldBlackText(
                                            text: "Muhammed Ansar",
                                            fontSize: 14.sp),
                                        GreyText(
                                            text: "Recipe Developer",
                                            fontSize: 10.sp),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 60.h),
                                Container(
                                  height: 20.h,
                                  width: 20.h,
                                  decoration: BoxDecoration(
                                      color: TColors.primary,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(
                                    Iconsax.arrow_right_1,
                                    color: Colors.white,
                                    size: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      TitleAndButton(
                        text: "My Favorites",
                        textButtonTitle: "See All",
                        fontSize: 16.sp,
                        onTap: () {},
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 8,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 7,
                          mainAxisExtent: 245,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, ProductPage.routeName),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: TColors.primaryBackground,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 190,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                              image: const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://media.istockphoto.com/id/1483505455/photo/modern-villa-with-carbonized-wood-elements.jpg?s=1024x1024&w=is&k=20&c=3OfaoT3UFXZDMPBRBGKrOGHsOHdKsLxrwioG58QCzJA="))),
                                        ),
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: const CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.favorite_border_outlined,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: Container(
                                            height: 28,
                                            width: 95,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color.fromARGB(
                                                    225, 0, 129, 99)),
                                            child: const Center(
                                                child: Text(
                                              "\$ 786/month",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    const Text(
                                      "Fairview Apartment",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11),
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Iconsax.star,
                                          size: 11,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          "4.9",
                                          style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(width: 7),
                                        Icon(
                                          Iconsax.location,
                                          size: 11,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          "Kerala,India",
                                          style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
