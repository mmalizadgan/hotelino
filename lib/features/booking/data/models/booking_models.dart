import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingModels {
  String fullName;
  String destination;
  JalaliRange? checkInOutRangeDate;
  String numberOfGuests;

  BookingModels({
    this.fullName = "",
    this.checkInOutRangeDate,
    this.destination = "",
    this.numberOfGuests = "",
  });
}
