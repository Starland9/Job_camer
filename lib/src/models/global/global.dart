import 'package:hive/hive.dart';
import 'package:job_camer/src/models/user/user.dart';

part 'global.g.dart';

@HiveType(typeId: 4)
class GlobalConfig {
  @HiveField(0)
  bool isDarkMode = false;

  @HiveField(1)
  String language = "fr";

  @HiveField(2)
  bool isOnBoarding = true;

  @HiveField(3)
  User? user;

  GlobalConfig();
}
