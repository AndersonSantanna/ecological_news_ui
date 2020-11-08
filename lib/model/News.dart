import 'package:ecological_news/model/New.dart';

class Noticias {
  Noticias({
    this.noticia,
  });

  List<NoticiaBrasil> noticia;

  factory Noticias.fromJson(Map<String, dynamic> json) => Noticias(
        noticia: List<NoticiaBrasil>.from(
            json["noticia"].map((x) => NoticiaBrasil.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "noticia": List<dynamic>.from(noticia.map((x) => x.toJson())),
      };
}
