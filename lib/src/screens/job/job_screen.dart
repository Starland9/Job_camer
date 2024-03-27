import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/models/job/job.dart';
import 'package:job_camer/src/screens/company/company_screen.dart';
import 'package:job_camer/src/screens/job/job_description_screen.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key, required this.job});

  final Job job;

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  bool isDescription = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            children: [
              const Row(
                children: [BackButton()],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // BackButton(),
                  Expanded(
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        widget.job.companyLogo,
                      ),
                      radius: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          widget.job.title,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Get.theme.primaryColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          "🏠 ${widget.job.company}",
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                          child: Text(
                        "📍 ${widget.job.location}",
                        maxLines: 1,
                      )),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          widget.job.type.toString(),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoButton.filled(
                          padding: const EdgeInsets.all(10),
                          onPressed: _showDescription,
                          child: const Text("Description"),
                        ),
                      ),
                      SizedBox(width: Get.width * 0.02),
                      Expanded(
                        child: CupertinoButton.filled(
                          padding: const EdgeInsets.all(10),
                          onPressed: _showCompany,
                          child: const Text("Company"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  if (isDescription)
                    JobDescriptionScreen(job: widget.job)
                  else
                    const CompanyScreen()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDescription() {}

  void _showCompany() {}
}
