import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
        scaffoldBackgroundColor: CupertinoColors.white,
        textTheme: GoogleFonts.latoTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Get.theme.primaryColorLight.withOpacity(0.3),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.green,
              systemNavigationBarColor: Colors.green,
            )));
  }
}
