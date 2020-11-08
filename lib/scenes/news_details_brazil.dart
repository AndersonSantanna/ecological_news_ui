import 'package:ecological_news/model/New.dart';
import 'package:flutter/material.dart';

class NewsDetailsBrazilScene extends StatefulWidget {
  NewsDetailsBrazilScene({Key key, this.news}) : super(key: key);
  NoticiaBrasil news;

  @override
  _NewsDetailsBrazilSceneState createState() => _NewsDetailsBrazilSceneState();
}

class _NewsDetailsBrazilSceneState extends State<NewsDetailsBrazilScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 25),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    widget.news.titulo,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.green[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    child: Text("Fonte: " + widget.news.fonte)),
                Text(
                  widget.news.descricao
                      .replaceAll("\\n\\n\\n\\n", '\n\n')
                      .replaceAll('\\n\\n\\n', '\n\n')
                      .replaceAll('\\n\\n', '\n\n')
                      .replaceAll('\\n', '\n\n')
                      .replaceAll(
                          "<a href=\"https://www.youtube.com/watch?v=wSBFwp9vVgE\">",
                          "")
                      .replaceAll(
                          "<a href=\"https://www.youtube.com/watch?v=_yftuyoQpcQ\">",
                          "")
                      .replaceAll("</a>", ""),
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
