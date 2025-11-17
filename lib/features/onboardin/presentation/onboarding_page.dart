import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/features/onboardin/presentation/onboarding_provider.dart';
import 'package:hotelino/features/onboardin/presentation/widget/onboarding_button.dart';
import 'package:hotelino/features/onboardin/presentation/widget/onboarding_indicator.dart';
import 'package:hotelino/features/onboardin/presentation/widget/onboarding_item.dart';
import 'package:hotelino/routes/app_route.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);
    final onboardingData = onboardingProvider.onboardingData;
    final totalPage = onboardingData.length;
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (contex, index) {
                final data = onboardingData[index];
                return OnboardingItem(
                  title: data["title"]!,
                  description: data["description"]!,
                  image: data["image"]!,
                );
              },
              controller: _pageController,
              itemCount: totalPage,
              onPageChanged: onboardingProvider.updateCurrentPage,
            ),
          ),
          SizedBox(height: 20.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OnboardingButton(
                  visible: onboardingProvider.currentPage > 0,
                  icon: Icons.arrow_back,
                  onPressed: () => _previosPage(),
                  backgraoundColor: Colors.transparent,
                  iconColor: theme.colorScheme.primary,
                ),
                OnboardingIndicator(
                  currentIndex: onboardingProvider.currentPage,
                  totalPages: totalPage,
                ),
                OnboardingButton(
                  visible: onboardingProvider.currentPage < totalPage - 1,
                  icon: Icons.arrow_forward,
                  onPressed: () => _nextPage(),
                  backgraoundColor: theme.colorScheme.primary,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 53.h),
          if (totalPage > 1) ...[
            AnimatedSwitcher(
              duration: Duration(microseconds: 300),
              transitionBuilder: (child, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: -1,
                  child: child,
                );
              },
              child: onboardingProvider.currentPage == totalPage - 1
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 40.h,
                      ),
                      child: SizedBox(
                        width: 398.w,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoute.home);
                          },
                          child: const Text("شروع رزرو هتل ها"),
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ],
      ),
    );
  }

  void _previosPage() {
    final onboardingProvider = Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );
    if (onboardingProvider.currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _nextPage() {
    final onboardingProvider = Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );
    if (onboardingProvider.currentPage <
        onboardingProvider.onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }
}
