import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactPageState();
  }
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems = List<String>.generate(100, (i) => "Item $i");
  var items = List<String>();
  String typedText;

  @override
  void initState() {
    items.addAll(duplicateItems);
    typedText = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                typedText = value;
              },
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Rechercher",
                  hintText: "Rechercher",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return (items[index].toLowerCase().contains(typedText) == true ||
                        typedText == ''
                    ? Text('${items[index]}')
                    : Container());
              },
            ),
          ),
        ],
      ),
    );
  }
}
