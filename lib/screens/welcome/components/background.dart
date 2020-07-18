import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      child: Image.asset(
        'assets/images/landing-page-2.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}
