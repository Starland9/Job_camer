import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobDescriptionScreen extends StatelessWidget {
  const JobDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context, "Job Description"),
        const SizedBox(height: 10),
        Text(Faker().lorem.sentences(3).join("/n")),
        const SizedBox(height: 20),
        _buildTitle(context, "Requirements"),
        const SizedBox(height: 10),
        for (var sentence in Faker().lorem.sentences(5)) Text("✅ $sentence"),
        const SizedBox(height: 20),
        _buildTitle(context, "Responsibilities"),
        const SizedBox(height: 10),
        Text(Faker().lorem.sentences(3).join("/n")),
        const SizedBox(height: 20),
        CupertinoButton.filled(onPressed: _apply, child: const Text("Apply")),
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
