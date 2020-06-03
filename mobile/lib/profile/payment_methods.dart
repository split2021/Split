import 'package:flutter/material.dart';
import './paypal.dart';
import './credit_card.dart';

class PaymentMethods extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaymentMethods();
  }
}

class _PaymentMethods extends State<PaymentMethods> {
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
          ]))),
      automaticallyImplyLeading: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
              child: Column(children: <Widget>[
            Align(
                alignment: FractionalOffset.topCenter,
                child: Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
                    child: Text("Registered methods",
                        style: TextStyle(
                            color: Color.fromRGBO(71, 50, 128, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 24)))),
            new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Paypal()));
                },
                child: new Container(
                    height: 40,
                    margin: const EdgeInsets.all(30.0),
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
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
                      "Add PayPal account",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )))),
            new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreditCard()));
                },
                child: new Container(
                    height: 40,
                    margin: const EdgeInsets.all(30.0),
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
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
                      "Add credit card",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))))
          ]))
        ])));
  }
}
