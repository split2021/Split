import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Paypal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Paypal();
  }
}

class _Paypal extends State<Paypal> {
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
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        "/": (_) => new WebviewScaffold(
              url: "https://www.paypal.com/us/signin",
              appBar: _appBar()
            )
      },
    );
  }
}
