import 'package:flutter/material.dart';

import '../requests/requests_class.dart';
import 'contact_class.dart';
import 'contact_listtile.dart';
import '../user/user_class.dart';

class ContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactPageState();
  }
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController editingController = TextEditingController();
  List<Contact> listContact = [];
  String typedText;

  _updateTypedValue() {
    setState(() {
      typedText = editingController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    Requests.getContactList().then((value) {
      setState(() {
        listContact = value;
        typedText = "";
      });
    });

    editingController.addListener(_updateTypedValue);
  }

  Future<void> _updateList() async {
    Requests.getContactList().then((value) {
      setState(() {
        listContact = value;
      });
    });
  }

  Future<void> _addFriend(int id1, int id2) async {
    Requests.addFriends(id1, id2).then((value) {}).then((value) {
      Requests.updateUser(User.username, User.password).then((value) {
        setState(() {});
      });
    });
  }

  void onTapped(Contact contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajout d\'amis'),
          content: Text('Voulez-vous ajouter ' +
              contact.firstName +
              " " +
              contact.lastName +
              " en amis ?"),
          actions: <Widget>[
            RaisedButton(
              child: Text(
                "Oui",
              ),
              onPressed: () {
                _addFriend(User.id, contact.id);
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              child: Text(
                "Non",
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Rechercher",
                      hintText: "Rechercher",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listContact.length,
                  itemBuilder: (context, index) {
                    return (GestureDetector(
                      child: listContact[index]
                                      .firstName
                                      .toLowerCase()
                                      .contains(typedText.toLowerCase()) ==
                                  true ||
                              typedText == ''
                          ? ContactListTile(listContact[index])
                          : Container(),
                      onTap: () {
                        onTapped(listContact[index]);
                      },
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
        onRefresh: _updateList);
  }
}
