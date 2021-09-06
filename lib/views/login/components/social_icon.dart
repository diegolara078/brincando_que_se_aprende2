import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SocalIcon extends StatelessWidget {
  final GestureTapCallback onPressed;
  final Color? color;

  SocalIcon({
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: color ?? Colors.black,
          ),
          shape: BoxShape.circle,
        ),
        // child: SvgPicture.asset(
        //   iconSrc,
        //   height: 20,
        //   width: 20,
        // ),
      ),
    );
  }
}
