import 'package:ecological_news/model/New.dart';

class Noticias {
  Noticias({
    this.noticia,
  });

  List<Noticia> noticia;

  factory Noticias.fromJson(Map<String, dynamic> json) => Noticias(
        noticia:
            List<Noticia>.from(json["noticia"].map((x) => Noticia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "noticia": List<dynamic>.from(noticia.map((x) => x.toJson())),
      };
}
