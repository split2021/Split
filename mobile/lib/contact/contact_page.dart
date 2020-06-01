import 'package:flutter/material.dart';

import '../requests/requests_class.dart';
import 'contact_class.dart';
import 'contact_listtile.dart';

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
    typedText = editingController.text;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Requests.getContactList().then((value) {
      listContact = value;
      typedText = "";
      setState(() {});
    });

    editingController.addListener(_updateTypedValue);
  }

  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  Future<void> _updateList() async {
    Requests.getContactList().then((value) {
      listContact = value;
    });
    setState(() {});
  }

  void onTapped(String username) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajout d\'amis'),
          content: Text('Voulez-vous ajouter ' + username + " en amis ?"),
          actions: <Widget>[
            RaisedButton(
              child: Text(
                "Oui",
              ),
              onPressed: () {
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
                              listContact[index]
                                      .lastName
                                      .toLowerCase()
                                      .contains(typedText.toLowerCase()) ==
                                  true ||
                              typedText == ''
                          ? ContactListTile(listContact[index])
                          : Container(),
                      onTap: () {
                        onTapped(listContact[index].firstName + " " + listContact[index].lastName);
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
