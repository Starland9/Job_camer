import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: !_isRead()
          ? Get.theme.primaryColor.withOpacity(0.1)
          : index % 2 == 0
              ? Colors.grey.shade200
              : null,
      title: Text(faker.lorem.sentence()),
      subtitle: Text(faker.date.dateTime().toString()),
      leading: const Icon(Icons.notifications_outlined),
      trailing: !_isRead()
          ? Badge(
              backgroundColor: Get.theme.primaryColor,
            )
          : null,
    );
  }

  bool _isRead() {
    return faker.randomGenerator.boolean();
  }
}
