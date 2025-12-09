import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/features/booking/presentation/widget/booking_form_field.dart';
import 'package:hotelino/features/booking/presentation/widget/number_text_field.dart';
import 'package:hotelino/features/booking/presentation/widget/terms_widget.dart';
import 'package:hotelino/features/booking/provider/booking_provider.dart';
import 'package:hotelino/shared/widget/date_picker_field.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  static final GlobalKey<BookingScreenState> bookingScreenGlobalKey =
      GlobalKey<BookingScreenState>();
  BookingScreen({Key? key}) : super(key: bookingScreenGlobalKey);

  @override
  State<BookingScreen> createState() => BookingScreenState();
}

class BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  void resetForm() {
    Future.delayed(Duration(milliseconds: 100), () {
      _formKey.currentState?.reset();
      TermsWidget.termsKey.currentState?.resetChecked();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "فرم رزور هتل",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Consumer<BookingProvider>(
            builder: (context, bookingProvider, child) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookingFormField(
                      title: "نام و نام خانوادگی",
                      hint: "نام و نام خانوادگی خود را وارد کنید...",
                      initialValue: bookingProvider.booking.fullName,
                      keyboardType: TextInputType.text,
                      validator: (fullName) {
                        if (fullName == null || fullName.isEmpty) {
                          return "لطفا نام خود را کامل بنویسید";
                        }
                        return null;
                      },
                      onSaved: (fullName) {
                        if (fullName != null) {
                          bookingProvider.setFullName(fullName);
                        }
                      },
                    ),
                    SizedBox(height: 32.h),
                    BookingFormField(
                      title: "مقصد",
                      hint: "مقصد خود را وارد کنید...",
                      initialValue: bookingProvider.booking.destination,
                      keyboardType: TextInputType.text,
                      validator: (destination) {
                        if (destination == null || destination.isEmpty) {
                          return "لطفا مقصد را کامل بنویسید";
                        }
                        return null;
                      },
                      onSaved: (destination) {
                        if (destination != null) {
                          bookingProvider.setDestanation(destination);
                        }
                      },
                    ),
                    SizedBox(height: 32.h),
                    DatePickerField(
                      title: "تاریخ رفت و تاریخ برگشت",
                      hint: "بازه اقامت را انتخاب کنید",
                      initialValue: bookingProvider.booking.checkInOutRangeDate,
                      validator: (checkInOutRangeDate) {
                        if (checkInOutRangeDate == null) {
                          return "لطفا بازه زمانی را انتخاب کنید";
                        }
                        return null;
                      },
                      onSaved: (checkInOutRangeDate) {
                        if (checkInOutRangeDate != null) {
                          bookingProvider.setCheckInOutRangeDate(
                            checkInOutRangeDate,
                          );
                        }
                      },
                    ),
                    SizedBox(height: 32.h),
                    BookingFormField(
                      title: "تعداد نفرات",
                      hint: "تعداد نفرات خود را وارد کنید...",
                      initialValue: bookingProvider.booking.numberOfGuests,
                      keyboardType: TextInputType.number,
                      validator: (numberOfGuests) {
                        if (numberOfGuests == null || numberOfGuests.isEmpty) {
                          return "لطفا تعداد نفرات را وارد کنید ";
                        }
                        return null;
                      },
                      onSaved: (numberOfGuests) {
                        if (numberOfGuests != null) {
                          bookingProvider.setNumberOfGuests(numberOfGuests);
                        }
                      },
                    ),
                    SizedBox(height: 32.h),
                    NumberTextField(
                      initialValue: bookingProvider.booking.phoneNumber,
                      validator: (phoneNumber) {
                        if (phoneNumber == null || phoneNumber.isEmpty) {
                          return "لظفا شماره را وارد کنید";
                        }
                        return null;
                      },
                      onSaved: (phoneNumber) {
                        if (phoneNumber != null) {
                          bookingProvider.setPhoneNumber(phoneNumber);
                        }
                      },
                    ),
                    SizedBox(height: 32.h),
                    TermsWidget(
                      initialValue: false,
                      validator: (termsWidget) {
                        if (termsWidget == null || termsWidget == false) {
                          return "لطفا با قوانین برنامه موافقت کنید";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("با موفقیت ثبت شد")),
                            );
                          }
                        },
                        child: Text("جستجوی هتل ها"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
