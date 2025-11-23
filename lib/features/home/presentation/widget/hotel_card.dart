import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:hotelino/core/utils/price_formater.dart';
import 'package:hotelino/features/home/data/models/hotels.dart';
import 'package:hotelino/features/home/presentation/provider/favorite_item_provider.dart';
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(
                    networkUrl(hotel.images[0]),
                    width: 216.w,
                    height: 134.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SizedBox(width: 12.w),
                      Icon(Icons.star, size: 15, color: Colors.amber),
                      SizedBox(width: 2.w),
                      Text(
                        "${hotel.rating} (${priceFormater(hotel.reviewCount)})",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Spacer(),
                      Text(
                        hotel.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(width: 8.w),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 8.w),
                      Text(
                        "${hotel.city}, ${hotel.country}",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 2.w),
                      Icon(Icons.location_on, color: Colors.grey, size: 16),
                      SizedBox(width: 8.w),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Text(
                      " شب از  ${priceFormater(hotel.pricePerNight)}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: SizedBox(
                      width: 216.w,
                      height: 30.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "مشاهده و انتخاب اتاق",
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
