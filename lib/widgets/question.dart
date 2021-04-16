import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'package:findmind_task/provider/quizProvider.dart';

class Question extends StatelessWidget {
  const Question({
    Key key,
    @required this.topWidgetHeight,
    @required this.question,
    @required this.number,
    @required this.s,
    @required this.totalquestion,
  }) : super(key: key);

  final double topWidgetHeight;
  final String question;
  final int number;
  final Size s;
  final int totalquestion;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuizProvider>(context);
    var correct = provider.correct;
    var wrong = provider.wrong;
    return Positioned(
      top: topWidgetHeight - 125,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: s.width - 2 * 20,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                progressIndicator(
                    progressNumber: correct,
                    percent: correct / 5,
                    color: Colors.green,
                    isCorrectProgess: true,
                    width: (s.width - 200) / 2),
                progressIndicator(
                    progressNumber: wrong,
                    percent: wrong / 5,
                    color: Colors.red,
                    isCorrectProgess: false,
                    width: (s.width - 200) / 2),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
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
                  '$number',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 0.9),
                ),
                Text(
                  '/$totalquestion',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Row progressIndicator({
  int progressNumber,
  double percent,
  Color color,
  bool isCorrectProgess,
  double width,
}) {
  var text = Text(
    '$progressNumber',
    style: TextStyle(color: color, fontWeight: FontWeight.bold),
  );
  var linearPercentIndicator = LinearPercentIndicator(
    progressColor: color,
    percent: percent,
    backgroundColor: Colors.white,
    width: width,
    lineHeight: 8,
    animation: true,
    animateFromLastPercent: true,
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
