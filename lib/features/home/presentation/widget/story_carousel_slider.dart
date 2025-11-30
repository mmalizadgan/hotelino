import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import 'package:hotelino/core/utils/network.dart';

class StoryCarouselSlider extends StatefulWidget {
  final List<String> images;
  final List<String> title;

  const StoryCarouselSlider({
    super.key,
    required this.images,
    required this.title,
  });
  @override
  StoryCarouselSliderState createState() => StoryCarouselSliderState();
}

class StoryCarouselSliderState extends State<StoryCarouselSlider> {
  int _curremtIndex = 0;
  late Timer _timer;
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_curremtIndex < widget.images.length - 1) {
        _curremtIndex++;
      } else {
        _curremtIndex = 0;
      }
      _carouselSliderController.animateToPage(_curremtIndex);
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _nextSlide() {
    setState(() {
      if (_curremtIndex < widget.images.length - 1) {
        _curremtIndex++;
      } else {
        _curremtIndex = 0;
      }
      _carouselSliderController.animateToPage(_curremtIndex);
    });
  }

  void _previewSlide() {
    setState(() {
      if (_curremtIndex > 0) {
        _curremtIndex--;
      } else {
        _curremtIndex = widget.images.length - 1;
      }
      _carouselSliderController.animateToPage(_curremtIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: _carouselSliderController,
            options: CarouselOptions(
              height: 250.h,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _curremtIndex = index;
                });
              },
            ),

            items: widget.images.map((imageUrl) {
              return ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16.r),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(networkUrl(imageUrl), fit: BoxFit.cover),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.80),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Positioned(
            top: 10.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: List.generate(widget.images.length, (index) {
                  return Expanded(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: 4.h,
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        color: _curremtIndex >= index
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            right: 16.w,
            child: Text(
              widget.title[_curremtIndex],
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned.fill(
            right: 10.w,
            left: null,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: _nextSlide,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withValues(alpha: 0.6),
                  child: Icon(Icons.chevron_right, color: Colors.black),
                ),
              ),
            ),
          ),
          Positioned.fill(
            left: 10.w,
            right: null,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: _previewSlide,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withValues(alpha: 0.6),
                  child: Icon(Icons.chevron_left, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
