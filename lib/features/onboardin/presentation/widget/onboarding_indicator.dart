import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingIndicator extends StatelessWidget {
  // ✳️ The current active page index
  // ✳️ اندیسی که نشان می‌دهد کدام صفحه فعلاً فعال است
  final int currentIndex;

  // ✳️ Total number of onboarding pages
  // ✳️ تعداد کل صفحات آنبوردینگ
  final int totalPages;

  const OnboardingIndicator({
    super.key,
    required this.currentIndex, // ✳️ باید مقدار فعلی صفحه (ایندکس) را دریافت کند
    required this.totalPages, // ✳️ باید تعداد کل صفحات را دریافت کند
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // ✳️ نمایش اندیکاتورها در وسط صفحه (افقی)
      children: [
        // ✳️ Spread operator (...) expands the list of widgets generated below
        // ✳️ عملگر ... لیست ساخته‌شده را به صورت جدا جدا در children قرار می‌دهد
        ...List.generate(
          totalPages, // ✳️ برای هر صفحه یک دایره بساز
          (index) => AnimatedContainer(
            duration: const Duration(
              milliseconds: 300,
            ), // ✳️ زمان انیمیشن هنگام تغییر وضعیت (۳۰۰ میلی‌ثانیه)
            margin: EdgeInsets.symmetric(
              horizontal: 5.w,
            ), // ✳️ فاصله افقی بین دایره‌ها (قابل تنظیم با screenutil)
            width: currentIndex == index
                ? 18.w
                : 15.w, // ✳️ اگر این دایره فعال است، کمی بزرگ‌تر نمایش داده شود
            height: currentIndex == index
                ? 18.w
                : 15.w, // ✳️ ارتفاع هم مشابه عرض تنظیم می‌شود
            decoration: BoxDecoration(
              shape:
                  BoxShape.circle, // ✳️ شکل دایره‌ای برای هر اندیکاتور (دایره)
              color: currentIndex == index
                  ? Theme.of(context)
                        .colorScheme
                        .primary // ✳️ اگر فعال است، رنگ اصلی تم را بگیر
                  : Theme.of(context).colorScheme.primary.withValues(
                      alpha: 0.3,
                    ), // ✳️ اگر غیرفعال است، همان رنگ با شفافیت کمتر
            ),
          ),
        ),
      ],
    );
  }
}
