import 'package:flutter/material.dart';

import 'group_class.dart';
import '../payment/payment.dart';

class Groups extends StatelessWidget {
  final List<Group> groups;
  final Function delGroup;
  final Function updateList;

  Groups(this.groups, this.delGroup, this.updateList);

  void onLongPressed(int indexTapped, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Supprimer le groupe'),
          content: Text('Voulez-vous supprimer le groupe ?'),
          actions: <Widget>[
            RaisedButton(
              child: Text(
                "Oui",
              ),
              onPressed: () {
                delGroup(indexTapped);
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

  Widget _buildGroupItem(BuildContext context, int index) {
    return ListTile(
      title: Card(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(groups[index].image),
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              )),
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Center(
                child: Text(
                  groups[index].name,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaymentPage(groups[index])));
      },
      onLongPress: () {
        onLongPressed(index, context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(
          itemBuilder: _buildGroupItem,
          itemCount: groups.length,
        ),
        onRefresh: updateList);
  }
}
