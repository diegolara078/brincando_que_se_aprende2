import 'package:flutter/material.dart';

class ComponentTextDecoration extends StatelessWidget {
  //final Color color;
  final String text;
  final TextEditingController? controller;
  final bool obscure;
  //final InputDecoration inputDecoration;

  ComponentTextDecoration({
    Key? key,
    required this.text,
    this.controller,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Colors.lightBlueAccent,
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            icon: new Icon(Icons.person, color: Color(0xff224597)),
            border: InputBorder.none,
            labelText: text,
          ),
        ),
      ),
    );
  }
}
