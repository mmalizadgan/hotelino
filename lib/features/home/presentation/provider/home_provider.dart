import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/hotels.dart';
import 'package:hotelino/features/home/data/repositories/hotel_repository.dart';

class HomeProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  HomeProvider(this._hotelRepository) {
    fetchHotels();
  }
  List<Hotel> _hotels = [];
  List<Hotel> get hotels => _hotels;
  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
    notifyListeners();
  }
}
