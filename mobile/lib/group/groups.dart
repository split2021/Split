import 'package:flutter/material.dart';
import 'package:split/decorations/home_decorations.dart';
import 'package:split/decorations/login_decorations.dart';
import 'package:split/group/groupe_create.dart';
import 'package:split/ui/box_shadow.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../payment/payment.dart';
import 'group_class.dart';

class Groups extends StatelessWidget {
  final List<Group> groups;
  final Function delGroup;
  final Function updateList;
  final bool isLoading;

  Groups(this.groups, this.delGroup, this.updateList, this.isLoading);

  void onLongPressed(int indexTapped, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Text(
            'Supprimer un groupe',
            style: dialogTitleTxtStyle,
            textAlign: TextAlign.center,
          ),
          content: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Voulez-vous supprimer le groupe ' +
                  groups[indexTapped].name +
                  " ?",
              textAlign: TextAlign.center,
              textWidthBasis: TextWidthBasis.parent,
              style: dialogTxtStyle,
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              onPressed: () async {
                delGroup(indexTapped);
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Theme.of(context).primaryColor,
              child: Text('Oui', style: dialogBtnTxtStyle),
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Colors.white,
              child: Text('Non', style: dialogBtnNoTxtStyle),
            ),
          ],
        );
      },
    );
  }

  String _buildNameList(Group group) {
    String namesList = "";
    for (var user in group.contactList) {
      namesList += user.firstName + " " + user.lastName;
      if (user != group.contactList.last) namesList += ", ";
    }
    return namesList;
  }

  Widget _buildGroupItem(BuildContext context, int index) {
    return GestureDetector(
      child: Padding(
        padding: index % 2 == 0
            ? EdgeInsets.only(left: 16, bottom: 16, right: 8)
            : EdgeInsets.only(right: 16, left: 8, bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              buildBoxShadow(),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8.0),
              //   child: backgroundImage("assets/food_4k_2.jpg"),
              // ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      groups[index].name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      groups.length.toString() +
                          (groups.length > 1 ? " membres" : " membre"),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      _buildNameList(groups[index]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
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

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text("Mes groupes", style: titleTxtStyle),
    );
  }

  Widget _buildAddgrpContainer(int index, BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: index % 2 == 0
            ? EdgeInsets.only(left: 16, bottom: 16, right: 8)
            : EdgeInsets.only(right: 16, left: 8, bottom: 16),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Color(0xffA2A2A2),
              width: 2.0,
            ),
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/add_icon.png"),
              SizedBox(
                height: 5,
              ),
              Text(
                "Ajouter un groupe",
                style: TextStyle(
                    color: Color(0xffA2A2A2),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateGroupePage(updateList)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF6F6F6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          _buildTitle(),
          isLoading
              ? Expanded(
                  child: SpinKitRing(
                    size: 80,
                    color: Color(0xffA2A2A2),
                  ),
                )
              : Expanded(
                  child: RefreshIndicator(
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(
                          groups.length + 1,
                          (index) {
                            return index + 1 > groups.length
                                ? _buildAddgrpContainer(index, context)
                                : _buildGroupItem(context, index);
                          },
                        ),
                        childAspectRatio: 1 / 1,
                      ),
                      onRefresh: updateList),
                ),
        ],
      ),
    );
  }
}
