import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:job_camer/src/models/job/job.dart';
import 'package:job_camer/src/screens/job/job_screen.dart';

class JobScreenWithConfettis extends StatefulWidget {
  const JobScreenWithConfettis({super.key, required this.job});

  final Job job;

  @override
  State<JobScreenWithConfettis> createState() => _JobScreenWithConfettisState();
}

class _JobScreenWithConfettisState extends State<JobScreenWithConfettis> {
  late ConfettiController _controllerTopCenter;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 1));

    _audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          JobScreen(
            job: widget.job,
            onApply: () {
              _controllerTopCenter.play();
              _audioPlayer
                  .play(AssetSource('sounds/apply_job.wav'))
                  .then((value) {
                Future.delayed(const Duration(seconds: 5)).then((value) {
                  Navigator.of(context).pop();
                });
              });
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerTopCenter,
              blastDirection: pi / 2,
              maxBlastForce: 5, // set a lower max blast force
              minBlastForce: 2, // set a lower min blast force
              emissionFrequency: 0.05,
              numberOfParticles: 50, // a lot of particles at once
              gravity: 1,
            ),
          ),
        ],
      ),
    );
  }
}
