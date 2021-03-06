import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomButtonWidget({Key key, this.onPressed, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        onPressed: onPressed,
        padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
        color: Colors.blue,
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 0.6),
        ),
      ),
    );
  }
}
