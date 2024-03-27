import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/models/job/job.dart';

class JobDescriptionScreen extends StatelessWidget {
  const JobDescriptionScreen({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context, "Job Description"),
        const SizedBox(height: 10),
        Text(job.description),
        const SizedBox(height: 20),
        _buildTitle(context, "Requirements"),
        const SizedBox(height: 10),
        for (var sentence in job.requirements.split("\n")) Text("✅ $sentence"),
        const SizedBox(height: 20),
        _buildTitle(context, "What will you do"),
        const SizedBox(height: 20),
        CupertinoButton.filled(
            onPressed: _apply, child: const Text("Appliquer")),
      ],
    );
  }

  Text _buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  void _apply() {}
}
