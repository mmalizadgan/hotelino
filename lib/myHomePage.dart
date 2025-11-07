import 'package:flutter/material.dart';
import 'package:hotelino/core/theme/app_theme.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeModeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeModeProvider.brightness == Brightness.light
              ? AppTheme.lightTheme
              : AppTheme.darkTheme,
          home: Center(
            child: ElevatedButton(
              onPressed: () {
                themeModeProvider.toggleTheme();
              },
              child: Text("Change Theme"),
            ),
          ),
        );
      },
    );
  }
}
