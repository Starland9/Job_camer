import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/screens/job/components/job_tile_card.dart';
import 'package:job_camer/src/screens/job/components/mini_job_card.dart';
import 'package:job_camer/src/screens/notification/notifications_screen.dart';
import 'package:job_camer/src/screens/search/search_screen.dart';
import 'package:job_camer/src/shared/constants/assets_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTabBar(),
              SizedBox(height: Get.height * 0.02),
              Text("Mes opportunités", style: Get.textTheme.titleLarge),
              SizedBox(height: Get.height * 0.02),
              FadeInLeftBig(child: _buildJobsMiniCards()),
              SizedBox(height: Get.height * 0.04),
              Text("Job récents", style: Get.textTheme.titleLarge),
              Column(
                children: [
                  SizedBox(height: Get.height * 0.02),
                  ...List.generate(
                    5,
                    (index) => const JobTileCard(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                "https://picsum.photos/200",
              ),
            ),
            SizedBox(width: Get.width * 0.02),
            Text(
              "Landry Simo",
              style: Get.textTheme.titleMedium?.copyWith(
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          alignment: MainAxisAlignment.center,
          children: [
            IconButton.filledTonal(
              onPressed: _search,
              icon: const Icon(Icons.search_outlined),
            ),
            IconButton.filledTonal(
              onPressed: _notification,
              icon: const Icon(Icons.notifications_outlined),
            )
          ],
        )
      ],
    );
  }

  SizedBox _buildJobsMiniCards() {
    return SizedBox(
      height: Get.height * 0.35,
      child: Row(
        children: [
          const Expanded(
            child: MiniJobCard(
              text: "A plein complet",
              assetPath: AppAssets.fullTimeJobIcon,
              count: 8,
            ),
          ),
          SizedBox(width: Get.width * 0.02),
          Expanded(
            child: Column(
              children: [
                const Expanded(
                  child: MiniJobCard(
                    text: "A temps partiel",
                    assetPath: AppAssets.partTimeJobIcon,
                    count: 15,
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                const Expanded(
                  child: MiniJobCard(
                    text: "A distance",
                    assetPath: AppAssets.remoteJobIcon,
                    count: 12,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _notification() {
    Get.to(() => const NotificationsScreen());
  }

  void _search() {
    Get.to(() => const SearchScreen());
  }
}
