import 'package:flutter/material.dart';

import 'text_field_cont.dart';

class RoundedPasswordBtn extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordBtn({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility),
            hintText: 'Your password',
            border: InputBorder.none),
      ),
    );
  }
}
