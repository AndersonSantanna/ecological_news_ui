import 'dart:convert';

import 'package:ecological_news/model/Result.dart';

BrazilApi brazilApiFromJson(String str) => BrazilApi.fromJson(json.decode(str));

String brazilApiToJson(BrazilApi data) => json.encode(data.toJson());

class BrazilApi {
  BrazilApi({
    this.resultado,
  });

  Resultado resultado;

  factory BrazilApi.fromJson(Map<String, dynamic> json) => BrazilApi(
        resultado: Resultado.fromJson(json["resultado"]),
      );

  Map<String, dynamic> toJson() => {
        "resultado": resultado.toJson(),
      };
}
