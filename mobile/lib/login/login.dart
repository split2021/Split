import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split/home/home.dart';
import 'package:split/ui/decoration_box.dart';

import '../decorations/login_decorations.dart';
import '../requests/requests_class.dart';
import '../utils/show_dialog.dart';
import 'create_account_page.dart';

class LogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogInState();
  }
}

class _LogInState extends State<LogIn> {
  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();
  final animationDuration = 600;

  bool isExpanded = false;
  bool displayLogin = false;
  bool displayBtn = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailInput.dispose();
    _passwordInput.dispose();
    super.dispose();
  }

  Widget _buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: logInLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: logInBoxDecorationStyle,
          height: 48.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: logInInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: 'Email',
              hintStyle: logInHintTextStyle,
            ),
            controller: _emailInput,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mot de passe',
          style: logInLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: logInBoxDecorationStyle,
          height: 48.0,
          child: TextField(
            obscureText: true,
            style: logInInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: 'Mot de passe',
              hintStyle: logInHintTextStyle,
            ),
            controller: _passwordInput,
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Mot de passe oublié ?',
          style: logInFrgtPsswrdStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      width: double.infinity,
      height: 42,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (_emailInput.text != null &&
              _passwordInput.text != null &&
              await Requests.updateUser(
                      _emailInput.text, _passwordInput.text) ==
                  true) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          } else
            buildShowDialog(
                context, Requests.statusCodeRequest, Requests.reasonRequest);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Theme.of(context).primaryColor,
        child: Text('Se connecter', style: logInBtnTextStyle),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateAccount()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Pas de compte ? ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: "S'inscrire",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return isExpanded
        ? AnimatedDefaultTextStyle(
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
            child: Text("Se connecter"),
            duration: Duration(milliseconds: animationDuration),
          )
        : AnimatedDefaultTextStyle(
            style: TextStyle(
                fontSize: 55, color: Colors.white, fontWeight: FontWeight.bold),
            child: Text("Split"),
            duration: Duration(milliseconds: animationDuration),
          );
  }

  Widget buildFacebookBtn() {
    return Container(
      height: 80,
      child: RaisedButton(
        color: Color(0xffF6F6F6),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/f_logo_RGB-Blue_58 1.png"),
            SizedBox(
              width: 20,
            ),
            Text(
              "Se connecter avec Facebook",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGoogleBtn() {
    return Container(
        height: 80,
        child: RaisedButton(
          color: Color(0xffF6F6F6),
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/Google__G__Logo 1.png"),
              SizedBox(
                width: 20,
              ),
              Text(
                "Se connecter avec Google",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }

  Widget buildEmailBtn() {
    return Container(
        height: 80,
        child: RaisedButton(
          color: Color(0xffF6F6F6),
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded;
              displayBtn = !displayBtn;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.email,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Se connecter avec son email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }

  Widget buildNotExpanded() {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildFacebookBtn(),
          buildGoogleBtn(),
          buildEmailBtn(),
        ],
      ),
    );
  }

  Widget buildOtherConnectionBtn() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          displayLogin = !displayLogin;
        });
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Autres moyens de connexion",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExpanded() {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildEmailTextField(),
          SizedBox(
            height: 20,
          ),
          _buildPasswordTextField(),
          _buildForgotPasswordBtn(),
          SizedBox(
            height: 40,
          ),
          _buildLoginBtn(),
          SizedBox(
            height: 40,
          ),
          _buildSignupBtn(),
          SizedBox(
            height: 30,
          ),
          buildOtherConnectionBtn(),
        ],
      ),
    );
  }

  Widget buildAnimatedContainer() {
    double _expanded = MediaQuery.of(context).size.height;
    double _notExpanded = 320;
    return Flexible(
      child: AnimatedContainer(
        width: double.infinity,
        height: isExpanded ? _expanded : _notExpanded,
        duration: Duration(milliseconds: animationDuration),
        curve: Curves.fastOutSlowIn,
        onEnd: () {
          setState(() {
            if (isExpanded)
              displayLogin = !displayLogin;
            else
              displayBtn = !displayBtn;
          });
        },
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: displayLogin
            ? buildExpanded()
            : displayBtn
                ? buildNotExpanded()
                : Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                color: Theme.of(context).primaryColor,
              ),
              buildDecorationBox(MediaQuery.of(context).size.width * 0.55,
                  MediaQuery.of(context).size.height * 0.1),
              buildDecorationBox(MediaQuery.of(context).size.width * 0.65,
                  MediaQuery.of(context).size.height * 0.1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: buildTitle(),
                  ),
                  buildAnimatedContainer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
