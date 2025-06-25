import 'package:flutter/material.dart';
import 'package:job_camer/src/repositories/config_repository.dart';
import 'package:job_camer/src/screens/global/global_screen.dart';
import 'package:job_camer/src/screens/onboarding/onboarding_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Cette logique détermine le premier écran à afficher en fonction de l'état de connexion.
    final user = ConfigRepository.configs.user;
    if (user != null) {
      return const GlobalScreen();
    } else {
      return const OnboardingScreen();
    }
  }
}
