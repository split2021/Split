import 'package:flutter/material.dart';
import 'package:split/login/login.dart';
import './edit_profile.dart';
import './payment_methods.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Stack(
        children: <Widget>[
          Center(
              child: Column(children: <Widget>[
            Align(
                alignment: FractionalOffset.topCenter,
                child: Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 50.0),
                    child: Text("Welcome, Valentin Rubio.",
                        style: TextStyle(
                            color: Color.fromRGBO(71, 50, 128, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 24)))),
            new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                child: new Container(
                    height: 40,
                    margin: const EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color.fromRGBO(85, 112, 221, 1.0),
                              Color.fromRGBO(71, 50, 128, 1.0),
                            ])),
                    child: Center(
                        child: Text(
                      "Edit profile",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )))),
            new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentMethods()));
                },
                child: new Container(
                    height: 40,
                    margin: const EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color.fromRGBO(85, 112, 221, 1.0),
                              Color.fromRGBO(71, 50, 128, 1.0),
                            ])),
                    child: Center(
                        child: Text(
                      "View payment methods",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )))),
          ])),
          new Positioned(
              child: new Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, right: 30.0),
                      child: FloatingActionButton(
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LogIn())),
                          tooltip: 'Disconnect',
                          backgroundColor: Color.fromRGBO(71, 50, 128, 1.0),
                          splashColor: Colors.white,
                          child: Icon(Icons.exit_to_app)))))
        ],
      ),
    );
  }
}
