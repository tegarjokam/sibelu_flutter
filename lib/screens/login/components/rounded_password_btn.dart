import 'package:flutter/material.dart';

import 'text_field_cont.dart';

class RoundedPasswordBtn extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controllerPwd;

  const RoundedPasswordBtn({
    Key key,
    this.onChanged,
    this.controllerPwd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: false,
        onChanged: onChanged,
        controller: controllerPwd,
        decoration: InputDecoration(
            icon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility_off),
            hintText: 'Your password',
            border: InputBorder.none),
      ),
    );
  }
}
