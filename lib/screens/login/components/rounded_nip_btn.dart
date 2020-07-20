import 'package:flutter/material.dart';

import 'text_field_cont.dart';

class RoundedNipField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controllerNip;

  const RoundedNipField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.controllerNip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        controller: controllerNip,
        decoration: InputDecoration(
            icon: Icon(icon), hintText: hintText, border: InputBorder.none),
      ),
    );
  }
}
