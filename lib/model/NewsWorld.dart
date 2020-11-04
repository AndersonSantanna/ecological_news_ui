import 'dart:convert';

import 'package:ecological_news/model/NewWorld.dart';

NewsWorld newsWorldFromJson(String str) => NewsWorld.fromJson(json.decode(str));

String newsWorldToJson(NewsWorld data) => json.encode(data.toJson());

class NewsWorld {
  NewsWorld({
    this.noticias,
  });

  List<Noticia> noticias;

  factory NewsWorld.fromJson(Map<String, dynamic> json) => NewsWorld(
        noticias: List<Noticia>.from(
            json["noticias"].map((x) => Noticia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "noticias": List<dynamic>.from(noticias.map((x) => x.toJson())),
      };
}
