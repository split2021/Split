import 'package:flutter/material.dart';

import './build_text_field.dart';
import '../home/home.dart';
import '../widgets/background_image.dart';
import '../requests/requests_class.dart';
import '../user/user_class.dart';
import 'create_account_page.dart';

class LogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogInState();
  }
}

class _LogInState extends State<LogIn> {
  final _usernameInput = TextEditingController();
  final _passwordInput = TextEditingController();
  String typedUsername;
  String typedPassword;

  bool _obscureText = true;

  _updateTypedUsername() {
    typedUsername = _usernameInput.text;
    setState(() {});
  }

  _updateTypedPassword() {
    typedPassword = _passwordInput.text;
    setState(() {});
  }

  void showHidePassword() {
    setState(() {
      _obscureText == true ? _obscureText = false : _obscureText = true;
    });
  }

  @override
  void initState() {
    super.initState();

    typedUsername = "";
    typedPassword = "";
    setState(() {});

    _usernameInput.addListener(_updateTypedUsername);
    _passwordInput.addListener(_updateTypedPassword);
  }

  void dispose() {
    _usernameInput.dispose();
    _passwordInput.dispose();
    super.dispose();
  }

  Widget _logoImage(String assets) {
    return Image.asset(assets,
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 5);
  }

  Widget _connectionButton() {
    User.username = _usernameInput.text;
    User.password = _passwordInput.text;
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      color: Theme.of(context).primaryColor,
      child: Text(
        'Connexion',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        if (User.username != null &&
            User.password != null &&
            await Requests.updateUser(User.username, User.password) == true) {
          // Debug
          print("Username: " + User.username + " Password: " + User.password);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else
          // Debug
          print("Username or password incorrect");
      },
    );
  }

  Widget _newAccountButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateAccount()));
      },
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

  Widget _body(context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding:
            EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            backgroundImage("assets/food_4k_1.jpg"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _logoImage('assets/Logo_Split_v1_no_circle.png'),
                      buildTextFieldLogIn('Email', context, _usernameInput,
                          false, showHidePassword),
                      SizedBox(height: 20),
                      buildTextFieldLogIn('Password', context, _passwordInput,
                          _obscureText, showHidePassword),
                      SizedBox(height: 20),
                      _connectionButton(),
                      _forgotPasswordButton(),
                      _newAccountButton(context),
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
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(85, 112, 221, 1.0),
      ),
      home: Scaffold(
        body: _body(context),
      ),
    );
  }
}
