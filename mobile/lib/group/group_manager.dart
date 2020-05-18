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
    setState(() {});
  }

  void _addGroup() {
    setState(() {
      _groups.add(new Group("New group"));
    });
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
