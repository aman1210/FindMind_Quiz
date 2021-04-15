import 'package:flutter/material.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({
    Key key,
    @required this.bottomWidgetHeight,
    @required this.s,
  }) : super(key: key);

  final double bottomWidgetHeight;
  final Size s;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomWidgetHeight,
      width: s.width,
      // color: Colors.blue,
    );
  }
}
