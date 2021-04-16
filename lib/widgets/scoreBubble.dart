import 'package:flutter/material.dart';

class ScoreBubble extends StatelessWidget {
  const ScoreBubble({
    Key key,
    @required this.bgHeight,
    @required this.scoreContainerHeight,
    @required this.size,
    @required this.score,
  }) : super(key: key);

  final double bgHeight;
  final double scoreContainerHeight;
  final Size size;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bgHeight - scoreContainerHeight / 4,
      width: size.width,
      child: Center(
        child: Container(
          height: 240,
          decoration:
              BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
          child: Center(
            child: Container(
              height: 180,
              decoration:
                  BoxDecoration(color: Colors.white38, shape: BoxShape.circle),
              child: Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your Score',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$score',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'pt',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
