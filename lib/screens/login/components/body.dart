import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibelu_app/bloc/login/login_bloc.dart';
import 'package:sibelu_app/components/rounded_button.dart';
import 'package:sibelu_app/models/login/login_body.dart';
import 'package:sibelu_app/screens/login/components/text_field_cont.dart';

import 'background.dart';
import 'rounded_nip_btn.dart';
import 'rounded_password_btn.dart';

class Body extends StatelessWidget {
  final TextEditingController controllerNip;
  final TextEditingController controllerPwd;
  final BuildContext context;

  Body({this.controllerNip, this.controllerPwd, this.context});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return Background(
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          );
        }
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
                controllerNip: controllerNip,
              ),
              RoundedPasswordBtn(
                controllerPwd: controllerPwd,
              ),
              RoundedButton(
                text: 'Login',
                textColor: Colors.white,
                xWidth: 0.7,
                press: () {
                  String username = controllerNip.text.trim();
                  String password = controllerPwd.text.trim();
                  _loginBloc.add(
                      LoginEvent(LoginBody(username, password, 'password')));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
