import 'package:hotelino/features/home/data/models/bed_type.dart';
import 'package:hotelino/features/home/data/models/location.dart';

class Hotel {
  final String id;
  final String name;
  final String description;
  final List<String> images; //index 0 is main image for show
  final double rating;
  final int reviewCount;
  final int pricePerNight;
  final Location location;
  final int maxOccupancy;
  final String city;
  final String country;
  final String address;
  final BedType bedType;
  final List<String> amenities;

  Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.rating,
    required this.reviewCount,
    required this.pricePerNight,
    required this.location,
    required this.maxOccupancy,
    required this.city,
    required this.country,
    required this.address,
    required this.bedType,
    required this.amenities,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    rating: json["rating"].toDouble(),
    reviewCount: json["reviewCount"],
    pricePerNight: json["pricePerNight"],
    location: Location.fromJson(json["location"]),
    maxOccupancy: json["maxOccupancy"],
    city: json["city"],
    country: json["country"],
    address: json["address"],
    bedType: BedType.fromJson(json["bedType"]),
    amenities: List<String>.from(json["amenities"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "rating": rating,
    "reviewCount": reviewCount,
    "pricePerNight": pricePerNight,
    "location": location.toJson(),
    "maxOccupancy": maxOccupancy,
    "city": city,
    "country": country,
    "address": address,
    "bedType": bedType.toJson(),
    "amenities": List<dynamic>.from(amenities.map((x) => x)),
  };
}
