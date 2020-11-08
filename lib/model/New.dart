class NoticiaBrasil {
  NoticiaBrasil({
    this.id,
    this.titulo,
    this.dataDePublicacao,
    this.link,
    this.fonte,
    this.idFonte,
    this.descricao,
    this.resumo,
  });

  String id;
  String titulo;
  String dataDePublicacao;
  String link;
  String fonte;
  String idFonte;
  String descricao;
  String resumo;

  factory NoticiaBrasil.fromJson(Map<String, dynamic> json) => NoticiaBrasil(
        id: json["id"],
        titulo: json["titulo"],
        dataDePublicacao: json["dataDePublicacao"],
        link: json["link"],
        fonte: json["fonte"],
        idFonte: json["idFonte"],
        descricao: json["descricao"],
        resumo: json["resumo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "dataDePublicacao": dataDePublicacao,
        "link": link,
        "fonte": fonte,
        "idFonte": idFonte,
        "descricao": descricao,
        "resumo": resumo,
      };
}
