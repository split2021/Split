import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:split/group/groupe_create.dart';
import 'package:split/profile/edit_profile.dart';
import 'package:split/ui/box_shadow.dart';

import '../group/group_manager.dart';
import '../user/user_class.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  Future<Null> _onRefresh() async {
    setState(() {});
    return null;
  }

  _buildContainer(String label, String value) {
    return Expanded(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              buildBoxShadow(),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      "assets/profil_p.png",
      height: 150,
      width: 150,
    );
  }

  Widget _buildName() {
    return Center(
      child: Text(
        User.firstName + " " + User.lastName,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildContainer(User.friendsIds.length > 1 ? "Amis" : "Ami",
              User.friendsIds.length.toString()),
          SizedBox(
            width: 15,
          ),
          _buildContainer(User.friendsIds.length > 1 ? "Groupes" : "Groupe",
              User.groupsIds.length.toString()),
          SizedBox(
            width: 15,
          ),
          _buildContainer("Points", "24"),
        ],
      ),
    );
  }

  Widget _buildCreateGroupBtn() {
    return ButtonTheme(
      height: 50,
      child: RaisedButton(
        color: Colors.white,
        elevation: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateGroupePage(null)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/add_icon.png",
            ),
            SizedBox(
              width: 10,
            ),
            Text("Créer un groupe",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _buildEditProfileBtn() {
    return ButtonTheme(
      height: 50,
      child: RaisedButton(
        color: Colors.white,
        elevation: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditProfile()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/edit_icon.png",
            ),
            SizedBox(
              width: 10,
            ),
            Text("Editer le profil",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _buildLogOutBtn() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          buildBoxShadow(),
        ],
      ),
      child: RaisedButton(
        color: Colors.white,
        elevation: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        onPressed: () {
          Phoenix.rebirth(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.logout,
              color: Color(0xff7D7D7D),
            ),
            SizedBox(
              width: 10,
            ),
            Text("Se déconnecter",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: Container(
          color: Color(0xffF6F6F6),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildImage(),
                _buildName(),
                SizedBox(
                  height: 20,
                ),
                _buildStatsRow(),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [buildBoxShadow()]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildCreateGroupBtn(),
                        SizedBox(
                          height: 2,
                        ),
                        _buildEditProfileBtn(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: _buildLogOutBtn(),
                ),
              ],
            ),
          ),
        ),
        onRefresh: _onRefresh,
      ),
    );
  }
}
