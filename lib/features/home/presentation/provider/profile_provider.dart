import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/hotels.dart';
import 'package:hotelino/features/home/data/models/profile.dart';
import 'package:hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:hotelino/features/home/data/repositories/profile_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _profileRepository;
  final HotelRepository _hotelRepository;

  Profile? _profile;
  Profile? get profile => _profile;

  List<Hotel> _hotels = [];
  final List<String> _recentlyViewHotels = [];

  ProfileProvider(this._profileRepository, this._hotelRepository) {
    fetchHotels();
    loadUserProfile();
  }

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
  }

  loadUserProfile() async {
    _profile = await _profileRepository.fetchUserProfile();
  }

  //-------recently Viewd Hotels -------------------
  final List<String> _recentlyViewdHotels = [];

  List<Hotel> get recentlyViewdHotels =>
      _hotels.where((hotel) => _recentlyViewHotels.contains(hotel.id)).toList();

  void addRecentlyViewed(String HotelId) {
    if (!recentlyViewdHotels.contains(HotelId)) {
      _recentlyViewHotels.add(HotelId);
      notifyListeners();
    } else {
      _recentlyViewHotels.remove(HotelId);
      _recentlyViewHotels.add(HotelId);
      notifyListeners();
    }
  }
}
