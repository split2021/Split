import 'package:flutter/material.dart';

import 'group_control.dart';
import 'groups.dart';
import 'group_class.dart';

class GroupManager extends StatefulWidget {
  final Group startingGroup = Group();

  @override
  State<StatefulWidget> createState() {
    return _GroupManagerState();
  }
}

class _GroupManagerState extends State<GroupManager> {
  final List<Group> _groups = [];

  @override
  void initState() {
    _groups.add(widget.startingGroup);
    super.initState();
  }

  void _addGroup() {
    setState(() {
      _groups.add(new Group());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Groups(_groups),
          )
        ],
      ),
      floatingActionButton: GroupControl(_addGroup),
    );
  }
}
