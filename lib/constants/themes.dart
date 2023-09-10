import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final light = ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
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
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(
        color: secondaryColor,
        size: 24,
      ),
    ),
    iconTheme: const IconThemeData(
      color: secondaryColor,
      size: 24,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: secondaryColor,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 24,
      ),
      unselectedIconTheme: IconThemeData(
        color: secondaryColor,
        size: 24,
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
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: whiteColor,
      filled: true,
      contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: grey200,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: grey400,
        ),
      ),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    useMaterial3: false,
    scaffoldBackgroundColor: grey900,
    appBarTheme: const AppBarTheme(
      backgroundColor: grey900,
      foregroundColor: grey300,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: grey300,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(
        color: secondaryColor,
        size: 24,
      ),
    ),
    iconTheme: const IconThemeData(
      color: secondaryColor,
      size: 24,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: primaryColor,
      unselectedItemColor: secondaryColor,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 24,
      ),
      unselectedIconTheme: IconThemeData(
        color: secondaryColor,
        size: 24,
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
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: grey800,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: grey400,
        ),
      ),
    ),
  );
}
