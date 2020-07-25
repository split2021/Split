import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split/login/account_created.dart';

import '../requests/requests_class.dart';
import '../ui/background_image.dart';
import '../decorations/login_decorations.dart';
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

  Widget _buildCustomTextField(
      String title, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: logInLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: logInBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.contacts,
                color: Colors.white,
              ),
              hintText: hint,
              hintStyle: logInHintTextStyle,
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }

  Widget _buildCreateButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AccountCreated()));
          } else
            buildShowDialog(context, Requests.statusCodeRequest, Requests.reasonRequest);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Créer le compte',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
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
          onTap: () => {FocusScope.of(context).unfocus(), print("UNFOCUS")},
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              backgroundImage("assets/food_4k_1.jpg"),
              Container(
                color: Color.fromRGBO(21, 58, 81, 0.9),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Créer un compte',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildCustomTextField(
                          "Entrez votre mail", "Email", _emailInput),
                      SizedBox(height: 20.0),
                      _buildCustomTextField("Entrez votre mot de passe",
                          "Mot de passe", _passwordInput),
                      SizedBox(height: 20.0),
                      _buildCustomTextField("Entrez votre nom d'utilisateur",
                          "Nom d'utilisateur", _usernameInput),
                      SizedBox(height: 20.0),
                      _buildCustomTextField(
                          "Entrez votre prénom", "Prénom", _firstNameInput),
                      SizedBox(height: 20.0),
                      _buildCustomTextField(
                          "Entrez votre nom", "Nom", _lastNameInput),
                      SizedBox(height: 20.0),
                      _buildCustomTextField("Entrez votre numéros de téléphone",
                          "Numéros de téléphone", _phoneNumberInput),
                      SizedBox(height: 10.0),
                      _buildCreateButton(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      print("CLOSED");
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
