import 'package:flutter/material.dart';

import 'group_control.dart';
import 'groups.dart';
import 'group_class.dart';
import '../user/user_class.dart';
import '../requests/requests_class.dart';

class GroupManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GroupManagerState();
  }
}

class _GroupManagerState extends State<GroupManager> {
  List<Group> _groups = [];
  TextEditingController editingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    Requests.getGroups(User.groupsIds).then((value) {
      setState(() {
        _groups = value;
      });
    });
  }

  Future<void> _updateList() async {
    Requests.updateUser(User.username, User.password).then((value) {
      setState(() {
        Requests.getGroups(User.groupsIds).then((value) {
          setState(() {
            _groups = value;
          });
        });
      });
    });
  }

  void _showContact(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 60.0),
          child: AlertDialog(
            title: Text("Choisissez les membres du groupe"),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  children: [
                    TextField(
                      controller: editingController,
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: User.contactList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CheckboxListTile(
                              title: Text(User.contactList[index].firstName +
                                  " " +
                                  User.contactList[index].lastName),
                              value: User.contactList[index].checked,
                              subtitle:
                                  Text(User.contactList[index].phoneNumber),
                              onChanged: (bool newValue) {
                                setState(() {
                                  User.contactList[index].checked = newValue;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  "Créer",
                ),
                onPressed: () {
                  Requests.createGroup(editingController.text);
                  _updateList();
                  Navigator.pop(context);
                },
              ),
              RaisedButton(
                child: Text(
                  "Annuler",
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _addGroup(BuildContext context) {
    _showContact(context);
  }

  void _delGroup(int removeIndex) {
    Requests.deleteGroupById(_groups[removeIndex].id).then((value) {
      _updateList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                  child: Groups(
                _groups,
                _delGroup,
                _updateList,
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: GroupControl(_addGroup),
    );
  }
}
