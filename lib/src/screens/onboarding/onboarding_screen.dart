import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/screens/auth/register_screen.dart';
import 'package:job_camer/src/screens/onboarding/slides/slide_1.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: OnboardingSlide1()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onDoneTap,
        child: const Icon(Icons.chevron_right),
      ),
    );
  }

  // List<Widget> get _slides => [
  //       const OnboardingSlide1(),
  //     ];

  void _onDoneTap() {
    Get.to(() => const RegisterScreen());
  }
}
