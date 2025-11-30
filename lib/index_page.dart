import 'package:flutter/material.dart';
import 'package:tasks/account_page.dart';
import 'package:tasks/home_page.dart';
import 'package:tasks/search_page.dart';
import 'package:tasks/setting_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _bottomNavbar = 0;
  List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    SettingPage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _gettitle(_bottomNavbar),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 34, 59, 102),
      ),
      body: IndexedStack(index: _bottomNavbar, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 34, 59, 102),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _bottomNavbar,
        onTap: (index) {
          setState(() {
            _bottomNavbar = index;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
      ),
    );
  }

  String _gettitle(int index) {
    switch (index) {
      case 0:
        return 'HomePage';
      case 1:
        return 'SearchPage';
      case 2:
        return 'SettingPage';
      case 3:
        return 'AccountPage';
      default:
        return 'data';
    }
  }
}
