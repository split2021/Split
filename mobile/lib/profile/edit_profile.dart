import 'package:flutter/material.dart';
import '../requests/requests_class.dart';
import '../user/user_class.dart';

class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditProfile();
  }
}

class _EditProfile extends State<EditProfile> {
  Widget _appBar() {
    return AppBar(
      title: Container(),
      flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(21, 58, 81, 1),
          )
        ),
      automaticallyImplyLeading: true,
    );
  }

  Widget _createTextInput(String hintText) {
    return Container(
        width: MediaQuery.of(context).size.width - 20,
        child: TextField(
            onChanged: (value) {
              if (hintText == "Nom d'utilisateur")
                User.username = value;
              else if (hintText == "Prénom")
                User.firstName = value;
              else if (hintText == "Nom")
                User.lastName = value;
            },
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  TextStyle(color: Colors.grey, fontSize: 16, height: 0.50),
            )));
  }

  Widget _editProfileButton(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          Requests.editUserProfile();
        },
        child: new Container(
            height: 40,
            margin: const EdgeInsets.all(30.0),
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: Color.fromRGBO(21, 58, 81, 1),
            ),
            child: Center(
                child: Text(
              "Confirmer",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: _appBar(),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
              child: Column(children: <Widget>[
            Align(
                alignment: FractionalOffset.topCenter,
                child: Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
                    child: Text("Modifiez vos informations personnelles",
                        style: TextStyle(
                            color: Color.fromRGBO(21, 58, 81, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 24)))),
            _createTextInput("Prénom"),
            _createTextInput("Nom"),
            _createTextInput("Nom d'utilisateur"),
            _editProfileButton(context)
          ]))
        ])));
  }
}
