import 'package:hive/hive.dart';
import 'package:job_camer/src/models/job/job.dart';
import 'package:job_camer/src/shared/constants/string_const.dart';

class JobRepository {
  static final jobBox = Hive.box<Job>(AppStrings.jobBox);

  static Future<List<Job>> getJobs() async {
    await Future.delayed(const Duration(seconds: 1));
    return jobBox.values.toList();
  }

  static Future<void> addJob(Job job) async {
    await Future.delayed(const Duration(seconds: 1));
    await jobBox.put(job.id, job);
  }

  static Future<void> updateJob(Job job) async {
    await Future.delayed(const Duration(seconds: 1));
    await jobBox.put(job.id, job);
  }

  static Future<void> deleteJob(String jobId) async {
    await jobBox.delete(jobId);
  }

  static Future<void> clearAllJobs() async {
    await Future.delayed(const Duration(seconds: 1));
    await jobBox.clear();
  }

  static Future<List<Job>> getJobsByType(JobType type) async {
    return jobBox.values
        .where((job) => job.type == type)
        .toList()
        .reversed
        .toList();
  }

  static Future<List<Job>> searchJobs(String query) async {
    await Future.delayed(const Duration(microseconds: 100));
    return jobBox.values
        .where((job) =>
            job.title.toLowerCase().contains(query.toLowerCase()) ||
            job.company.toLowerCase().contains(query.toLowerCase()) ||
            job.description.toLowerCase().contains(query.toLowerCase()) ||
            job.location.toLowerCase().contains(query.toLowerCase()) ||
            job.type.toString().contains(query.toLowerCase()) ||
            job.salary.toLowerCase().contains(query.toLowerCase()) ||
            job.requirements.toLowerCase().contains(query.toLowerCase()) ||
            query == "")
        .toList()
        .reversed
        .toList();
  }
}
