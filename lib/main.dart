import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:job_camer/src/models/global/global.dart';
import 'package:job_camer/src/models/job/job.dart';
import 'package:job_camer/src/models/user/user.dart';
import 'package:job_camer/src/repositories/config_repository.dart';
import 'package:job_camer/src/screens/global/global_screen.dart';
import 'package:job_camer/src/screens/onboarding/onboarding_screen.dart';
import 'package:job_camer/src/shared/constants/string_const.dart';
import 'package:job_camer/src/shared/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter<Job>(JobAdapter());
  Hive.registerAdapter<JobType>(JobTypeAdapter());
  Hive.registerAdapter<User>(UserAdapter());
  Hive.registerAdapter<GlobalConfig>(GlobalConfigAdapter());

  await Hive.openBox<Job>(AppStrings.jobBox);
  await Hive.openBox<JobType>(AppStrings.jobTypeBox);
  await Hive.openBox<User>(AppStrings.userBox);
  await Hive.openBox<GlobalConfig>(AppStrings.configBox);

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
      home: Builder(builder: (context) {
        final user = ConfigRepository.configs.user;
        if (user != null) {
          return const GlobalScreen();
        } else {
          return const OnboardingScreen();
        }
      }),
      locale: const Locale('fr', 'FR'),
    );
  }
}
