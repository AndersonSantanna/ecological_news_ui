import 'dart:convert';

import 'package:ecological_news/model/NewWorld.dart';
import 'package:ecological_news/model/NewsWorld.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsDetailsScene extends StatefulWidget {
  NewsDetailsScene({Key key, @required this.news}) : super(key: key);
  Noticia news;
  @override
  _NewsDetailsSceneState createState() => _NewsDetailsSceneState();
}

class _NewsDetailsSceneState extends State<NewsDetailsScene> {
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    void goBack() {
      Navigator.pop(context);
    }

    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.26,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.news.image.toString()),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
          color: Colors.green[900],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.22,
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: GestureDetector(
                      onTap: goBack,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    widget.news.local,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
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
                              margin: EdgeInsets.only(bottom: 13),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("fonte: " + widget.news.fonte),
                                  Text(widget.news.dataPublicacao),
                                ],
                              ),
                            ),
                            Text(
                              widget.news.descricao,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   color: Colors.blueAccent,
                  //   height: 160,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
