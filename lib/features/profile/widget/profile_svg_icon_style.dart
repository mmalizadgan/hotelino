import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSvgIcon extends StatelessWidget {
  final String asset;
  final double? size;
  final Color? color;

  const AppSvgIcon({super.key, required this.asset, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: size ?? 24.sp,
      height: size ?? 24.sp,
      colorFilter: ColorFilter.mode(
        color ??
            (Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Color(0xFFB27258)),
        BlendMode.srcIn,
      ),
    );
  }
}
