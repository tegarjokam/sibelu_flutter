import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final double xWidth;
  final Color color, textColor;

  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color,
    this.textColor,
    this.xWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * xWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
          child: Text(text,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
          color: Color(0xffff5f40),
          onPressed: press,
        ),
      ),
    );
  }
}
