import 'package:flutter/material.dart';

class TextFieldRounded extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final String errorText;
  final double radius;
  final bool isPassword;
  final void Function(String text) onChanged;
  final TextEditingController controller;

  const TextFieldRounded(
      {Key key,
      this.keyboardType,
      this.hintText,
      this.radius,
      this.isPassword,
      this.controller,
      this.errorText,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onChanged: this.onChanged,
        validator: (input) => input.isEmpty ? "Capture el dato porfavor" : '',
        obscureText: this.isPassword,
        keyboardType: this.keyboardType,
        cursorColor: Colors.green,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green[100]),
              borderRadius: BorderRadius.circular(this.radius),
            ),
            hintText: this.hintText,
            errorText: this.errorText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green[300]),
              borderRadius: BorderRadius.circular(this.radius),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(this.radius))),
      ),
    );
  }
}
