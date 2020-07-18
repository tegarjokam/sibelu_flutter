import 'package:flutter/material.dart';

class BigTitle extends StatelessWidget {
  final String text;

  BigTitle({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Color(0xffffd369), fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
