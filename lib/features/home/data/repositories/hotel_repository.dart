import 'package:hotelino/features/home/data/models/hotels.dart';
import 'package:hotelino/shared/services/json_data_services.dart';

class HotelRepository {
  final JsonDataServices jsonDataServices;

  HotelRepository({required this.jsonDataServices});

  Future<List<Hotel>> fetchHotels() async {
    return jsonDataServices.loadHotels();
  }

  Future<Hotel> getHotelById(String id) {
    return jsonDataServices.loadHotels().then((hotels) {
      return hotels.firstWhere((hotel) => hotel.id == id);
    });
  }
}
//187