import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScene extends StatelessWidget {
  const HomeScene({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.green[800],
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
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
                textStyle: TextStyle(fontSize: 55, fontWeight: FontWeight.w700),
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
                        title: "Poluição ",
                        shortText:
                            "Um quarto das mortes prematuras e das doenças que proliferam atualmente...",
                        imgPath: "assets/images/poluicao.jpg",
                      ),
                      CardCustom(
                        imgPath: "assets/images/gasolina.jpg",
                        title: "Físicos russos",
                        shortText:
                            "A equipe científica da Rússia conseguiu decifrar a composição química do...",
                      ),
                      CardCustom(
                        imgPath: "assets/images/vulcao.jpg",
                        title: "Vulcão na islandia",
                        shortText:
                            "Vulcão islandês Katla entrou em erupção pela última vez em 1918 e...",
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
  }
}

class CardCustom extends StatelessWidget {
  CardCustom({Key key, @required this.imgPath, this.title, this.shortText})
      : super(key: key);

  String imgPath;
  String title;
  String shortText;

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
        Navigator.of(context).pushNamed("/news");
      },
      child: Container(
        width: 300,
        height: 320,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(imgPath),
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
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ),
              Text(
                shortText,
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
