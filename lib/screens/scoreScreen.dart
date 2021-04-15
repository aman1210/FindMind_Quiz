import 'package:findmind_task/widgets/background.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var bgHeight = size.height * 0.55;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            BackGround(topWidgetHeight: bgHeight, s: size, radius: 40)
          ],
        ),
      ),
    );
  }
}
