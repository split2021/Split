import 'package:flutter/material.dart';
import 'package:split/decorations/login_decorations.dart';

void buildShowDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text(
          title,
          style: dialogTitleTxtStyle,
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                message,
                textAlign: TextAlign.center,
                textWidthBasis: TextWidthBasis.parent,
                style: dialogTxtStyle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 140,
              child: RaisedButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Theme.of(context).primaryColor,
                child: Text('Ok', style: dialogBtnTxtStyle),
              ),
            ),
          ],
        ),
      );
    },
  );
}
