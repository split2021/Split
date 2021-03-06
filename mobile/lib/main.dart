import 'package:flutter/material.dart';
import 'package:split/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomePage',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(85, 112, 221, 1.0),
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: LogIn(),
      ),
    );
  }
}
