import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    @required this.s,
    @required this.isQuizScreen,
  }) : super(key: key);

  final Size s;
  final bool isQuizScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: s.width,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          if (isQuizScreen)
            IconButton(
              icon: Transform.rotate(
                angle: pi / 2,
                child: Icon(
                  FontAwesomeIcons.slidersH,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
        ],
      ),
    );
  }
}
