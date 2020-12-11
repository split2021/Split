import 'package:flutter/material.dart';
import 'package:split/contact/contact_class.dart';
import 'package:split/decorations/login_decorations.dart';
import 'package:split/requests/requests_class.dart';
import 'package:split/ui/box_shadow.dart';
import 'package:split/user/user_class.dart';
import 'package:split/utils/show_dialog.dart';

class CreateGroupePage extends StatefulWidget {
  final Function updateList;

  CreateGroupePage(this.updateList);

  @override
  State<StatefulWidget> createState() {
    return _CreateGroupePage();
  }
}

class _CreateGroupePage extends State<CreateGroupePage> {
  final _nameInput = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameInput.dispose();
    for (var contact in User.contactList) contact.checked = false;
    super.dispose();
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text("Créez votre groupe",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          )),
    );
  }

  Widget _buildNameTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Nom du groupe',
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
                hintText: 'Nom du groupe',
                hintStyle: logInHintTextStyle,
              ),
              controller: _nameInput,
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
        onPressed: () async {
          if (await Requests.createGroup(_nameInput.text)) {
            Navigator.pop(context);
            widget.updateList();
            buildShowDialog(context, "Groupe", "Votre groupe a été crée !");
          } else {
            Navigator.pop(context);
            buildShowDialog(context, "Groupe", Requests.reasonRequest);
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Theme.of(context).primaryColor,
        child: Text(
          'Créer',
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

  Widget _buildSecondTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15),
      child: Text("Amis",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          )),
    );
  }

  Widget _buildFriend(Contact contact, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: GestureDetector(
        child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: [
                buildBoxShadow(),
              ],
            ),
            child: Row(
              children: [
                Checkbox(
                  onChanged: (value) {
                    setState(() {
                      contact.checked = value;
                    });
                  },
                  value: contact.checked,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${contact.firstName[0].toUpperCase()}${contact.firstName.substring(1).toLowerCase()}" +
                          " " +
                          contact.lastName.toUpperCase(),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${contact.email}",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffA1A1A1)),
                    ),
                  ],
                ),
              ],
            )),
        onTap: () {
          setState(() {
            contact.checked = !contact.checked;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffF5F5F5),
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
            _buildNameTextField(),
            _buildSecondTitle(),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: User.contactList.length,
                  itemBuilder: (context, index) {
                    return _buildFriend(User.contactList[index], index);
                  }),
            ),
            _buildCreateBtn(),
          ],
        ),
      ),
    );
  }
}
