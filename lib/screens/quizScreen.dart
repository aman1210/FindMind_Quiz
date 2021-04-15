import 'dart:ui';

import 'package:findmind_task/widgets/question.dart';
import 'package:flutter/material.dart';

import 'package:findmind_task/widgets/timer.dart';
import 'package:findmind_task/widgets/background.dart';
import 'package:findmind_task/widgets/customAppBar.dart';
import 'package:findmind_task/widgets/optionsContainer.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool isTimesUp = false;

  void TimesUp() {
    setState(() {
      isTimesUp = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double topWidgetHeight = s.height * 0.35;

    double bottomWidgetHeight = s.height - topWidgetHeight - 140.0;

    const radius = 20.0;

    return Scaffold(
      body: Container(
        height: s.height,
        width: s.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            BackGround(topWidgetHeight: topWidgetHeight, s: s, radius: radius),
            CustomAppBar(s: s),
            Question(
              topWidgetHeight: topWidgetHeight,
              s: s,
            ),
            QuizTimer(topWidgetHeight, s, TimesUp),
            Positioned(
              bottom: 0,
              child: OptionContainer(
                bottomWidgetHeight: bottomWidgetHeight,
                s: s,
                showAns: isTimesUp,
              ),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: Align(
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amber),
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_right,
                        size: 30,
                      ),
                      onPressed: () {}),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
