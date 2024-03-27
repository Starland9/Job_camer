import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 3)
class User {
  @HiveField(0)
  String id;

  @HiveField(1)
  String fullname;

  @HiveField(2)
  String email;

  @HiveField(3)
  String password;

  @HiveField(4)
  String phone;

  @HiveField(5)
  bool isAdmin;

  @HiveField(6)
  Uint8List profilePic;

  User({
    required this.id,
    required this.fullname,
    required this.email,
    required this.password,
    required this.phone,
    required this.profilePic,
    required this.isAdmin,
  });
}
