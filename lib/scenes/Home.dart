import 'package:flutter/material.dart';

class HomeScene extends StatelessWidget {
  const HomeScene({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[800],
      // width: ;,
      child: Column(
        children: <Widget>[
          Text(
            "Noticias Ecologicas",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          // Container()
        ],
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
