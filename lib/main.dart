import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/screens/global/global_screen.dart';
import 'package:job_camer/src/shared/constants/string_const.dart';
import 'package:job_camer/src/shared/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.light(),
      debugShowCheckedModeBanner: false,
      home: const GlobalScreen(),
      locale: const Locale('fr', 'FR'),
    );
  }
}
