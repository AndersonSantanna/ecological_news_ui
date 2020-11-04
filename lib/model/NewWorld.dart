class Noticia {
  Noticia({
    this.titulo,
    this.descricao,
    this.resumo,
    this.fonte,
    this.dataPublicacao,
  });

  String titulo;
  String descricao;
  String resumo;
  String fonte;
  String dataPublicacao;

  factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
        titulo: json["titulo"],
        descricao: json["descricao"],
        resumo: json["resumo"],
        fonte: json["fonte"],
        dataPublicacao: json["dataPublicacao"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "descricao": descricao,
        "resumo": resumo,
        "fonte": fonte,
        "dataPublicacao": dataPublicacao,
      };
}
