import 'package:carousel_slider/carousel_slider.dart';
import 'package:cookcy/core/common/widgets/bold_black_text.dart';
import 'package:cookcy/core/common/widgets/carousel_items_container.dart';
import 'package:cookcy/core/common/widgets/search_form.dart';
import 'package:cookcy/core/common/widgets/title_and_button.dart';
import 'package:cookcy/core/utils/const/colors.dart';
import 'package:cookcy/core/utils/const/text_strings.dart';
import 'package:cookcy/views/product/product_page.dart';
import 'package:cookcy/views/upload/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            title: Text(
              TTexts.appName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.sp),
            ),
            elevation: 0,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 6.sp),
                child: IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, UploadPage.routeName),
                    icon: Icon(
                      Iconsax.add_square5,
                      size: 35.sp,
                      color: TColors.primary,
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
                      SizedBox(height: 15.h),
                      const SearchForm(),
                      SizedBox(height: 5.h),
                      BoldBlackText(
                        text: "Featured",
                        fontSize: 14.sp,
                      ),
                      SizedBox(height: 7.h),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 180.h,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 1,
                        ),
                        items: const [
                          CarouselItemsContainer(
                              image:
                                  "https://images.unsplash.com/photo-1606787366850-de6330128bfc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGZvb2QlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww"),
                          CarouselItemsContainer(
                              image:
                                  "https://images.unsplash.com/photo-1606914469276-31bc4103c50c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OTV8fGZvb2QlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww"),
                          CarouselItemsContainer(
                              image:
                                  "https://images.unsplash.com/photo-1616486447077-f8d3f7bae6b7?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OTR8fGZvb2QlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww"),
                          CarouselItemsContainer(
                              image:
                                  "https://images.unsplash.com/photo-1622732777601-e744c3401d44?q=80&w=1926&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      TitleAndButton(
                        text: "Category",
                        textButtonTitle: "See All",
                        fontSize: 14.sp,
                        onTap: () {},
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 8,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.h),
                      child: MaterialButton(
                        onPressed: () {},
                        color: TColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          "Breakfast",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleAndButton(
                        text: "Popular Recipes",
                        textButtonTitle: "See All",
                        fontSize: 14.sp,
                        onTap: () {},
                      ),
                      SizedBox(height: 7.h),
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
