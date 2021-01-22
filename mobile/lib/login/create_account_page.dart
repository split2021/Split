import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split/ui/decoration_box.dart';

import '../decorations/login_decorations.dart';
import '../requests/requests_class.dart';
import '../utils/show_dialog.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateAccount();
  }
}

class _CreateAccount extends State<CreateAccount> {
  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();
  final _usernameInput = TextEditingController();
  final _firstNameInput = TextEditingController();
  final _lastNameInput = TextEditingController();
  final _phoneNumberInput = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailInput.dispose();
    _phoneNumberInput.dispose();
    _passwordInput.dispose();
    _usernameInput.dispose();
    _firstNameInput.dispose();
    _lastNameInput.dispose();
    super.dispose();
  }

  Widget _buildEmailTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
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
              hintText: "Email",
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Mot de passe",
          style: logInLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: logInBoxDecorationStyle,
          height: 48.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: logInInputStyle,
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: "Mot de passe",
              hintStyle: logInHintTextStyle,
            ),
            controller: _passwordInput,
          ),
        ),
      ],
    );
  }

  Widget _buildUsernameTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Nom d'utilisateur",
          style: logInLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: logInBoxDecorationStyle,
          height: 48.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: logInInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: "Nom d'utilisateur",
              hintStyle: logInHintTextStyle,
            ),
            controller: _usernameInput,
          ),
        ),
      ],
    );
  }

  Widget _buildFirstNameTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Prénom",
          style: logInLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: logInBoxDecorationStyle,
          height: 48.0,
          child: TextField(
            keyboardType: TextInputType.name,
            style: logInInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: "Prénom",
              hintStyle: logInHintTextStyle,
            ),
            controller: _firstNameInput,
          ),
        ),
      ],
    );
  }

  Widget _buildLastNameTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Nom",
          style: logInLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: logInBoxDecorationStyle,
          height: 48.0,
          child: TextField(
            keyboardType: TextInputType.name,
            style: logInInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: "Nom",
              hintStyle: logInHintTextStyle,
            ),
            controller: _lastNameInput,
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Numéro de téléphone",
          style: logInLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: logInBoxDecorationStyle,
          height: 48.0,
          child: TextField(
            keyboardType: TextInputType.phone,
            style: logInInputStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: "Numéro de téléphone",
              hintStyle: logInHintTextStyle,
            ),
            controller: _phoneNumberInput,
          ),
        ),
      ],
    );
  }

  Widget _buildCreateButton() {
    return Container(
      width: double.infinity,
      height: 42,
      child: RaisedButton(
        onPressed: () async {
          if (_emailInput != null &&
              _passwordInput != null &&
              _firstNameInput != null &&
              _lastNameInput != null &&
              _phoneNumberInput != null &&
              await Requests.createUser(
                      _emailInput.text,
                      _passwordInput.text,
                      _usernameInput.text,
                      _firstNameInput.text,
                      _lastNameInput.text,
                      _phoneNumberInput.text) ==
                  true) {
            Navigator.pop(context);
            buildShowDialog(
                context, "Bienvenue sur Split!", "Votre compte a été crée");
          } else
            buildShowDialog(
                context, "Une erreur s'est produite", Requests.reasonRequest);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Theme.of(context).primaryColor,
        child: Text("S'inscrire", style: logInBtnTextStyle),
      ),
    );
  }

  Widget _buildLogInRedirect() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Déjà un comtpe ? ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: "Se connecter",
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

  Widget _buildFormsContainer() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30.0),
              _buildEmailTextField(),
              SizedBox(height: 20.0),
              _buildPasswordTextField(),
              SizedBox(height: 20.0),
              _buildUsernameTextField(),
              SizedBox(height: 20.0),
              _buildFirstNameTextField(),
              SizedBox(height: 20.0),
              _buildLastNameTextField(),
              SizedBox(height: 20.0),
              _buildPhoneTextField(),
              SizedBox(height: 40.0),
              _buildCreateButton(),
              SizedBox(
                height: 30,
              ),
              _buildLogInRedirect(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backArrow() {
    return Positioned(
      top: MediaQuery.of(context).size.height / 20,
      left: MediaQuery.of(context).size.width / 20,
      child: Container(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => {
            FocusScope.of(context).unfocus(),
          },
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top + 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "S'inscrire",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildFormsContainer(),
                ],
              ),
              _backArrow()
            ],
          ),
        ),
      ),
    );
  }
}
