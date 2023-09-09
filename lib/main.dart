import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/constants/keys.dart';
import 'package:flutter_github_app/screens/app_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          backgroundColor: grey100,
          foregroundColor: grey600,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: grey600,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(
            color: primaryColor,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryColor,
        ),
        scaffoldBackgroundColor: grey100,
      ),
      navigatorKey: outerAppNavKey,
      routes: {
        AppContainer.routeName: (context) => const AppContainer(),
      },
    );
  }
}
