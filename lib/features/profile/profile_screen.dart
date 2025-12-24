import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelino/core/constants/constants.dart';
import 'package:hotelino/features/home/presentation/provider/profile_provider.dart';
import 'package:hotelino/features/profile/widget/profile_option_item.dart';
import 'package:hotelino/features/profile/widget/profile_svg_icon_style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        final profile = profileProvider.profile;

        if (profile == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : NetworkImage(profile.avatarUrl),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            width: 34.w,
                            height: 34.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Text(
                    profile.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    profile.email,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 40.h),
                  ProfileOptionItem(
                    title: "اطلاعات صفحه کاربری",
                    icon: AppSvgIcon(asset: SvgIcons.profile),
                    onTap: () {},
                  ),
                  ProfileOptionItem(
                    title: "اعلان ها",
                    icon: AppSvgIcon(asset: SvgIcons.notification),
                    onTap: () {},
                  ),
                  ProfileOptionItem(
                    title: "لیست مورد علاقه ها",
                    icon: AppSvgIcon(asset: SvgIcons.favoriteList),
                    onTap: () {},
                  ),
                  ProfileOptionItem(
                    title: "فراموشی رمز عبور",
                    icon: AppSvgIcon(asset: SvgIcons.carbonPassword),
                    onTap: () {},
                  ),
                  ProfileOptionItem(
                    title: "روش های پرداخت",
                    icon: AppSvgIcon(asset: SvgIcons.payment),
                    onTap: () {},
                  ),
                  ProfileOptionItem(
                    title: "تتنظیمات",
                    icon: AppSvgIcon(asset: SvgIcons.setting),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
