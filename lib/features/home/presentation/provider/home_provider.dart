import 'package:flutter/material.dart';
import 'package:hotelino/core/constants/constants.dart';
import 'package:hotelino/features/home/data/models/home_page_data.dart';
import 'package:hotelino/features/home/data/models/hotels.dart';
import 'package:hotelino/features/home/data/repositories/hotel_repository.dart';

class HomeProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  HomeProvider(this._hotelRepository) {
    fetchHotels();
  }
  List<Hotel> _hotels = [];
  List<Hotel> get hotels => _hotels;

  final HomePageData _homePageData = HomePageDataConstants.homePageData;
  HomePageData get homePageData => _homePageData;

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
    notifyListeners();
  }

  //گرفتن هتل هایی که با آیدی جزو هتل های مورد علاقه جدید و غیره هستند
  List<Hotel> getPopularHotels() {
    return _hotels
        .where((hotel) => _homePageData.popular.contains(hotel.id))
        .toList();
  }

  List<Hotel> getspecialOffers() {
    return _hotels
        .where((hotel) => _homePageData.specialOffers.contains(hotel.id))
        .toList();
  }

  List<Hotel> getfavorites() {
    return _hotels
        .where((hotel) => _homePageData.favorites.contains(hotel.id))
        .toList();
  }

  List<Hotel> getnewest() {
    return _hotels
        .where((hotel) => _homePageData.newest.contains(hotel.id))
        .toList();
  }

  // قسمت استوری صفحه هوم پیج
  List<String> getStoryImages() {
    final shuffledHotels = List<Hotel>.from(_hotels)..shuffle();
    return shuffledHotels.take(3).map((hotel) => hotel.images[0]).toList();
  }

  final List<String> _storyTittle = [
    "امکانات رفاهی کامل ",
    "اقامت در قلب شهر",
    "لوکس ترین هتل ها",
  ];
  List<String> get storyTittle => _storyTittle;
}
