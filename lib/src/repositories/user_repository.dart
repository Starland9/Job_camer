import 'package:hive/hive.dart';
import 'package:job_camer/src/models/user/user.dart';
import 'package:job_camer/src/repositories/config_repository.dart';
import 'package:job_camer/src/shared/constants/string_const.dart';

class UserRepository {
  static final userBox = Hive.box<User>(AppStrings.userBox);

  static Future<User> addUser(User user) async {
    await Future.delayed(const Duration(seconds: 1));
    await userBox.put(user.id, user);
    return user;
  }

  static Future<void> deleteUser(String userId) async {
    await userBox.delete(userId);
  }

  static Future<User?> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      return userBox.values
          .where((user) => user.email == email && user.password == password)
          .first;
    } catch (e) {
      return null;
    }
  }

  static Future logout() async {
    await Future.delayed(const Duration(seconds: 1));
    await ConfigRepository.setCurrentUser(null);
  }
}
