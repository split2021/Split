import 'package:flutter/material.dart';
import 'package:split/login/login.dart';
import './edit_profile.dart';
import '../user/user_class.dart';
import '../contact/contact_page.dart';
import '../group/group_manager.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {

  void logOut(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
    User.username = null;
    User.email = null;
    User.phoneNumber = null;
    User.firstName = null;
    User.lastName = null;
    User.password = null;
    User.token = null;
    User.id = null;
    User.profilePic = null;
    User.friendsIds.clear();
    User.groupsIds.clear();
    User.contactList.clear();
    User.groupsList.clear();
  }

  Widget buildBackground(Size screenSize) {
    return Container(
      height: screenSize.height / 2.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/profile_bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildProfilePicture() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(User.profilePic),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 5.0,
          ),
        ),
      ),
    );
  }

  Widget buildUsername() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      User.firstName + " " + User.lastName,
      style: _nameTextStyle,
    );
  }

  Widget buildStats() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildStat("Amis", User.contactList.length.toString()), //friends
          buildStat("Groupes", User.groupsIds.length.toString()), //groups
          buildStat("Points", "79"),
        ],
      ),
    );
  }

  Widget buildStat(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget buildButtons(String labelOne, MaterialPageRoute routeOne,
      String labelTwo, MaterialPageRoute routeTwo) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(context, routeOne);
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color.fromRGBO(21, 58, 81, 1),
                ),
                child: Center(
                  child: Text(
                    labelOne,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(context, routeTwo);
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color.fromRGBO(21, 58, 81, 1)),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      labelTwo,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(21, 58, 81, 1)
                        ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLogOutButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(children: <Widget>[
          Expanded(
              child: InkWell(
                  onTap: () {
                    logOut(context);
                  },
                  child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Color.fromRGBO(21, 58, 81, 1),
                      ),
                      child: Center(
                          child: Text("Déconnexion",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ))))))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    if (User.id <= 0)
      return new Container();
    else
      return Scaffold(
        body: Stack(
          children: <Widget>[
            buildBackground(screenSize),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: screenSize.height / 5),
                    buildProfilePicture(),
                    buildUsername(),
                    buildStats(),
                    SizedBox(height: 15.0),
                    buildSeparator(screenSize),
                    SizedBox(height: 15.0),
                    buildButtons(
                        "Ajouter un ami",
                        MaterialPageRoute(builder: (context) => ContactPage()),
                        "Créer un groupe",
                        MaterialPageRoute(builder: (context) => GroupManager())),
                    buildButtons(
                        "Editer le profil",
                        MaterialPageRoute(builder: (context) => EditProfile()),
                        "Editer le titre",
                        MaterialPageRoute(builder: (context) => ContactPage())),
                    SizedBox(height: 12.0),  
                    buildLogOutButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
