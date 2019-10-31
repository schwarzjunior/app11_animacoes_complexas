import 'package:flutter/material.dart';
import 'package:app11_animacoes_complexas/ui/login/widgets/form_container.dart';
import 'package:app11_animacoes_complexas/ui/login/widgets/sign_up_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Container foi utilizado para colocar uma imagem de background
        // de forma facil.
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        )),
        child: ListView(
          // ListView foi utilizado para poder rolar a tela quando
          // o teclado for aberto.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              // Stack foi utilizado para que a animacao do botao
              // possa cobrir a tela inteira ao se expandir.
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 70, bottom: 32),
                      child: Image.asset(
                        "assets/images/tickicon.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    FormContainer(),
                    SizedBox(height: 140),
                    SignUpButton(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
