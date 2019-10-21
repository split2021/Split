import 'package:flutter/material.dart';

Widget backgroundImage(String assets) {
    return Image(
      image: AssetImage(assets),
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.darken,
      color: Colors.black54,  
    );
  }