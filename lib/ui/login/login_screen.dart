import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:app11_animacoes_complexas/ui/login/widgets/form_container.dart';
import 'package:app11_animacoes_complexas/ui/login/widgets/sign_up_button.dart';
import 'package:app11_animacoes_complexas/ui/login/widgets/stagger_animation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    // timeDilation eh usado para alterar o tempo das animacoes, visando
    // a sua melhor visusualizacao.
    timeDilation = 4;

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
            // Stack foi utilizado para que a animacao do botao
            // possa cobrir a tela inteira ao se expandir.
            Stack(
              // Alignment.bottomCenter foi utilizado para que o StaggerAnimation fique
              // distanciado do SignUpButton(), conforme o valor do seu Padding.
              alignment: Alignment.bottomCenter,
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
                StaggerAnimation(
                  // _animationController.view passa a animacao, e nao o seu controller.
                  controller: _animationController.view,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
