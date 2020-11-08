class Noticia {
  Noticia({
    this.titulo,
    this.descricao,
    this.resumo,
    this.fonte,
    this.local,
    this.image,
    this.dataPublicacao,
  });

  String titulo;
  String descricao;
  String resumo;
  String fonte;
  String local;
  String image;
  String dataPublicacao;

  factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
        titulo: json["titulo"],
        descricao: json["descricao"],
        resumo: json["resumo"],
        fonte: json["fonte"],
        local: json["local"],
        image: json["image"],
        dataPublicacao: json["dataPublicacao"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "descricao": descricao,
        "resumo": resumo,
        "fonte": fonte,
        "local": local,
        "image": image,
        "dataPublicacao": dataPublicacao,
      };
}
