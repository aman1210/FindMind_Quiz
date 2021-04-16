import 'package:flutter/material.dart';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class QuizTimer extends StatefulWidget {
  final double topWidgetHeight;
  final Size s;
  final Function timesUp;
  final bool answerSelected;
  final CountDownController controller;
  QuizTimer(this.topWidgetHeight, this.s, this.timesUp, this.answerSelected,
      this.controller);
  @override
  _QuizTimerState createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.topWidgetHeight - 125 - 40,
      left: widget.s.width / 2 - 40,
      child: CircularCountDownTimer(
        duration: 20,
        initialDuration: 0,
        controller: widget.controller,
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
        onComplete: () {
          widget.timesUp();
        },
      ),
    );
  }
}
