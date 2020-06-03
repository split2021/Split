import 'package:flutter/material.dart';

import 'group_control.dart';
import 'groups.dart';
import 'group_class.dart';
import '../user/user_class.dart';
import '../requests/requests_class.dart';
import '../contact/contact_class.dart';

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
      _groups = value;
      setState(() {});
    });
  }

  Future<void> _updateList() async {
    _groups = await Requests.getGroups(User.groupsIds);
    await Requests.updateUser(User.username, User.password);
    setState(() {});
  }

  void _showContact() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: User.contactList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CheckboxListTile(
                            title: Text(User.contactList[index].firstName +
                                " " +
                                User.contactList[index].lastName),
                            value: User.contactList[index].checked,
                            subtitle: Text(User.contactList[index].phoneNumber),
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

  void _addGroup() {
    _showContact();
  }

  void _delGroup(int removeIndex) {
    setState(() {
      _groups.removeAt(removeIndex);
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
