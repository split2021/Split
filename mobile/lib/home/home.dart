import 'package:flutter/material.dart';
import 'package:split/decorations/home_decorations.dart';

import '../contact/contact_page.dart';
import '../group/group_manager.dart';
import '../profile/profile_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  int _currBtmNavIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget _buildBottomAppBar() {
    return BottomNavigationBar(
        currentIndex:
            _currBtmNavIndex, // Use this to update the Bar giving a position
        onTap: (index) {
          setState(() {
            _currBtmNavIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color(0xffA2A2A2),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: labelTxtStyle,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Groupes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Rechercher"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile"),
        ]);
  }

  void _pageChanged(int index) {
    setState(() {
      _currBtmNavIndex = index;
    });
  }

  Widget _buildPageView() {
    return Container(
      margin: MediaQuery.of(context).padding,
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: (index) {
          _pageChanged(index);
        },
        children: <Widget>[
          GroupManager(),
          ContactPage(),
          ProfilePage(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: _buildBottomAppBar(),
      body: _buildPageView(),
    );
  }
}
