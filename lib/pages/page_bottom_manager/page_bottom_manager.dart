import 'package:flutter/material.dart';

import '../download/download_tab.dart';
import '../find/find_page.dart';
import '../home/home_page.dart';
import '../user_profile/user_profile.dart';

class PageBottomManager extends StatefulWidget {
  @override
  _PageBottomManagerState createState() => _PageBottomManagerState();
}

class _PageBottomManagerState extends State<PageBottomManager> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FindPage(),
    DownloadTab(),
    UserProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color.fromRGBO(14, 23, 30, 1);

    return Scaffold(
      // backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
        selectedItemColor: Color.fromRGBO(58, 155, 187, 1),
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(0, 0, 0, 1),
            title: Text(
              "Home",
              style: TextStyle(),
            ),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(0, 0, 0, 1),
            title: Text(
              "find",
              style: TextStyle(),
            ),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(0, 0, 0, 1),
            title: Text(
              "downloads",
              style: TextStyle(),
            ),
            icon: Icon(Icons.file_download),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(0, 0, 0, 1),
            title: Text(
              "My stuff",
              style: TextStyle(),
            ),
            icon: Icon(Icons.person),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
