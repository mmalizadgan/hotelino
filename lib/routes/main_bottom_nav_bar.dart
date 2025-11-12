import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelino/core/constants/constants.dart';
import 'package:hotelino/routes/test.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  _buildScreen() {
    return [Home(), favorit(), booking(), profile()];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/nav_home.svg",
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        activeColorPrimary: AppColors.primaryColor,
        inactiveIcon: SvgPicture.asset(
          "assets/images/nav_home.svg",
          width: 20.w,
          height: 20.h,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/nav_favorite.svg",
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        activeColorPrimary: AppColors.primaryColor,
        inactiveIcon: SvgPicture.asset(
          "assets/images/nav_favorite.svg",
          width: 20.w,
          height: 20.h,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/nav_booking.svg",
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        activeColorPrimary: AppColors.primaryColor,
        inactiveIcon: SvgPicture.asset(
          "assets/images/nav_booking.svg",
          width: 20.w,
          height: 20.h,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/nav_profile.svg",
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        activeColorPrimary: AppColors.primaryColor,
        inactiveIcon: SvgPicture.asset(
          "assets/images/nav_profile.svg",
          width: 20.w,
          height: 20.h,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreen(),
      items: _navBarItems(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      navBarStyle: NavBarStyle.style7,
      hideNavigationBarWhenKeyboardAppears: true,
      stateManagement: true,
      handleAndroidBackButtonPress: true,
      confineToSafeArea: true,
      animationSettings: NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(microseconds: 300),
          curve: Curves.easeIn,
        ),
      ),
    );
  }
}
