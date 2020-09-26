import 'package:flutter/material.dart';
import 'package:ecological_news/scenes/Home.dart';
import 'package:ecological_news/scenes/news_world.dart';

class MainScene extends StatefulWidget {
  MainScene({Key key}) : super(key: key);

  @override
  _MainSceneState createState() => _MainSceneState();
}

class _MainSceneState extends State<MainScene> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScene(),
    NewsWorldScene(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Notícias no mundo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Noticias no Brasil',
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.green[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
