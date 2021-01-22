import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split/decorations/login_decorations.dart';
import 'package:split/login/login.dart';
import 'package:split/ui/background_image.dart';

class AccountCreated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LogIn())),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              backgroundImage("assets/food_4k_1.jpg"),
              Container(
                color: Color.fromRGBO(21, 58, 81, 0.9),
              ),
              Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Votre compte a bien été crée",
                      style: accountCreatedLabelStyle,
                    ),
                    SizedBox(height: 30),
                    Icon(Icons.check, color: Colors.white, size: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
