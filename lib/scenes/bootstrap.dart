import 'package:flutter/material.dart';

class BootstrapScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.red,
      ),
    );
  }
}
