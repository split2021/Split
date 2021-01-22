import 'package:flutter/material.dart';

BoxShadow buildBoxShadow() {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    blurRadius: 5.0,
    spreadRadius: 1.5,
    offset: Offset(3.0, 3.0), // shadow direction: bottom right
  );
}
