import 'dart:ui';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:findmind_task/widgets/timer.dart';
import 'package:findmind_task/widgets/background.dart';
import 'package:findmind_task/widgets/customAppBar.dart';
import 'package:findmind_task/widgets/optionsContainer.dart';
import 'package:findmind_task/model/questionModel.dart';
import 'package:findmind_task/provider/quizProvider.dart';
import 'package:findmind_task/screens/scoreScreen.dart';
import 'package:findmind_task/widgets/question.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuestionModel> questions;
  var index = 0;
  bool isTimesUp = false;
  bool answerSelected = false;
  bool resetTimer = true;
  int selected = -1;
  String correct;
  CountDownController controller = CountDownController();

  void TimesUp() {
    setState(() {
      isTimesUp = true;
    });
  }

  void AnswerMarker(int val) {
    setState(() {
      controller.pause();
      selected = val;
      answerSelected = true;
    });
  }

  void NextQuestion() {
    index += 1;

    if (index < questions.length) {
      setState(() {
        correct = questions[index].correct;
        controller.restart();
        selected = -1;
        isTimesUp = false;
        answerSelected = false;
        resetTimer = true;
      });
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ScoreScreen(),
      ));
    }
  }

  loadFirstQuestion() async {
    questions =
        await Provider.of<QuizProvider>(context, listen: false).loadProducts();
    setState(() {
      index = 0;
      correct = questions[index].correct;
    });
  }

  @override
  void initState() {
    loadFirstQuestion();
    super.initState();
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
        child: questions == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                clipBehavior: Clip.none,
                children: [
                  BackGround(
                      topWidgetHeight: topWidgetHeight, s: s, radius: radius),
                  CustomAppBar(
                    s: s,
                    isQuizScreen: true,
                  ),
                  Question(
                    question: questions[index].question,
                    number: index + 1,
                    totalquestion: questions.length,
                    topWidgetHeight: topWidgetHeight,
                    s: s,
                  ),
                  QuizTimer(
                      topWidgetHeight, s, TimesUp, answerSelected, controller),
                  OptionContainer(
                    bottomWidgetHeight: bottomWidgetHeight,
                    s: s,
                    showAns: isTimesUp,
                    answerMarker: AnswerMarker,
                    selected: selected,
                    correct: correct,
                    options: questions[index].options,
                    isAnswerSelected: answerSelected,
                  ),
                  if (isTimesUp || answerSelected)
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
                              onPressed: NextQuestion),
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
