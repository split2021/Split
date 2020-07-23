import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:split/login/login.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      locale: ,
      title: 'HomePage',
      theme: ThemeData(
        primaryColor: Color(0xff1b4965),
        backgroundColor: Colors.white,
      ),
      home: LogIn()
    );
  }
}
