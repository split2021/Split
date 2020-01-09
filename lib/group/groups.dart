import 'package:flutter/material.dart';

import 'group_class.dart';

class Groups extends StatelessWidget {
  final List<Group> groups;

  Groups(this.groups);

  void onTapped(int indexTapped, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromRGBO(85, 112, 221, 1.0),
                  Color.fromRGBO(71, 50, 128, 1.0),
                ],
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: groups[indexTapped].contactList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Container(
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Image.asset(groups[indexTapped]
                            .contactList[index]
                            .profilPicture),
                        SizedBox(height: 0, width: 5),
                        Text((groups[indexTapped]
                                .contactList[index]
                                .firstName) +
                            " " +
                            (groups[indexTapped].contactList[index].lastName)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          contentPadding: EdgeInsets.all(0.0),
          actions: <Widget>[
            RaisedButton(
              child: Text('Paiement'),
              textColor: Colors.white,
              color: Colors.lightGreen,
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Annuler'),
              textColor: Colors.white,
              color: Colors.red,
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
