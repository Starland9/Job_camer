import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_camer/src/shared/constants/string_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: AppStrings.appName,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.activeBlue,
        scaffoldBackgroundColor: CupertinoColors.white,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            color: CupertinoColors.black,
            fontSize: 17.0,
          ),
          navTitleTextStyle: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            color: CupertinoColors.black,
            fontSize: 17.0,
          ),
          navActionTextStyle: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            color: CupertinoColors.activeBlue,
            fontSize: 17.0,
          ),
          pickerTextStyle: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            color: CupertinoColors.black,
            fontSize: 17.0,
          ),
          navLargeTitleTextStyle: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            color: CupertinoColors.black,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
