import 'package:flutter/material.dart';
import 'package:job_camer/src/shared/constants/assets_const.dart';

class OnboardingSlide1 extends StatelessWidget {
  const OnboardingSlide1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(AppAssets.jobSearchImg),
          Text(
            "Trouvez le Job que vous avez toujours recherché",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 25),
          Text(
            "Trouvez votre prochaine opportunité professionnelle avec notre application de recherche d'emploi. Parcourez des milliers d'offres, postulez en un seul clic, et suivez l'évolution de vos candidatures. Simplifiez votre recherche d'emploi dès maintenant!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
