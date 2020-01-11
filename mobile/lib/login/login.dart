import 'package:flutter/material.dart';

import './build_text_field.dart';
import '../home/home.dart';
import '../widgets/background_image.dart';

class LogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogInState();
  }
}

class _LogInState extends State<LogIn> {
  final _usernameInput = TextEditingController();
  final _passwordInput = TextEditingController();

  
  bool _obscureText = true;

  void showHidePassword() {
    setState(() {
      _obscureText == true ? _obscureText = false : _obscureText = true;
    });
  }

  Widget _logoImage(String assets) {
    return Image.asset(assets,
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 5);
  }

  Widget _connectionButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      color: Theme.of(context).primaryColor,
      child: Text(
        'Connexion',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
    );
  }

  Widget _newAccountButton() {
    return FlatButton(
      onPressed: () {},
      child: Text(
        'Nouveau ? Créer un compte',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget _forgotPasswordButton() {
    return FlatButton(
      onPressed: () {},
      child: Text(
        'Mot de passe oublié ?',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding:
            EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            backgroundImage("mobile/assets/food_4k_1.jpg"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _logoImage('mobile/assets/Logo_Split_v1_no_circle.png'),
                      buildTextFieldLogIn('Email', context, _usernameInput,
                          false, showHidePassword),
                      SizedBox(height: 20),
                      buildTextFieldLogIn('Password', context, _passwordInput,
                          _obscureText, showHidePassword),
                      SizedBox(height: 20),
                      _connectionButton(),
                      _forgotPasswordButton(),
                      _newAccountButton(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  _body();
  }
}
