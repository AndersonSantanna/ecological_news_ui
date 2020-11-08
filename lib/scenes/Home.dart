import 'dart:convert';

import 'package:ecological_news/model/NewWorld.dart';
import 'package:ecological_news/model/NewsWorld.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScene extends StatefulWidget {
  const HomeScene({Key key}) : super(key: key);

  @override
  _HomeSceneState createState() => _HomeSceneState();
}

class _HomeSceneState extends State<HomeScene> {
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
        statusBarColor: Colors.green[800],
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    if (newsWorld.noticias != null) {
      return Container(
        width: 500,
        color: Colors.green[800],
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Text(
                "Noticias Ecologicas",
                style: GoogleFonts.caveat(
                  color: Colors.white,
                  textStyle:
                      TextStyle(fontSize: 55, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "- Destaque da Semana",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30.0),
                    height: 320.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CardCustom(
                          news: newsWorld.noticias[3],
                        ),
                        CardCustom(
                          news: newsWorld.noticias[4],
                        ),
                        CardCustom(
                          news: newsWorld.noticias[0],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

class CardCustom extends StatelessWidget {
  CardCustom({Key key, @required this.news}) : super(key: key);

  Noticia news;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/news", arguments: news);
      },
      child: Container(
        width: 300,
        height: 320,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(news.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 7),
                child: Text(
                  news.local,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ),
              Text(
                news.resumo.substring(0, 70),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Noticias Ecologicas",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
    );
  }
}
