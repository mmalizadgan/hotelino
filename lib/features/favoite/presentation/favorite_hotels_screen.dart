import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/features/favoite/widget/favorite_item_card.dart';
import 'package:hotelino/features/home/presentation/provider/favorite_item_provider.dart';
import 'package:hotelino/shared/widget/search_bar.dart';
import 'package:provider/provider.dart';

class FavoriteHotelsScreen extends StatelessWidget {
  const FavoriteHotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "هتل های مورد علاقه",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16.h),
            SearchBarWidget(),
            SizedBox(height: 16.h),
            Consumer<FavoriteItemProvider>(
              builder: (context, favoriteProvider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: favoriteProvider.favoriteHotelList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: FavoriteItemCard(
                        hotel: favoriteProvider.favoriteHotelList[index],
                        onRemovefavoriteClick: (String hotelId) {
                          favoriteProvider.toggleFavprite(hotelId);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
