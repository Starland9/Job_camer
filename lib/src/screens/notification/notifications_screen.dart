import 'package:flutter/material.dart';
import 'package:job_camer/src/screens/notification/components/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(18, (index) => NotificationTile(index: index)),
          ],
        ),
      ),
    );
  }
}
