import 'package:flutter/material.dart';

Widget buildTextFieldLogIn(
  String hintText,
  BuildContext context,
  TextEditingController controller,
  bool obscureText,
  Function showHidePassword,
) {
  return Container(
    height: 40,
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: TextField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15, height: 0.50),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(),
          ),
          prefixIcon:
              hintText == 'Email' ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == 'Password'
              ? IconButton(
                  onPressed: () {
                    showHidePassword();
                  },
                  icon: Icon(Icons.visibility_off),
                )
              : null),
      controller: controller,
      obscureText: obscureText,
    ),
  );
}
