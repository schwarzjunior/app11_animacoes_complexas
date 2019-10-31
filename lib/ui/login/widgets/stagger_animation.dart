import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  static const double _squeezeBegin = 320.0;
  static const double _squeezeEnd = 60.0;
  static const double _zoomOutBegin = 60.0;
  static const double _zoomOutEnd = 1000.0;
  static const double _beginSqueezeInterval = 0.0;
  static const double _endSqueezeInterval = 0.150;
  static const double _beginZoomOutInterval = 0.500;
  static const double _endZoomOutInterval = 1.0;

  StaggerAnimation({Key key, @required this.controller})
      : buttonSqueeze = Tween<double>(begin: _squeezeBegin, end: _squeezeEnd).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              _beginSqueezeInterval,
              _endSqueezeInterval,
            ),
          ),
        ),
        buttonZoomOut = Tween<double>(begin: _zoomOutBegin, end: _zoomOutEnd).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              _beginZoomOutInterval,
              _endZoomOutInterval,
              curve: Curves.bounceOut,
            ),
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
        child: buttonZoomOut.value == _zoomOutBegin
            ? Container(
                width: buttonSqueeze.value,
                height: 60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: const Color.fromRGBO(247, 64, 106, 1.0),
                  borderRadius: const BorderRadius.all(const Radius.circular(30)),
                ),
                child: _buildInsideContent(context),
              )
            : Container(
                width: buttonZoomOut.value,
                height: buttonZoomOut.value,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(247, 64, 106, 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(buttonZoomOut.value < _zoomOutEnd / 2 ? 30.0 : 0.0),
                  ),
                  // Alternativa para o borderRadius acima que tem resultado
                  // semelhante (nao igual).
                  /*shape: buttonZoomOut.value < _zoomOutEnd / 2
                      ? BoxShape.circle
                      : BoxShape.rectangle,*/
                ),
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
