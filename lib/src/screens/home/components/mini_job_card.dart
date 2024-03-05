
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/shared/constants/assets_const.dart';

class MiniJobCard extends StatefulWidget {
  const MiniJobCard({
    super.key,
    this.text = "A Temps partiel",
    required this.assetPath,
  });

  final String text;
  final String assetPath;

  @override
  State<MiniJobCard> createState() => _MiniJobCardState();
}

class _MiniJobCardState extends State<MiniJobCard> {
  Color? _color;

  @override
  void initState() {
    _setColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _color?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                AppAssets.fullTimeJobIcon,
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Text(widget.text),
          ],
        ),
      ),
    );
  }

  void _setColor() {
    ColorScheme.fromImageProvider(provider: AssetImage(widget.assetPath))
        .then((value) {
      setState(() {
        _color = value.primary;
      });
    });
  }
}
