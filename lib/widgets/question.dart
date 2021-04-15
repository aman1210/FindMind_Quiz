import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Question extends StatefulWidget {
  const Question({
    Key key,
    @required this.topWidgetHeight,
    @required this.s,
  }) : super(key: key);

  final double topWidgetHeight;

  final Size s;

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var questionNumber = 13;

  var question = Expanded(
    child: Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'How many students in your class __ from Korea?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.topWidgetHeight - 125,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: widget.s.width - 2 * 20,
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
                    progressNumber: 05,
                    percent: 5 / 20,
                    color: Colors.green,
                    isCorrectProgess: true,
                    width: (widget.s.width - 200) / 2),
                progressIndicator(
                    progressNumber: 07,
                    percent: 7 / 20,
                    color: Colors.red,
                    isCorrectProgess: false,
                    width: (widget.s.width - 200) / 2),
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
            ),
            question,
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
