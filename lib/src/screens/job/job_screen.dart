import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/screens/company/company_screen.dart';
import 'package:job_camer/src/screens/job/job_description_screen.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // BackButton(),
                  Expanded(
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        "https://picsum.photos/200",
                      ),
                      radius: 60,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Job Title',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Get.theme.primaryColor,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("🏠 Company"),
                      SizedBox(width: 5),
                      Text("📅 Location"),
                      SizedBox(width: 5),
                      Text("⏳ Time"),
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
                    const JobDescriptionScreen()
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
