import 'package:dio/dio.dart';
import 'package:ecological_news/model/BrazilAPI.dart';
import 'package:ecological_news/widget/MenuCustom.dart';
// import 'package:ecological_news/model/BrazilApi.dart';
// import 'package:ecological_news/model/News.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml2json/xml2json.dart';

class NewsBrazilScene extends StatefulWidget {
  const NewsBrazilScene({Key key}) : super(key: key);
  @override
  _NewsBrazilSceneState createState() => _NewsBrazilSceneState();
}

class _NewsBrazilSceneState extends State<NewsBrazilScene> {
  BrazilApi brazilApi = new BrazilApi();

  void initial() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
    final Xml2Json xml2Json = Xml2Json();
    var dio = Dio();
    Response response = await dio.get(
      'http://noticias.gov.br/noticias-api/noticias/busca?b=meio%20ambiente',
    );
    xml2Json.parse(response.data);
    brazilApi = brazilApiFromJson(xml2Json.toParker());
    print(brazilApi);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.green,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );

    final List<ListItem> items = List<ListItem>.generate(
      brazilApi.resultado.noticias.noticia.length,
      (i) => MessageItem(brazilApi.resultado.noticias.noticia[i].titulo,
          brazilApi.resultado.noticias.noticia[i].resumo),
    );
    if (brazilApi.resultado.noticias.noticia != null) {
      return Container(
        color: Colors.white,
        child: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: brazilApi.resultado.noticias.noticia.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/news");
              },
              child: MenuCustom(
                title: brazilApi.resultado.noticias.noticia[index].titulo,
                resume: brazilApi.resultado.noticias.noticia[index].resumo,
              ),
            );
          },
        ),
        // Text("teste")
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Text(sender);

  Widget buildSubtitle(BuildContext context) => Text(body);
}
