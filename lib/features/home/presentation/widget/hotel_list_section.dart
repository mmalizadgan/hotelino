import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/features/home/data/models/hotels.dart';

class HotelListSection extends StatelessWidget {
  final String title;
  final List<Hotel> hotels;
  final VoidCallback seeAllHotels;
  const HotelListSection({
    super.key,
    required this.hotels,
    required this.title,
    required this.seeAllHotels,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "مشاهده همه",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              Text(title, style: theme.textTheme.displayMedium),
            ],
          ),
          SizedBox(height: 280.h, width: 232.w,
          child: ListView.builder(
            itemCount: hotels.length,
            itemBuilder: (context, index) {
            return ,
          },),
          ),
        ],
      ),
    );
  }
}
