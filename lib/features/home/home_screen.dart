import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/features/home/presentation/provider/home_provider.dart';
import 'package:hotelino/features/home/presentation/widget/ad_banner.dart';
import 'package:hotelino/features/home/presentation/widget/home_app_bar.dart';
import 'package:hotelino/features/home/presentation/widget/hotel_list_section.dart';
import 'package:hotelino/features/home/presentation/widget/search_bar.dart';
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
          ],
        ),
      ),
    );
  }
}
