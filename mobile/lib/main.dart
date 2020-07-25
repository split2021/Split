// ignore: unused_import
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:split/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HomePage',
        theme: ThemeData(
          primaryColor: Color(0xff1b4965),
          backgroundColor: Colors.white,
        ),
        home: LogIn());
  }
}
