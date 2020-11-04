import 'package:flutter/material.dart';

class MenuCustom extends StatelessWidget {
  MenuCustom({Key key, @required this.title, @required this.resume})
      : super(key: key);
  String title;
  String resume;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            resume.substring(0, 120) + "...",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
