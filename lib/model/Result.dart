import 'package:ecological_news/model/News.dart';

class Resultado {
  Resultado({
    this.numeroNoticias,
    this.noticias,
  });

  String numeroNoticias;
  Noticias noticias;

  factory Resultado.fromJson(Map<String, dynamic> json) => Resultado(
        numeroNoticias: json["numeroNoticias"],
        noticias: Noticias.fromJson(json["noticias"]),
      );

  Map<String, dynamic> toJson() => {
        "numeroNoticias": numeroNoticias,
        "noticias": noticias.toJson(),
      };
}
