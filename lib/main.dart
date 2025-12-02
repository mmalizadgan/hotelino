import 'package:flutter/material.dart';
import 'package:hotelino/core/theme/app_theme.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
import 'package:hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:hotelino/features/home/data/repositories/profile_repository.dart';
import 'package:hotelino/features/home/presentation/provider/favorite_item_provider.dart';
import 'package:hotelino/features/home/presentation/provider/home_provider.dart';
import 'package:hotelino/features/home/presentation/provider/profile_provider.dart';
import 'package:hotelino/features/onboardin/data/repositories/onboarding_repository.dart';
import 'package:hotelino/features/onboardin/presentation/onboarding_provider.dart';
import 'package:hotelino/routes/app_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/shared/services/json_data_services.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final hotelRepository = HotelRepository(jsonDataServices: JsonDataServices());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            WidgetsBinding.instance.platformDispatcher.platformBrightness,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => OnboardingProvider(OnboardingRepository()),
        ),
        ChangeNotifierProvider(create: (_) => HomeProvider(hotelRepository)),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(ProfileRepository(), hotelRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoriteItemProvider(hotelRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).updateBrightness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            locale: const Locale("fa", "IR"),
            supportedLocales: const [Locale("fa", "IR"), Locale("en", "US")],
            localizationsDelegates: const [
              PersianMaterialLocalizations.delegate,
              PersianCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'Hotelino',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routes: AppRoute.routes,
            initialRoute: AppRoute.splashPage,
            themeMode: themeProvider.brightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
      ),
    );
  }
}
