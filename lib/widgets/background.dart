import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    Key key,
    @required this.topWidgetHeight,
    @required this.s,
    @required this.radius,
  }) : super(key: key);

  final double topWidgetHeight;
  final Size s;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: topWidgetHeight,
      width: s.width,
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            // spreadRadius: 4,
            color: Colors.deepPurple.withOpacity(0.38),
            offset: Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
      ),
    );
  }
}
