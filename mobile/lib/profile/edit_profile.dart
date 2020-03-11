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
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
            Color.fromRGBO(85, 112, 221, 1.0),
            Color.fromRGBO(71, 50, 128, 1.0),
          ]))),
      automaticallyImplyLeading: true,
    );
  }

  Widget _createTextInput(String hintText) {
    return Container(
        width: MediaQuery.of(context).size.width - 20,
        child: TextField(
            onChanged: (value) {
              if (hintText == "Username")
                User.username = value;
              else if (hintText == "Mail")
                User.email = value;
              else if (hintText == "First name")
                User.firstName = value;
              else if (hintText == "Name")
                User.lastName = value;
              else if (hintText == "Phone number") User.phoneNumber = value;
            },
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  TextStyle(color: Colors.grey, fontSize: 16, height: 0.50),
            )));
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
                    child: Text("Edit your Profile",
                        style: TextStyle(
                            color: Color.fromRGBO(71, 50, 128, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 24)))),
            _createTextInput("First name"),
            _createTextInput("Name"),
            _createTextInput("Username"),
            _createTextInput("Mail"),
            _createTextInput("Phone number"),
            new GestureDetector(
                onTap: () {
                  Requests.editUserProfile();
                },
                child: new Container(
                    height: 40,
                    margin: const EdgeInsets.all(30.0),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
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
                      "Edit",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))))
          ]))
        ])));
  }
}
