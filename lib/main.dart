import 'package:flutter/material.dart';
import 'package:hotelino/splash_screen/splashScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hotelino',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashPage(),
      ),
    );
  }
}
