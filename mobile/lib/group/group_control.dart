import 'package:flutter/material.dart';

class GroupControl extends StatelessWidget {
  final Function addGroup;

  GroupControl(this.addGroup);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => {addGroup(context)},
      tooltip: 'Ajouter un groupe',
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(21, 58, 81, 1),
              shape: BoxShape.circle,
            ),
          ),
          Center(
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
