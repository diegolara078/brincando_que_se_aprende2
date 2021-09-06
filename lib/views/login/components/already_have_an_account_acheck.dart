import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final GestureTapCallback onPressed;
  const AlreadyHaveAnAccountCheck({
    this.login = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Não tenho cadastro ? " : "Tenho conta ? ",
          style: TextStyle(color: Colors.blue),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            login ? "CADASTRAR" : "LOGIN",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
