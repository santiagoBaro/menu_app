import 'package:flutter/material.dart';
import 'package:menuapp/pages/explore_page.dart';
import 'package:menuapp/pages/profile_page.dart';
import 'package:menuapp/pages/recomended_page.dart';
import 'package:menuapp/pages/search_page.dart';

class TabbedLandingPage extends StatefulWidget {
  TabbedLandingPage({Key key}) : super(key: key);

  @override
  _TabbedLandingPageState createState() => _TabbedLandingPageState();
}

class _TabbedLandingPageState extends State<TabbedLandingPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    SearchPage(),
    RecomendedPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Recomended'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black38,
        onTap: _onItemTapped,
      ),
    );
  }
}
