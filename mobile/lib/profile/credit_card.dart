import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreditCard();
  }
}

class _CreditCard extends State<CreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

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

  void onChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  onCreditCardModelChange: onChange,
                ),
              ),
            ),
            new GestureDetector(
                onTap: () {
                  // Requests.addUserCreditCard();
                Navigator.pop(context);
                },
                child: new Container(
                    height: 40,
                    margin: const EdgeInsets.all(30.0),
                    width: MediaQuery.of(context).size.width / 2,
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
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))))
          ],
        ),
      ),
    );
  }
}
