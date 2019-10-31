import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: const Text(
        "Não possui uma conta? Cadastre-se!",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 12,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
