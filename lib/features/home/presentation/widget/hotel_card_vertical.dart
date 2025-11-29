import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:hotelino/core/utils/price_formater.dart';
import 'package:hotelino/features/home/data/models/hotels.dart';

class HotelCardVertical extends StatelessWidget {
  final Hotel hotel;

  const HotelCardVertical({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          if (Theme.of(context).brightness == Brightness.light)
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              spreadRadius: 2,
            )
          else
            BoxShadow(
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainerHigh.withValues(alpha: 1),
              blurRadius: 6,
              spreadRadius: 2,
            ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h, left: 10.w),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "رزرو اتاق",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 4.h),
                  Text(
                    hotel.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Text(
                        "${hotel.city} ${hotel.country}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Text(
                        " ${hotel.bedType.details}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.bed_outlined,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text("از ${priceFormater(hotel.pricePerNight)}"),
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Image.network(
              networkUrl(hotel.images[0]),
              width: 100.w,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
