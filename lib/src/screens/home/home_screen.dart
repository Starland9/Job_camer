import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:job_camer/src/models/job/job.dart';
import 'package:job_camer/src/repositories/config_repository.dart';
import 'package:job_camer/src/repositories/job_repository.dart';
import 'package:job_camer/src/screens/job/components/job_tile_card.dart';
import 'package:job_camer/src/screens/job/components/mini_job_card.dart';
import 'package:job_camer/src/screens/notification/notifications_screen.dart';
import 'package:job_camer/src/screens/search/search_screen.dart';
import 'package:job_camer/src/shared/constants/assets_const.dart';
import 'package:job_camer/src/shared/constants/string_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final user = ConfigRepository.configs.user!;

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
                  FutureBuilder(
                    future: JobRepository.getJobs(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text("Aucune opportunité pour l'instant"),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return JobTileCard(
                              job: snapshot.data![index],
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  )
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
            if (user.profilePic.isNotEmpty)
              CircleAvatar(
                backgroundImage: MemoryImage(user.profilePic),
              )
            else
              const CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider("https://picsum.photos/200"),
              ),
            SizedBox(width: Get.width * 0.02),
            Text(
              user.fullname,
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
          Expanded(
            child: ValueListenableBuilder(
              builder: (context, box, widget) {
                return MiniJobCard(
                  text: "A plein complet",
                  assetPath: AppAssets.fullTimeJobIcon,
                  count: box.values
                      .where((element) => element.type == JobType.fullTime)
                      .length,
                );
              },
              valueListenable: Hive.box<Job>(AppStrings.jobBox).listenable(),
            ),
          ),
          SizedBox(width: Get.width * 0.02),
          Expanded(
            child: Column(
              children: [
                ValueListenableBuilder(
                  builder: (context, box, widget) {
                    return Expanded(
                      child: MiniJobCard(
                        text: "A temps partiel",
                        assetPath: AppAssets.partTimeJobIcon,
                        count: box.values
                            .where(
                                (element) => element.type == JobType.partTime)
                            .length,
                      ),
                    );
                  },
                  valueListenable:
                      Hive.box<Job>(AppStrings.jobBox).listenable(),
                ),
                SizedBox(height: Get.height * 0.01),
                Expanded(
                  child: ValueListenableBuilder(
                    builder: (context, box, widget) {
                      return MiniJobCard(
                        text: "A distance",
                        assetPath: AppAssets.remoteJobIcon,
                        count: box.values
                            .where((element) => element.type == JobType.remote)
                            .length,
                      );
                    },
                    valueListenable:
                        Hive.box<Job>(AppStrings.jobBox).listenable(),
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
