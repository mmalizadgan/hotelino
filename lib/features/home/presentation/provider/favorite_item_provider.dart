import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/hotels.dart';
import 'package:hotelino/features/home/data/repositories/hotel_repository.dart';

class FavoriteItemProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;
  FavoriteItemProvider(this._hotelRepository) {
    fetchHotels();
  }

  List<Hotel> _hotels = [];

  final List<String> _favoriteHotelsIds = [];
  List<Hotel> get favoriteHotelList =>
      _hotels.where((hotel) => _favoriteHotelsIds.contains(hotel.id)).toList();

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
    notifyListeners();
  }

  bool isFavorite(String hotelId) {
    return _favoriteHotelsIds.contains(hotelId);
  }

  void toggleFavprite(String hotelId) {
    if (_favoriteHotelsIds.contains(hotelId)) {
      _favoriteHotelsIds.remove(hotelId);
    } else {
      _favoriteHotelsIds.add(hotelId);
    }
    notifyListeners();
  }
}
