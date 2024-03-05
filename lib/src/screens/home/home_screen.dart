import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/screens/home/components/mini_job_card.dart';
import 'package:job_camer/src/shared/constants/assets_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello\nLandry",
                    style: Get.textTheme.titleMedium?.copyWith(
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      "https://picsum.photos/200",
                    ),
                  )
                ],
              ),
              SizedBox(height: Get.height * 0.05),
              Text("Mes opportunités", style: Get.textTheme.titleLarge),
              SizedBox(height: Get.height * 0.05),
              SizedBox(
                height: Get.height * 0.25,
                child: const Row(
                  children: [
                    Expanded(
                      child: MiniJobCard(
                        text: "A Temps partiel",
                        assetPath: AppAssets.partTimeJobIcon,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: MiniJobCard(
                              text: "A Temps complet",
                              assetPath: AppAssets.fullTimeJobIcon,
                            ),
                          ),
                          Expanded(
                            child: MiniJobCard(
                              text: "A Distance",
                              assetPath: AppAssets.remoteJobIcon,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
