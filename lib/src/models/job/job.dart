import 'package:hive/hive.dart';

part 'job.g.dart';

@HiveType(typeId: 2)
enum JobType {
  @HiveField(0)
  fullTime,

  @HiveField(1)
  partTime,

  @HiveField(2)
  remote,
}

@HiveType(typeId: 1)
class Job {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String company;

  @HiveField(4)
  String companyLogo;

  @HiveField(5)
  String location;

  @HiveField(6)
  String salary;

  @HiveField(7)
  String requirements;

  @HiveField(8)
  JobType type;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.company,
    required this.companyLogo,
    required this.location,
    required this.salary,
    required this.requirements,
    required this.type,
  });
}
