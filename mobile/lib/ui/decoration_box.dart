import 'package:flutter/material.dart';

Widget buildDecorationBox(double left, double top) {
  return Positioned(
    left: left,
    top: top,
    child: RotationTransition(
      turns: AlwaysStoppedAnimation(45 / 360),
      child: Container(
        height: 370,
        width: 370,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.08),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    ),
  );
}
