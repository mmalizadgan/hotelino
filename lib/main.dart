import 'package:flutter/material.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
import 'package:hotelino/splash_screen/splashScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  //The line below is to check whether Flutter has been able to retrieve the
  //necessary information from the system or not.
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            WidgetsBinding.instance.platformDispatcher.platformBrightness,
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
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
