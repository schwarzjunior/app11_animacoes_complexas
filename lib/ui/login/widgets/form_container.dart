import 'package:flutter/material.dart';
import 'package:app11_animacoes_complexas/ui/login/widgets/input_filed.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        // Form foi utilizado para fazer a validacao dos campos
        // (como este eh um app de exemplo de animacoes, nao tera
        // nenhuma validacao).
        child: Column(
          children: <Widget>[
            InputField(
              hint: "Username",
              icon: Icons.person_outline,
            ),
            InputField(
              hint: "Password",
              obscure: true,
              icon: Icons.lock_outline,
            ),
          ],
        ),
      ),
    );
  }
}
