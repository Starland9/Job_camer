import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart' as faker;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/models/job/job.dart';
import 'package:job_camer/src/screens/job/job_screen.dart';

class JobTileCard extends StatefulWidget {
  const JobTileCard({
    super.key,
    required this.job,
  });

  final Job job;

  @override
  State<JobTileCard> createState() => _JobTileCardState();
}

class _JobTileCardState extends State<JobTileCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goToJobDetails,
      child: Card(
        elevation: 1,
        surfaceTintColor: Colors.white70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                          "https://picsum.photos/200"),
                    ),
                    title: Text(
                      widget.job.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.job.company),
                  ),
                ),
                IconButton(
                  onPressed: _more,
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Il y a ${faker.faker.randomGenerator.integer(365)} jours'),
                  Text.rich(
                    TextSpan(
                      text: "${widget.job.salary} XAF",
                      style: TextStyle(
                        color: Get.theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: const [
                        TextSpan(
                          text: "/Mo",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _more() {}

  void _goToJobDetails() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return JobScreen(
        job: widget.job,
      );
    }));
  }
}
