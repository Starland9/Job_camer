import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/screens/admin/create_job_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Administration"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CupertinoButton.filled(
              onPressed: _createJob,
              child: const Text("Créer un emploi"),
            )
          ],
        ),
      ),
    );
  }

  void _createJob() {
    Get.to(() => const CreateJobScreen());
  }
}
