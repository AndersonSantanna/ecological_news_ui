import 'package:ecological_news/scenes/news_brazil.dart';
import 'package:flutter/material.dart';
import 'package:ecological_news/scenes/Home.dart';
import 'package:ecological_news/scenes/news_world.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MainScene extends StatefulWidget {
  MainScene({Key key}) : super(key: key);

  @override
  _MainSceneState createState() => _MainSceneState();
}

class _MainSceneState extends State<MainScene> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScene(),
    NewsBrazilScene(),
    NewsWorldScene(),
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
            icon: Icon(FontAwesome.newspaper_o),
            label: 'Notícias Brasil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Fontisto.earth),
            label: 'Noticias no mundo',
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
