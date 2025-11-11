import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingButton extends StatelessWidget {
  final bool visible;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgraoundColor;
  final Color iconColor;

  const OnboardingButton({
    super.key,
    required this.visible,
    required this.icon,
    required this.onPressed,
    required this.backgraoundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: visible
          ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.w,
                ),
              ),
              child: FloatingActionButton(
                key: ValueKey(icon),
                onPressed: onPressed,
                elevation: 0,
                backgroundColor: backgraoundColor,
                shape: const CircleBorder(),
                child: Icon(icon, color: iconColor),
              ),
            )
          : SizedBox(),
    );
  }
}
