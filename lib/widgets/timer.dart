import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuizTimer extends StatefulWidget {
  final double topWidgetHeight;
  final Size s;
  final Function TimesUp;
  QuizTimer(this.topWidgetHeight, this.s, this.TimesUp);
  @override
  _QuizTimerState createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  int val = 0;
  CountDownController controller;

  initTimer() {
    controller.restart();
  }

  @override
  void initState() {
    controller = CountDownController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.topWidgetHeight - 125 - 40,
      left: widget.s.width / 2 - 40,
      child: InkWell(
        onTap: initTimer,
        child: CircularCountDownTimer(
          duration: 10,
          initialDuration: 0,
          controller: controller,
          width: 80,
          height: 80,
          ringColor: Colors.grey[300],
          fillColor: Colors.deepPurple,
          backgroundColor: Colors.white,
          strokeWidth: 10.0,
          strokeCap: StrokeCap.round,
          textStyle: TextStyle(
              fontSize: 18.0,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold),
          textFormat: CountdownTextFormat.S,
          isReverse: true,
          isReverseAnimation: true,
          isTimerTextShown: true,
          autoStart: true,
          onStart: () {
            print('Countdown Started');
          },
          onComplete: () {
            widget.TimesUp();
          },
        ),
        // child: Container(
        //   height: 80,
        //   width: 80,
        //   padding: const EdgeInsets.all(4),
        //   decoration:
        //       BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        //   child: CircularPercentIndicator(
        //       radius: 72,
        //       lineWidth: 5,
        //       // animation: true,
        //       percent: (30 - val) / 30,
        //       circularStrokeCap: CircularStrokeCap.round,
        //       backgroundColor: Colors.white,
        //       progressColor: Theme.of(context).primaryColor,
        //       center: Text('${30 - val}')),
        // ),
      ),
    );
  }
}
