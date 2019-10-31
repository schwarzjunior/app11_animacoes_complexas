import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> buttonSqueeze;

  StaggerAnimation({Key key, @required this.controller})
      : buttonSqueeze = Tween<double>(begin: 320.0, end: 60.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.150),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: InkWell(
        onTap: () {
          // Inicia a animacao do botao.
          controller.forward();
        },
        child: Container(
          width: buttonSqueeze.value,
          height: 60,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: const Color.fromRGBO(247, 64, 106, 1.0),
            borderRadius: const BorderRadius.all(const Radius.circular(30)),
          ),
          child: _buildInsideContent(context),
        ),
      ),
    );
  }

  Widget _buildInsideContent(BuildContext context) {
    if (buttonSqueeze.value > 75) {
      // O Text dentro do botao ainda cabe.
      return const Text(
        "Sign in",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      );
    } else {
      // Trocando o Text dentro do botao pelo CircularProgressIndicator.
      return const CircularProgressIndicator(
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.5,
      );
    }
  }
}
