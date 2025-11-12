import 'package:flutter/material.dart';
import 'package:hotelino/features/onboardin/presentation/onboarding_page.dart';
import 'package:hotelino/myHomePage.dart';
import 'package:hotelino/routes/main_bottom_nav_bar.dart';
import 'package:hotelino/splash_screen/splashScreen.dart';

class AppRoute {
  static const String home = '/';
  static const String splashPage = '/SplashPage';
  static const String hotelDetail = '/hotel-detail';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String onboarding =
      'lib/features/onboardin/presentation/onboarding_page.dart';
  static const String myHomePage = '/myHomePage';
  static const String navbar = "lib/routes0/main_bottom_nav_bar.dart";

  static final Map<String, WidgetBuilder> routes = {
    myHomePage: (ctx) => const MyHomePage(),
    splashPage: (ctx) => const SplashPage(),
    onboarding: (ctx) => const OnboardingPage(),
    home: (ctx) => const MainBottomNavBar(),
    navbar: (ctx) => const MainBottomNavBar(),
  };
}
