// ignore: unused_import
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split/login/login.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() => runApp(Phoenix(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HomePage',
        theme: ThemeData(
          primaryColor: Color(0xff556DFF),
          backgroundColor: Colors.white,
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
        home: LogIn());
  }
}
