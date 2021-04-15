import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:findmind_task/widgets/background.dart';
import 'package:findmind_task/widgets/customAppBar.dart';
import 'package:findmind_task/widgets/optionsContainer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    double topWidgetHeight = s.height * 0.35;

    double bottomWidgetHeight = s.height - topWidgetHeight;

    const radius = 20.0;

    const questionBoxMargin = 20.0;

    var timerWidget = Positioned(
      top: topWidgetHeight - 125 - 40,
      left: s.width / 2 - 40,
      child: Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: CircularPercentIndicator(
          radius: 72,
          lineWidth: 5,
          animation: true,
          percent: 0.7,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.white,
          progressColor: Theme.of(context).primaryColor,
          center: Text(
            '18',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
    var questionNumber = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Question ',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        Text(
          '13',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              height: 0.9),
        ),
        Text(
          '/20',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ],
    );
    var progress = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        progressIndicator(
            progressNumber: 05,
            percent: 5 / 20,
            color: Colors.green,
            isCorrectProgess: true),
        progressIndicator(
            progressNumber: 07,
            percent: 7 / 20,
            color: Colors.red,
            isCorrectProgess: false),
      ],
    );
    return Scaffold(
      body: Container(
        height: s.height,
        width: s.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              child:
                  OptionContainer(bottomWidgetHeight: bottomWidgetHeight, s: s),
            ),
            BackGround(topWidgetHeight: topWidgetHeight, s: s, radius: radius),
            CustomAppBar(s: s),
            Positioned(
              top: topWidgetHeight - 125,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: questionBoxMargin),
                width: s.width - 2 * questionBoxMargin,
                padding: const EdgeInsets.all(16.0),
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.deepPurple.withOpacity(0.38),
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    progress,
                    SizedBox(
                      height: 25,
                    ),
                    questionNumber,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 20,
                      ),
                      child: Text(
                        'How many students in your class __ from Korea?',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            timerWidget,
          ],
        ),
      ),
    );
  }

  Row progressIndicator(
      {int progressNumber,
      double percent,
      Color color,
      bool isCorrectProgess}) {
    var text = Text(
      '$progressNumber',
      style: TextStyle(color: color, fontWeight: FontWeight.bold),
    );
    var linearPercentIndicator = LinearPercentIndicator(
      progressColor: color,
      percent: percent,
      backgroundColor: Colors.white,
      width: 100,
      lineHeight: 8,
      animation: true,
    );
    return isCorrectProgess
        ? Row(
            children: [
              text,
              linearPercentIndicator,
            ],
          )
        : Row(
            children: [
              Transform.rotate(angle: pi, child: linearPercentIndicator),
              text,
            ],
          );
  }
}
