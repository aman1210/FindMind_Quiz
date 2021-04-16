import 'package:findmind_task/widgets/background.dart';
import 'package:findmind_task/widgets/customAppBar.dart';
import 'package:findmind_task/widgets/scoreBubble.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bgHeight = size.height * 0.55;
    final scoreContainerHeight = 180.0;
    final scoreContainerWidth = size.width - 40;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.grey[200],
        child: Stack(
          children: [
            BackGround(topWidgetHeight: bgHeight, s: size, radius: 40),
            ScoreBubble(
                bgHeight: bgHeight,
                scoreContainerHeight: scoreContainerHeight,
                size: size),
            CustomAppBar(
              s: size,
              isQuizScreen: false,
            ),
            Positioned(
              top: bgHeight - scoreContainerHeight / 2,
              left: 20,
              child: Container(
                height: scoreContainerHeight,
                width: scoreContainerWidth,
                // padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      color: Colors.black26,
                      blurRadius: 20,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customTile("100%", "Completion"),
                        customTile("20", "Total Question")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        customTile("13", "Correct"),
                        customTile("07", "Wrong"),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded customTile(String title, String subTitle) {
    return Expanded(
      child: Container(
        // color: Colors.red,
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Icon(
                Icons.circle,
                size: 10,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
