import 'package:flutter/material.dart';

class GroupControl extends StatelessWidget {
  final Function addGroup;

  GroupControl(this.addGroup);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => {addGroup()},
      tooltip: 'Ajouter un groupe',
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromRGBO(85, 112, 221, 1.0),
                  Color.fromRGBO(71, 50, 128, 1.0),
                ],
              ),
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
