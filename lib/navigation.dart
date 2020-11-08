import 'package:ecological_news/model/New.dart';
import 'package:ecological_news/model/NewWorld.dart';
import 'package:ecological_news/scenes/news_details_brazil.dart';
import 'package:flutter/material.dart';
import 'package:ecological_news/scenes/main.dart';
import 'package:ecological_news/scenes/bootstrap.dart';
import 'package:ecological_news/scenes/new_details.dart';

class Navigation {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case '/bootstrap':
        return MaterialPageRoute(builder: (_) => BootstrapScene());
      case '/home':
        return MaterialPageRoute(builder: (_) => MainScene());
      case '/news':
        Noticia news = settings.arguments as Noticia;
        return MaterialPageRoute(
            builder: (_) => NewsDetailsScene(
                  news: news,
                ));
      case '/newsBrazil':
        NoticiaBrasil news = settings.arguments as NoticiaBrasil;
        return MaterialPageRoute(
          builder: (_) => NewsDetailsBrazilScene(news: news),
        );
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
