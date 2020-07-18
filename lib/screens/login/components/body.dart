import 'package:flutter/material.dart';
import 'package:sibelu_app/components/rounded_button.dart';
import 'package:sibelu_app/screens/login/components/text_field_cont.dart';

import 'background.dart';
import 'rounded_nip_btn.dart';
import 'rounded_password_btn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/login.png',
            height: size.height * 0.25,
          ),
          Text(
            'LOGIN',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          RoundedNipField(
            icon: Icons.person,
            hintText: 'Your NIP',
            onChanged: (value) {},
          ),
          RoundedPasswordBtn(),
          RoundedButton(
            text: 'Login',
            textColor: Colors.white,
            xWidth: 0.7,
            press: () {},
          )
        ],
      ),
    );
  }
}
