import 'package:flutter/material.dart';

import 'group_class.dart';
import '../payment/payment.dart';

class Groups extends StatelessWidget {
  final List<Group> groups;
  final Function delGroup;

  Groups(this.groups, this.delGroup);

  void onTapped(int indexTapped, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            RaisedButton(
              child: Text("Paiement", style: TextStyle(color: Colors.white),),
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PaymentPage(groups[indexTapped])));
              },
            ),
            RaisedButton(
              child: Text("Annuler", style: TextStyle(color: Colors.white),),
              color: Colors.red,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
                        RaisedButton(
              child: Text("Supprimer", style: TextStyle(color: Colors.white),),
              color: Colors.red,
              onPressed: () {
                delGroup(indexTapped);
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
        onTapped(index, context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildGroupItem,
      itemCount: groups.length,
    );
  }
}
