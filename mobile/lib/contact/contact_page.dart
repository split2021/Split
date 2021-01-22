import 'package:flutter/material.dart';
import 'package:split/decorations/login_decorations.dart';
import 'package:split/ui/box_shadow.dart';

import '../requests/requests_class.dart';
import 'contact_class.dart';
import 'contact_listtile.dart';
import '../user/user_class.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  bool isLoading = false;

  _updateTypedValue() {
    setState(() {
      typedText = editingController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _updateList();
    typedText = "";
    editingController.addListener(_updateTypedValue);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> _updateList() async {
    isLoading = true;
    Requests.getContactList().then((value) {
      setState(() {
        listContact = value;
        isLoading = false;
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Text(
            'Ajout d\'amis',
            style: dialogTitleTxtStyle,
            textAlign: TextAlign.center,
          ),
          content: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Voulez-vous ajouter ' +
                  contact.firstName +
                  " " +
                  contact.lastName +
                  " en amis ?",
              textAlign: TextAlign.center,
              textWidthBasis: TextWidthBasis.parent,
              style: dialogTxtStyle,
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              onPressed: () async {
                _addFriend(User.id, contact.id);
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Theme.of(context).primaryColor,
              child: Text('Oui', style: dialogBtnTxtStyle),
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Colors.white,
              child: Text('Non', style: dialogBtnNoTxtStyle),
            ),
          ],
        );
      },
    );
  }

  bool isFriendOrMe(Contact contact) {
    for (var myContact in User.friendsIds)
      if (contact.id == myContact || contact.id == User.id) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Container(
          color: Color(0xffF6F6F6),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: editingController,
                  decoration: InputDecoration(
                      hintText: "Rechercher",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              isLoading
                  ? Expanded(
                      child: SpinKitRing(
                        size: 80,
                        color:
                            Color(0xffA2A2A2), //Theme.of(context).primaryColor,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listContact.length,
                        itemBuilder: (context, index) {
                          return (GestureDetector(
                            child: ((listContact[index]
                                                        .firstName
                                                        .toLowerCase() +
                                                    listContact[index]
                                                        .lastName
                                                        .toLowerCase())
                                                .contains(
                                                    typedText.toLowerCase()) ==
                                            true ||
                                        typedText == '') &&
                                    (listContact[index].firstName != "" &&
                                        listContact[index].lastName != "" &&
                                        isFriendOrMe(listContact[index]) ==
                                            false)
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Container(
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            buildBoxShadow(),
                                          ],
                                        ),
                                        child: ContactListTile(
                                            listContact[index], context)),
                                  )
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
