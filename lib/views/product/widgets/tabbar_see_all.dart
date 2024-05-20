import 'package:cookcy/core/res/media_res.dart';
import 'package:cookcy/views/product/widgets/ingredients_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabbarSeeAll extends StatelessWidget {
  static const routeName = "/tabbar-see-all";
  const TabbarSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  bottom: TabBar(
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
                )
              ];
            },
            body: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: const SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IngredientsContainer(
                            image: MediaRes.pageOne, text: "Tortilla Chips"),
                        IngredientsContainer(
                            image: MediaRes.pageTwo, text: "Tortilla Chips"),
                        IngredientsContainer(
                            image: MediaRes.pageThree, text: "Tortilla Chips"),
                        IngredientsContainer(
                            image: MediaRes.pageOne, text: "Tortilla Chips"),
                        IngredientsContainer(
                            image: MediaRes.pageTwo, text: "Tortilla Chips"),
                        IngredientsContainer(
                            image: MediaRes.pageThree, text: "Tortilla Chips"),
                        IngredientsContainer(
                            image: MediaRes.pageOne, text: "Tortilla Chips"),
                        IngredientsContainer(
                            image: MediaRes.pageTwo, text: "Tortilla Chips"),
                        IngredientsContainer(
                            image: MediaRes.pageThree, text: "Tortilla Chips"),
                        IngredientsContainer(
                            image: MediaRes.pageOne, text: "Tortilla Chips"),
                        IngredientsContainer(
                            image: MediaRes.pageTwo, text: "Tortilla Chips"),
                        IngredientsContainer(
                            image: MediaRes.pageThree, text: "Tortilla Chips"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: const Column(
                    children: [
                      Text("Everyones Watching"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
