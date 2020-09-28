import 'package:flutter/material.dart';
import './navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String _appName = 'Startapp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Montserrat',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/home',
      onGenerateRoute: Navigation.routes,
    );
  }
}
