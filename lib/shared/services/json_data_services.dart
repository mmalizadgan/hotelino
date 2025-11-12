import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hotelino/core/constants/constants.dart';
import 'package:hotelino/features/home/data/models/hotels.dart';

class JsonDataServices {
  Future<List<Hotel>> loadHotels() async {
    final String respons = await rootBundle.loadString(AppConstants.hotelsData);

    final Map<String, dynamic> jsonData = json.decode(respons);

    final List<dynamic> hotelsList = jsonData["hotels"];
    return hotelsList
        .map((hotel) => Hotel.fromJson(hotel as Map<String, dynamic>))
        .toList();
  }
}
