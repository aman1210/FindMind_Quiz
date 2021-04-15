import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({
    Key key,
    @required this.bottomWidgetHeight,
    @required this.s,
    this.showAns,
    this.answerMarker,
    this.selected,
    this.correct,
    this.isAnswerSelected,
  }) : super(key: key);

  final double bottomWidgetHeight;
  final Size s;
  final bool showAns;
  final Function answerMarker;
  final int selected;
  final int correct;
  final bool isAnswerSelected;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        height: bottomWidgetHeight,
        color: Colors.grey[100],
        width: s.width,
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: index == correct && (selected != -1 || showAns)
                          ? Colors.green
                          : index == selected
                              ? Colors.red
                              : Colors.grey[200],
                      width: 2),
                ),
                child: ListTile(
                    title: Text('Option $index'),
                    trailing: index == correct && (selected != -1 || showAns)
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : index == selected
                            ? Icon(
                                FontAwesomeIcons.solidTimesCircle,
                                color: Colors.red,
                              )
                            : Icon(FontAwesomeIcons.circle),
                    onTap: () {
                      if (!isAnswerSelected) answerMarker(index);
                    }),
              );
            },
            itemCount: 4,
          ),
        ),
      ),
    );
  }
}
