import 'package:flutter/widgets.dart';
import 'package:hotelino/features/booking/data/models/booking_models.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingProvider with ChangeNotifier {
  final BookingModels _booking = BookingModels();

  BookingModels get booking => _booking;

  void setFullName(String fullName) {
    booking.fullName = fullName;
  }

  void setPhoneNumber(String phoneNumber) {
    booking.phoneNumber;
  }

  void setDestanation(String destination) {
    booking.destination = destination;
  }

  void setCheckInOutRangeDate(JalaliRange checkInOutRangeDate) {
    booking.checkInOutRangeDate = checkInOutRangeDate;
  }

  void setNumberOfGuests(String numberOfGuestes) {
    booking.numberOfGuests = numberOfGuestes;
  }
}
