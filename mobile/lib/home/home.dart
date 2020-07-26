import 'package:flutter/material.dart';

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
  final PageController _pageController = PageController();
  int _currPageIndex = 0;

  _setIconColor(int curPageIndex) {
    setState(() {
      _currPageIndex = curPageIndex;
    });
  }

  Widget _appBar() {
    return AppBar(
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              color: _currPageIndex == 0 ? Colors.white : Colors.grey,
              icon: Icon(Icons.group),
              onPressed: () {
                _pageController.jumpToPage(0);
              },
            ),
            IconButton(
              color: _currPageIndex == 1 ? Colors.white : Colors.grey,
              icon: Icon(Icons.contact_phone),
              onPressed: () {
                _pageController.jumpToPage(1);
              },
            ),
            IconButton(
              color: _currPageIndex == 2 ? Colors.white : Colors.grey,
              icon: Icon(Icons.account_circle),
              onPressed: () {
                _pageController.jumpToPage(2);
              },
            ),
          ],
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(21, 58, 90, 1),
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }

  Widget _pageView() {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: <Widget>[
        GroupManager(),
        ContactPage(),
        ProfilePage(),
      ],
      onPageChanged: (i) {
        _setIconColor(i);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _pageView(),
    );
  }
}
