import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/home_page_data.dart';

class AppConstants {
  static const String hotelsData = "assets/data/hotels.json";
  static const String baseUrl = 'https://dunijet.ir/content/projects/hotelino/';
}

class AppColors {
  static const Color primaryColor = Color(0xFFB27258);

  //light Theme Colors
  static const Color lightText = Color(0xFF000000);
  static const Color lightHint = Colors.grey;
  static const Color lightInputFill = Color(0xFFF5F5F5);
  static const Color lightBorder = Color(0xFFF5F5F5);
  static const Color lightSelectedBorder = Color(0xFFB27258);

  //dark Theme Colors
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color darkHint = Colors.grey;
  static const Color darkInputFill = Color(0xFF303030);
  static const Color darkBorder = Color(0xFF707070);
  static const Color darkSelectedBorder = Color(0xFFB27258);
  static const Color darkButton = Color(0xFF5D4037);
}

class HomePageDataConstants {
  static const List<String> _favoritesHotelIds = ["1", "3", "5", "7"];
  static const List<String> _discountedHotelIds = ["2", "8", "5", "4"];
  static const List<String> _recentlyViewedHotelIds = ["1", "3", "5", "7"];
  static const List<String> _popularHotelIds = ["1", "2", "3", "4"];
  static const List<String> _specialOffersHotelIds = ["4", "8", "10", "7"];
  static const List<String> _newestHotelIds = ["1", "8", "6", "2"];
  static HomePageData get homePageData => HomePageData(
    favorites: _favoritesHotelIds,
    discounted: _discountedHotelIds,
    recentlyViewed: _recentlyViewedHotelIds,
    popular: _popularHotelIds,
    specialOffers: _specialOffersHotelIds,
    newest: _newestHotelIds,
  );
}
