import 'package:hive/hive.dart';
import 'package:job_camer/src/models/global/global.dart';
import 'package:job_camer/src/models/user/user.dart';
import 'package:job_camer/src/shared/constants/string_const.dart';

class ConfigRepository {
  static final configs = _getConfigs();

  static GlobalConfig _getConfigs() {
    return Hive.box<GlobalConfig>(AppStrings.configBox).get('global') ??
        GlobalConfig();
  }

  static Future save() async {
    await Hive.box<GlobalConfig>(AppStrings.configBox).put('global', configs);
  }

  static Future setCurrentUser(User? user) async {
    configs.user = user;
    await save();
  }

  static bool isUserLoggedIn() {
    return configs.user != null;
  }
}
