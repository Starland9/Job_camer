import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

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
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _showDescription,
                        child: const Text("Description"),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDescription() {}
}
