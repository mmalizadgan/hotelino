import 'package:hotelino/features/home/data/models/profile.dart';

class ProfileRepository {
  Future<Profile> fetchUserProfile() async {
    await Future.delayed(Duration(milliseconds: 200));
    return Profile(
      id: "1",
      name: " محمد مهدی علیزادگان",
      email: "mmalizadgann@gmail.com",
      avatarUrl: "https://picsum.photos/200/300",
      phoneNumber: "09181181818",
      locattion: "hamedan",
      bio: " fllutter jounior developer",
      bookings: 5,
      favorites: 3,
      notifications: 3,
    );
  }
}
