import 'package:flutter/material.dart';

Widget backgroundImage(String assets) {
  return Image(
    image: AssetImage(assets),
    fit: BoxFit.cover,
    colorBlendMode: BlendMode.dstATop,
    color: Colors.black38,
  );
}
