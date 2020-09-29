import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCircular extends StatefulWidget {
  final double radius;
  final double fontSize;
  final double height;
  final double width;
  final Widget text;
  final VoidCallback onTap;
  final Color colorDecoration;
  final Color color;
  final IconData icon;

  ButtonCircular(
      {Key key,
      this.radius,
      this.text,
      @required this.onTap,
      this.fontSize,
      this.height,
      this.width,
      this.color,
      this.colorDecoration,
      this.icon})
      : super(key: key);

  @override
  _ButtonCircularState createState() => _ButtonCircularState();
}

class _ButtonCircularState extends State<ButtonCircular> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minWidth: MediaQuery.of(context).size.width * 0.3,
      height: 50,
      child: RaisedButton(
          elevation: 10,
          color: widget.colorDecoration,
          onPressed: widget.onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[widget.text],
          )),
    );
  }
}
