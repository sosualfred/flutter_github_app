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
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        useMaterial3: false,
        scaffoldBackgroundColor: grey100,
        appBarTheme: const AppBarTheme(
          backgroundColor: grey100,
          foregroundColor: grey600,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: grey600,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: IconThemeData(
            color: secondaryColor,
            size: 28,
          ),
        ),
        iconTheme: const IconThemeData(
          color: secondaryColor,
          size: 28,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: primaryColor,
            size: 28,
          ),
          unselectedIconTheme: IconThemeData(
            color: secondaryColor,
            size: 28,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: primaryColor,
          unselectedLabelColor: grey400,
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: primaryColor,
              ),
            ),
          ),
        ),
      ),
      navigatorKey: outerAppNavKey,
      routes: {
        AppContainer.routeName: (context) => const AppContainer(),
      },
    );
  }
}
