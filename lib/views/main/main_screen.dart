import 'package:cookcy/application/tab_bar/tab_bar_bloc.dart';
import 'package:cookcy/core/utils/const/colors.dart';
import 'package:cookcy/views/cart/cart_page.dart';
import 'package:cookcy/views/home/pages/home_page.dart';
import 'package:cookcy/views/notification/notification_page.dart';
import 'package:cookcy/views/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends StatelessWidget {
  static const routeName = "/main-screen";
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TabBarBloc>();
    return BlocBuilder<TabBarBloc, TabBarState>(
      builder: (context, state) {
        if (state is TabBarInitial || state is TabBarSelected) {}
        return Scaffold(
          body: _createBody(context, bloc.currentIndex),
          bottomNavigationBar: NavigationBar(
            overlayColor: const MaterialStatePropertyAll(Colors.white),
            height: 70,
            elevation: 0,
            backgroundColor: Colors.white,
            indicatorColor: Colors.white,
            selectedIndex: bloc.currentIndex,
            onDestinationSelected: (index) =>
                bloc.add(TabBarClicked(index: index)),
            destinations: [
              NavigationDestination(
                icon: Icon(
                  bloc.currentIndex == 0 ? Iconsax.home_25 : Iconsax.home,
                  color: TColors.primary,
                  size: 29,
                ),
                label: "",
              ),
              NavigationDestination(
                icon: Icon(
                  bloc.currentIndex == 1
                      ? Iconsax.shopping_cart5
                      : Iconsax.shopping_cart,
                  color: TColors.primary,
                  size: 29,
                ),
                label: "",
              ),
              NavigationDestination(
                icon: Icon(
                  bloc.currentIndex == 2
                      ? Iconsax.notification5
                      : Iconsax.notification,
                  color: TColors.primary,
                  size: 29,
                ),
                label: "",
              ),
              NavigationDestination(
                icon: Icon(
                  bloc.currentIndex == 3
                      ? Iconsax.profile_circle5
                      : Iconsax.profile_circle4,
                  color: TColors.primary,
                  size: 29,
                ),
                label: "",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _createBody(BuildContext context, int index) {
    final children = [
      const HomePage(),
      const CartPage(),
      const NotificationPage(),
      const ProfilePage(),
    ];
    return children[index];
  }
}
