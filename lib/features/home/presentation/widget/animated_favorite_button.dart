import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/shared/widget/glass_morfism.dart';

class AnimatedFavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  const AnimatedFavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });
  @override
  AnimatedFavoriteButtonState createState() => AnimatedFavoriteButtonState();
}

class AnimatedFavoriteButtonState extends State<AnimatedFavoriteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticInOut),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _handleTap() {
    widget.onTap();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,

      child: GlassMorfism(
        borderRadius: 50.r,
        blur: 3,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white60, width: 0.5),
          ),
          child: AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: CircleAvatar(
                  backgroundColor: Colors.white60.withValues(alpha: 0.1),
                  child: Icon(
                    Icons.favorite_rounded,
                    color: widget.isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
