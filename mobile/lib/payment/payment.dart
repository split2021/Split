import 'package:flutter/material.dart';
import 'package:split/decorations/login_decorations.dart';
import 'package:split/requests/requests_class.dart';
import 'package:split/ui/box_shadow.dart';
import 'package:split/utils/show_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final List<bool> checkBoxs = new List<bool>();
  String redirectLink;

  @override
  void initState() {
    super.initState();
    _group = widget.group;
    checkBoxs.add(false);
    checkBoxs.add(false);
    checkBoxs.add(false);
    checkBoxs.add(false);
    checkBoxs.add(false);
    checkBoxs.add(false);
    checkBoxs.add(false);
    checkBoxs.add(false);
  }

  void _launchURL() async {
    if (await canLaunch(redirectLink)) {
      await launch(redirectLink);
    } else {
      throw 'Could not launch $redirectLink';
    }
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text("Que souhaitez vous payer ?",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          )),
    );
  }

  double _buildTotalPrice() {
    double totalPrice = 0;
    if (checkBoxs[0] == true) totalPrice += 8.5;
    if (checkBoxs[1] == true) totalPrice += 12.5;
    if (checkBoxs[2] == true) totalPrice += 4.5;
    if (checkBoxs[3] == true) totalPrice += 15.5;
    if (checkBoxs[4] == true) totalPrice += 9.95;
    if (checkBoxs[5] == true) totalPrice += 2.5;
    if (checkBoxs[6] == true) totalPrice += 9.0;
    if (checkBoxs[7] == true) totalPrice += 2.5;
    return totalPrice;
  }

  Widget _buildPaymentBtn() {
    return Container(
      width: double.infinity,
      height: 85,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
          ),
        ],
      ),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Requests.postPayment(_buildTotalPrice(), _group.id).then((value) {
            redirectLink = value;
            if (redirectLink != null) {
              Navigator.pop(context);
              _launchURL();
            } else {
              Navigator.pop(context);
              buildShowDialog(context, "Paiement",
                  "Le paiement a échoué veuillez réessayer");
            }
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Theme.of(context).primaryColor,
        child: Text(
            _buildTotalPrice() > 0.0
                ? "Payer " + _buildTotalPrice().toString() + " €"
                : "Payer",
            style: logInBtnTextStyle),
      ),
    );
  }

  Widget _buildItems(String name, double price, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: GestureDetector(
        child: Container(
            height: 70,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: [
                buildBoxShadow(),
              ],
            ),
            child: Row(
              children: [
                Checkbox(
                  onChanged: (value) {
                    setState(() {
                      checkBoxs[index] = value;
                    });
                  },
                  value: checkBoxs[index],
                ),
                Text(name, style: logInFrgtPsswrdStyle),
                Expanded(
                  child: Container(),
                ),
                Text(
                  price.toStringAsPrecision(3) + " €",
                  style: priceTxtStyle,
                )
              ],
            )),
        onTap: () {
          setState(() {
            checkBoxs[index] = !checkBoxs[index];
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffF5F5F5),
        margin: MediaQuery.of(context).padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            _buildTitle(),
            Expanded(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildItems("Smash burger", 8.5, 0),
                    _buildItems("Spaghetti bolognaise", 12.5, 1),
                    _buildItems("Frites", 4.5, 2),
                    _buildItems("Pizza margherita", 15.5, 3),
                    _buildItems("Salade caesar", 9.95, 4),
                    _buildItems("Coca-cola Zéro", 2.5, 5),
                    _buildItems("Veggie burger", 9, 6),
                    _buildItems("Fanta", 2.5, 7),
                  ],
                ),
              ),
            ),
            _buildPaymentBtn(),
          ],
        ),
      ),
    );
  }
}
