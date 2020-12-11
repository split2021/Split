import 'package:flutter/material.dart';

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
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _updateList();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> _updateList() async {
    setState(() {
      isLoading = true;
    });
    Requests.updateUser(User.username, User.password).then((value) {
      Requests.getGroups(User.groupsIds).then((value) {
        if (value != _groups)
          setState(() {
            _groups = value;
            isLoading = false;
          });
      });
    });
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
                  child: Groups(_groups, _delGroup, _updateList, isLoading)),
            ],
          ),
        ),
      ),
    );
  }
}
