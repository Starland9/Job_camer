import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:job_camer/src/screens/job/components/job_tile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme2 = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 14),
            const CircleAvatar(
              radius: 75,
            ),
            const SizedBox(height: 16),
            Text(
              faker.person.name(),
              style: textTheme2.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(faker.internet.email()),
            Text(faker.phoneNumber.random.fromPattern(['+2376########'])),
            Expanded(
              child: DefaultTabController(
                  length: 2,
                  child: Expanded(
                    child: Column(
                      children: [
                        const TabBar(tabs: [
                          Tab(text: "Mes favoris"),
                          Tab(text: "Mes Offres")
                        ]),
                        Expanded(
                          child: TabBarView(
                            children: [
                              ListView(
                                children: [
                                  ...List.generate(
                                      12, (index) => const JobTileCard())
                                ],
                              ),
                              ListView(
                                children: [
                                  ...List.generate(
                                      12, (index) => const JobTileCard())
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
