import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OptionContainer extends StatefulWidget {
  const OptionContainer({
    Key key,
    @required this.bottomWidgetHeight,
    @required this.s,
    this.showAns,
  }) : super(key: key);

  final double bottomWidgetHeight;
  final Size s;
  final bool showAns;

  @override
  _OptionContainerState createState() => _OptionContainerState();
}

class _OptionContainerState extends State<OptionContainer> {
  bool lockAns = false;
  int selected = -1;
  int correct = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: widget.bottomWidgetHeight,
      color: Colors.grey[100],
      width: widget.s.width,
      child: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color:
                        index == correct && (selected != -1 || widget.showAns)
                            ? Colors.green
                            : index == selected
                                ? Colors.red
                                : Colors.grey[200],
                    width: 2),
              ),
              child: ListTile(
                  title: Text('Option $index'),
                  trailing:
                      index == correct && (selected != -1 || widget.showAns)
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
                    if (!lockAns) {
                      setState(() {
                        lockAns = true;
                        selected = index;
                      });
                    }
                  }),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
