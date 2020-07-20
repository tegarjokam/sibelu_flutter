import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibelu_app/bloc/login/login_bloc.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: size.height,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        child,
      ]),
    );
  }
}
