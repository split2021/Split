import 'package:flutter/material.dart';

import '../requests/requests_class.dart';
import '../user/user_inputs_class.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateAccount();
  }
}

class _CreateAccount extends State<CreateAccount> {
  Widget _buildTextField(String hintText) {
    return Container(
        width: MediaQuery.of(context).size.width - 20,
        child: TextField(
          onChanged: (value) {
            if (hintText == "Nom d'utilisateur")
              UserInputs.username = value;
            else if (hintText == "Email")
              UserInputs.email = value;
            else if (hintText == "Mot de passe")
              UserInputs.password = value;
            else if (hintText == "Prénom")
              UserInputs.firstName = value;
            else if (hintText == "Nom")
              UserInputs.lastName = value;
            else if (hintText == "Numéros de téléphone")
              UserInputs.phoneNumber = value;
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                TextStyle(color: Colors.grey, fontSize: 15, height: 0.50),
          ),
        ));
  }

  Widget _appBar() {
    return AppBar(
      title: Container(),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color.fromRGBO(85, 112, 221, 1.0),
              Color.fromRGBO(71, 50, 128, 1.0),
            ],
          ),
        ),
      ),
      automaticallyImplyLeading: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    _buildTextField("Nom d'utilisateur"),
                    _buildTextField("Email"),
                    _buildTextField("Mot de passe"),
                    _buildTextField("Confirmez le mot de passe"),
                    _buildTextField("Prénom"),
                    _buildTextField("Nom"),
                    _buildTextField("Numéros de téléphone"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Requests.createUser();
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color.fromRGBO(85, 112, 221, 1.0),
                        Color.fromRGBO(71, 50, 128, 1.0),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Créer",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
