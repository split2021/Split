import 'package:flutter/material.dart';
import 'package:split/decorations/login_decorations.dart';
import 'package:split/utils/show_dialog.dart';
import '../requests/requests_class.dart';
import '../user/user_class.dart';

class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditProfile();
  }
}

class _EditProfile extends State<EditProfile> {
  final _firstNameInput = TextEditingController();
  final _lastNameInput = TextEditingController();
  final _usernameInput = TextEditingController();
  final _phoneInput = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _firstNameInput.dispose();
    _lastNameInput.dispose();
    _usernameInput.dispose();
    _phoneInput.dispose();
    super.dispose();
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text("Changez vos informations",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          )),
    );
  }

  Widget _buildTextField(String title, String hint,
      TextEditingController txtController, TextInputType txtType) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
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
            height: 48.0,
            child: TextField(
              keyboardType: txtType,
              style: logInInputStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: hint,
                hintStyle: logInHintTextStyle,
              ),
              controller: txtController,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateBtn() {
    return Container(
      width: double.infinity,
      height: 85,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
          ),
        ],
      ),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Requests.editUserProfile(
              _firstNameInput.text.isEmpty
                  ? User.firstName
                  : (_firstNameInput.text),
              _lastNameInput.text.isEmpty
                  ? User.lastName
                  : (_lastNameInput.text),
              _usernameInput.text.isEmpty
                  ? User.username
                  : (_usernameInput.text),
              _phoneInput.text.isEmpty ? User.phoneNumber : (_phoneInput.text));
          if (Requests.statusCodeRequest == "200") {
            User.firstName = _firstNameInput.text.isEmpty
                ? User.firstName
                : (_firstNameInput.text);
            User.lastName = _lastNameInput.text.isEmpty
                ? User.lastName
                : (_lastNameInput.text);
            User.username = _usernameInput.text.isEmpty
                ? User.username
                : (_usernameInput.text);
            User.phoneNumber = _phoneInput.text.isEmpty
                ? User.phoneNumber
                : (_phoneInput.text);
            Navigator.pop(context);
            buildShowDialog(
                context, "Profil", "Votre profil a été mis à jour !");
          } else {
            Navigator.pop(context);
            buildShowDialog(context, "Profil", Requests.reasonRequest);
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Theme.of(context).primaryColor,
        child: Text(
          'Enregistrer',
          style: logInBtnTextStyle,
        ),
      ),
    );
  }

  Widget _backArrow() {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        margin: MediaQuery.of(context).padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Row(
              children: [
                _backArrow(),
                _buildTitle(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _buildTextField(
                "Prénom", "Prénom", _firstNameInput, TextInputType.name),
            _buildTextField("Nom", "Nom", _lastNameInput, TextInputType.name),
            _buildTextField("Nom d'utilisateur", "Nom d'utilisateur",
                _usernameInput, TextInputType.name),
            _buildTextField("Numéros de téléphone", "Numéros de téléphone",
                _phoneInput, TextInputType.phone),
            Expanded(
              child: Container(),
            ),
            _buildCreateBtn(),
          ],
        ),
      ),
    );
  }
}
