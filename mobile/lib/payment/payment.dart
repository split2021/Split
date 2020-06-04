import 'package:flutter/material.dart';

import '../group/group_class.dart';

class PaymentPage extends StatefulWidget {
  final Group group;

  PaymentPage(this.group);

  @override
  State<StatefulWidget> createState() {
    return _PaymentPageState();
  }
}

class _PaymentPageState extends State<PaymentPage> {
  Group _group;

  @override
  void initState() {
    _group = widget.group;
    super.initState();
  }

  Widget _buildContactItem(BuildContext context, int index) {
    return ListTile(
      title: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            //Text(_group.contactList[index].firstName[0] + _group.contactList[index].lastName[0]),
            //SizedBox(height: 0, width: 5),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text((_group.contactList[index].firstName) +
                      " " +
                      (_group.contactList[index].lastName)),
                  Flexible(
                    child: Slider(
                      activeColor: Theme.of(context).primaryColor,
                      min: 0.0,
                      max: 100.0,
                      onChanged: (newRating) {
                        setState(
                            () => _group.contactList[index].value = newRating);
                      },
                      value: _group.contactList[index].value,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0, width: 5),
            Container(
              width: 40,
              child: Text(
                  _group.contactList[index].value.toStringAsFixed(0)),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Container(),
      flexibleSpace: Container(
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
      ),
      automaticallyImplyLeading: true,
    );
  }

  void onTapped() {
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Paiement'),
          content: Text("Paiement en cours d'envoi, regardez vos mails !"),
          actions: <Widget>[
            RaisedButton(
              child: Text(
                "Ok",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: _buildContactItem,
                itemCount: _group.contactList.length,
              ),
            ),
            GestureDetector(
              onTap: () {
                onTapped();
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
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
                child: Center(
                  child: Text(
                    "Payer",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
