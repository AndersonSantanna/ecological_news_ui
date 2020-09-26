import 'package:ecological_news/scenes/bootstrap.dart';
import 'package:ecological_news/scenes/main.dart';
import 'package:flutter/material.dart';

class Navigation {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case '/bootstrap':
        return MaterialPageRoute(builder: (_) => BootstrapScene());
      case '/home':
        return MaterialPageRoute(builder: (_) => MainScene());
      // case '/news':
      //   return MaterialPageRoute(builder: (_) => PersonDataScene());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('E aí, tá perdido?!'),
        ),
      );
    });
  }
}
