import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/repositories/config_repository.dart';
import 'package:job_camer/src/repositories/user_repository.dart';
import 'package:job_camer/src/screens/auth/login_screen.dart';
import 'package:job_camer/src/screens/job/components/job_tile_card.dart';
import 'package:job_camer/src/shared/screens/pdf_viewer.dart';
import 'package:job_camer/src/shared/utils/methods.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme2 = Theme.of(context).textTheme;
    late final user = ConfigRepository.configs.user!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: _logout, icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 14),
            const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('https://picsum.photos/200')),
            const SizedBox(height: 16),
            Text(
              user.fullname,
              style: textTheme2.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(user.email),
            Text(user.phone),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        onPressed: _importPdfCv,
                        icon: const Icon(Icons.add),
                        label: const Text("Importer CV")),
                  ),
                  if (user.pdfPath != null) ...[
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder()),
                          onPressed: () => _seeCV(context, user.pdfPath!),
                          icon: const Icon(Icons.remove_red_eye),
                          label: const Text("Voir CV")),
                    ),
                  ]
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text("Mes applications", style: textTheme2.headlineSmall),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    ...user.applications.map((e) => JobTileCard(job: e))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _importPdfCv() {
    Get.to(() => const PDFViewerWithProgressBar())?.then((value) {
      if (value is String && value.isNotEmpty) {
        UserRepository.updateUserCv(
          ConfigRepository.configs.user!,
          value,
        );
      }
    });
  }

  void _seeCV(BuildContext context, String filePath) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: PDFView(
              filePath: filePath,
            ),
          );
        });
  }

  void _logout() {
    UserRepository.logout().then((value) {
      ToastUtils.showGoodToast("Deconnecté avec succes");
      Get.offAll(() => const LoginScreen());
    });
  }
}
