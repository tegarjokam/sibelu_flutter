import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibelu_app/bloc/login/login_bloc.dart';
import 'package:sibelu_app/screens/login/components/body.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _controllerNip = TextEditingController();
  final TextEditingController _controllerPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
          listener: (BuildContext context, LoginState state) {
            if (state is LoginFailure) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  duration: Duration(milliseconds: 1500),
                  content: Text(
                    state.error.toString().toUpperCase(),
                  ),
                ),
              );
            } else if (state is LoginSuccess) {
              Navigator.pushNamed(context, '/dashboard_screen');
            }
          },
          child: Body(
              context: context,
              controllerNip: _controllerNip,
              controllerPwd: _controllerPwd)),
    );
  }
}
