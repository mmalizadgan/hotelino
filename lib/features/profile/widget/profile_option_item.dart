import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/core/constants/constants.dart';

class ProfileOptionItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;
  const ProfileOptionItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, bottom: 16.h, left: 40.w),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios_new_rounded, size: 14.sp),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(width: 17.w),
            InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkButton
                      : Color(0xFFEAE3DE),
                ),
                child: icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
