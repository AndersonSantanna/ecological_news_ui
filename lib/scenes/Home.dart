import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScene extends StatelessWidget {
  const HomeScene({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30.0),
              height: 320.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CardCustom(),
                  CardCustom(),
                  CardCustom(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardCustom extends StatelessWidget {
  const CardCustom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 320,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage("assets/images/monkey.jpg"),
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
                "Brazil",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 35,
                ),
              ),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: TextStyle(color: Colors.white),
            ),
          ],
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
