import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiniJobCard extends StatefulWidget {
  const MiniJobCard({
    super.key,
    this.text = "A Temps partiel",
    required this.assetPath,
    required this.count,
  });

  final String text;
  final String assetPath;
  final int count;

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
    return Stack(
      children: [
        // Banner(
        //   message: "${widget.count}k",
        //   location: BannerLocation.topStart,
        //   color: _color ?? Get.theme.primaryColor,
        // ),
        Badge(
          label: Text("${widget.count}"),
          backgroundColor: _color ?? Get.theme.primaryColor,
          smallSize: 25,
          largeSize: 25,
        ),

        Container(
          decoration: BoxDecoration(
            color: _color?.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(widget.assetPath),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                  width: double.maxFinite,
                ),
                Text(widget.text),
              ],
            ),
          ),
        ),
      ],
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
