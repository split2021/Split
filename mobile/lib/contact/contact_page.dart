import 'package:flutter/material.dart';

import '../requests/requests_class.dart';
import '../contact/contact_class.dart';

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
                return (listContact[index]
                                .username
                                .toLowerCase()
                                .contains(typedText) ==
                            true ||
                        typedText == ''
                    ? Text('${listContact[index].username}')
                    : Container());
              },
            ),
          ),
        ],
      ),
    );
  }
}
