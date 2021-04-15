import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OptionContainer extends StatefulWidget {
  const OptionContainer({
    Key key,
    @required this.bottomWidgetHeight,
    @required this.s,
  }) : super(key: key);

  final double bottomWidgetHeight;
  final Size s;

  @override
  _OptionContainerState createState() => _OptionContainerState();
}

class _OptionContainerState extends State<OptionContainer> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
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
                    color: index == selected ? Colors.green : Colors.grey[200],
                    width: 2),
              ),
              child: ListTile(
                  title: Text('Option $index'),
                  trailing: index == selected
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : Icon(FontAwesomeIcons.circle),
                  onTap: () {
                    setState(() {
                      selected = index;
                    });
                  }),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
