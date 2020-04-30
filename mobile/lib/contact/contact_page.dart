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

  @override
  void initState() {
    typedText = '';
    super.initState();
  }

  void _updateList() {
    Requests.getContactList().then((value) {
      listContact = value;
    });
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
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                _updateList();
                setState(() {
                  typedText = value;
                });
              },
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Rechercher",
                  hintText: "Rechercher",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listContact.length,
              itemBuilder: (context, index) {
                return (GestureDetector(
                  child: listContact[index]
                                  .username
                                  .toLowerCase()
                                  .contains(typedText) ==
                              true ||
                          typedText == ''
                      ? ContactListTile(listContact[index])
                      : Container(),
                  onTap: () {
                    onTapped(listContact[index].username);
                  },
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
