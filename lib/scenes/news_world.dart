import 'dart:convert';

import 'package:ecological_news/model/NewsWorld.dart';
import 'package:ecological_news/widget/MenuCustom.dart';
import 'package:flutter/material.dart';

class NewsWorldScene extends StatefulWidget {
  const NewsWorldScene({Key key}) : super(key: key);

  @override
  _NewsWorldSceneState createState() => _NewsWorldSceneState();
}

class _NewsWorldSceneState extends State<NewsWorldScene> {
  NewsWorld newsWorld = new NewsWorld();

  void loadJson() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json/news.json');
    print(json.decode(data));
    setState(() {
      newsWorld = newsWorldFromJson(data);
    });
    print(newsWorld.noticias.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    if (newsWorld.noticias != null) {
      return Container(
        color: Colors.white,
        child: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: newsWorld.noticias.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            // final item = items[index];

            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  "/news",
                  arguments: newsWorld.noticias[index],
                );
              },
              child: MenuCustom(
                title: newsWorld.noticias[index].titulo.trim(),
                resume: newsWorld.noticias[index].resumo,
              ),
            );
          },
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Text(
        sender,
        style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w600),
      );

  Widget buildSubtitle(BuildContext context) => Text(body);
}
