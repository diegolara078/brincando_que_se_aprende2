import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  //late Color colorOn;
  final Color? color;
  final String text;

  CustomButton(
      { //required this.colorOn,
      this.color,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color ?? Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.green),
        ),
      ),
      //onPressed: () => onPressed,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
