import 'package:flutter/material.dart';

BoxDecoration gradientContainer(
    Color firstColor, Color secondColor, Alignment start, Alignment end) {
  return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[firstColor, secondColor],
      ),
    );
}