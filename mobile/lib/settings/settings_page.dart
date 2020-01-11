import 'package:flutter/material.dart';
import '../login/login.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Déconnexion"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogIn()));
            },
          ),
        ),
      ),
    );
  }
}
