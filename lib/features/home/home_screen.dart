import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/features/home/data/models/hotels.dart';
import 'package:hotelino/features/home/presentation/provider/home_provider.dart';
import 'package:hotelino/features/home/presentation/widget/ad_banner.dart';
import 'package:hotelino/features/home/presentation/widget/home_app_bar.dart';
import 'package:hotelino/features/home/presentation/widget/hotel__vertical_list.dart';
import 'package:hotelino/features/home/presentation/widget/hotel_list_section.dart';
import 'package:hotelino/features/home/presentation/widget/search_bar.dart';
import 'package:hotelino/features/home/presentation/widget/story_carousel_slider.dart';
import 'package:hotelino/routes/app_route.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16.h),
            SearchBarWidget(),
            SizedBox(height: 20.h),
            AdBanner(),
            SizedBox(height: 32.h),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  hotels: homeProvider.getPopularHotels(),
                  title: "محبوب ترین هتل ها",
                  seeAllHotels: () =>
                      Navigator.of(context).pushNamed(AppRoute.favorites),
                );
              },
            ),
            SizedBox(height: 40.h),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  hotels: homeProvider.getspecialOffers(),
                  title: "پیشنهاد ویژه روز",
                  seeAllHotels: () =>
                      Navigator.of(context).pushNamed(AppRoute.favorites),
                );
              },
            ),
            SizedBox(height: 16.h),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return StoryCarouselSlider(
                  images: homeProvider.getStoryImages(),
                  title: homeProvider.storyTittle,
                );
              },
            ),
            SizedBox(height: 40.h),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelVerticalList(
                  title: "جدیدترین هتل ها",
                  hotels: homeProvider.getnewest(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
