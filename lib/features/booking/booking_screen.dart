import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/features/booking/presentation/widget/booking_form_field.dart';
import 'package:hotelino/features/booking/provider/booking_provider.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  void resetForm() {
    Future.delayed(Duration(milliseconds: 100), () {
      _formKey.currentState?.reset();
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
                    BookingFormField(
                      title: "تعداد نفرات",
                      hint: "تعداد نفرات خود را وارد کنید...",
                      initialValue: bookingProvider.booking.numberOfGuests,
                      keyboardType: TextInputType.text,
                      validator: (numberOfGuests) {
                        if (numberOfGuests == null || numberOfGuests.isEmpty) {
                          return "لطفا مقصد را کامل بنویسید";
                        }
                        return null;
                      },
                      onSaved: (numberOfGuests) {
                        if (numberOfGuests != null) {
                          bookingProvider.setNumberOfGuests(numberOfGuests);
                        }
                      },
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
