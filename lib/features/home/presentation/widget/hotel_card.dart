import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/core/utils/price_formater.dart';
import 'package:hotelino/features/home/data/models/hotels.dart';
import 'package:hotelino/features/home/presentation/provider/favorite_item_provider.dart';
import 'package:hotelino/routes/test.dart';
import 'package:provider/provider.dart';

class HotelCard extends StatelessWidget {
  Hotel hotel;
  HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final favoriteItemProvider = Provider.of<FavoriteItemProvider>(context);
    final isFavorite = favoriteItemProvider.isFavorite(hotel.id);
    return SizedBox(
      width: 232.w,
      height: 280.h,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: []),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SizedBox(width: 12.w),
                      Icon(Icons.star, size: 20, color: Colors.amber),
                      SizedBox(width: 2.w),
                      Text(
                        "${hotel.rating} (${priceFormater(hotel.reviewCount)})",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
