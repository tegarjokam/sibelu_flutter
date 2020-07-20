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
              String title = 'Info';
              showDialog(
                context: context,
                builder: (context) {
                  if (Platform.isIOS) {
                    return CupertinoAlertDialog(
                      title: Text(title),
                      content: Text(state.error),
                    );
                  } else {
                    return AlertDialog(
                      title: Text(title),
                      content: Text(state.error),
                    );
                  }
                },
              );
            } else if (state is LoginSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/dashboard_screen', (r) => false);
            }
          },
          child: Body(
              context: context,
              controllerNip: _controllerNip,
              controllerPwd: _controllerPwd)),
    );
  }
}
