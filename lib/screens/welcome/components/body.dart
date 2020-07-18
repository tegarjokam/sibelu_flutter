import 'package:flutter/material.dart';
import 'package:sibelu_app/components/rounded_button.dart';
import 'package:sibelu_app/main.dart';
import 'package:sibelu_app/screens/login/login_screen.dart';
import 'package:sibelu_app/screens/welcome/components/background.dart';
import 'package:sibelu_app/screens/welcome/components/big_title.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Background(),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BigTitle(
                text: 'Sistem',
              ),
              BigTitle(
                text: 'Informasi',
              ),
              Container(
                height: 50,
                width: 160,
                color: Color(0xff0f4c75),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    BigTitle(
                      text: 'Bea Cukai',
                    ),
                  ],
                ),
              ),
              Text(
                'Kanwil Maluku',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RoundedButton(
                color: Color(0xffFF8869),
                text: 'Login',
                textColor: Colors.white,
                xWidth: 1,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
