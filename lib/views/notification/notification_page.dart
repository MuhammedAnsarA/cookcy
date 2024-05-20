import 'package:cookcy/core/common/widgets/bold_black_text.dart';
import 'package:cookcy/core/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NotificationPage extends StatelessWidget {
  static const routeName = "/notification-page";
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  title: BoldBlackText(text: "Notifications", fontSize: 20.sp),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Iconsax.filter5,
                          size: 24.sp,
                        )),
                  ],
                  bottom: TabBar(
                    tabAlignment: TabAlignment.center,
                    padding: EdgeInsets.all(10.sp),
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: TColors.darkGrey,
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    indicator: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    dividerColor: Colors.transparent,
                    tabs: [
                      SizedBox(
                        width: 80.h,
                        child: const Tab(text: 'All'),
                      ),
                      SizedBox(
                        width: 80.h,
                        child: const Tab(text: 'Unread'),
                      ),
                      SizedBox(
                        width: 80.h,
                        child: const Tab(text: 'Read'),
                      ),
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: const Column(
                    children: [
                      Text("Everyones Watching"),
                    ],
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
                Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: const Column(
                    children: [
                      Text("Everyone"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
