import 'package:findmind_task/provider/quizProvider.dart';
import 'package:findmind_task/widgets/background.dart';
import 'package:findmind_task/widgets/customAppBar.dart';
import 'package:findmind_task/widgets/scoreBubble.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bgHeight = size.height * 0.55;
    final scoreContainerHeight = 180.0;
    final scoreContainerWidth = size.width - 40;
    final options = [
      {
        "icon": FontAwesomeIcons.undo,
        "footer": "Play Again",
        "color": Colors.blue
      },
      {
        "icon": FontAwesomeIcons.eye,
        "footer": "Review Answer",
        "color": Colors.orange
      },
      {
        "icon": Icons.share,
        "footer": "Share Score",
        "color": Colors.deepPurple
      },
      {
        "icon": FontAwesomeIcons.filePdf,
        "footer": "Generate PDF",
        "color": Colors.blue,
      },
      {
        "icon": FontAwesomeIcons.home,
        "footer": "Home",
        "color": Colors.pink,
      },
      {
        "icon": Icons.leaderboard,
        "footer": "Leaderboard",
        "color": Colors.grey
      },
    ];

    Widget scoreBoard = Positioned(
      top: bgHeight - scoreContainerHeight / 2,
      left: 20,
      child: Container(
        height: scoreContainerHeight,
        width: scoreContainerWidth,
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
                customTile("100%", "Completion", Colors.deepPurple),
                customTile("20", "Total Question", Colors.blue)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customTile("13", "Correct", Colors.green),
                customTile("07", "Wrong", Colors.red),
              ],
            )
          ],
        ),
      ),
    );
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
            scoreBoard,
            Options(
                size: size,
                bgHeight: bgHeight,
                scoreContainerHeight: scoreContainerHeight,
                options: options),
            IconButton(
                icon: Icon(Icons.get_app),
                onPressed: () {
                  Provider.of<QuizProvider>(context, listen: false)
                      .loadProducts();
                }),
          ],
        ),
      ),
    );
  }

  Expanded customTile(String title, String subTitle, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Icon(
                Icons.circle,
                size: 10,
                color: color,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: color),
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

class Options extends StatelessWidget {
  const Options({
    Key key,
    @required this.size,
    @required this.bgHeight,
    @required this.scoreContainerHeight,
    @required this.options,
  }) : super(key: key);

  final Size size;
  final double bgHeight;
  final double scoreContainerHeight;
  final List<Map<String, Object>> options;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: size.height - bgHeight - scoreContainerHeight / 2,
        width: size.width,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: options[index]['color']),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Okay'))
                            ],
                            title: Text('${options[index]["footer"]} tapped!'),
                          ),
                        );
                      },
                      child: Icon(
                        options[index]['icon'],
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    options[index]['footer'],
                  ),
                ],
              ),
            ),
            itemCount: options.length,
          ),
        ),
      ),
    );
  }
}
