import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '11 - Animações complexas',
      home: LogoApp(),
    );
  }
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    animation.addStatusListener((status) {
      // Chamado sempre o status da animacao tiver mudado.
      if (status == AnimationStatus.completed) {
        // Valor da animacao chegou ao final.
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // Valor da animacao voltou ao valor inicial.
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo(Animation<double> animation) : super(listenable: animation);

  Animation<double> get _animation => listenable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: _animation.value,
        width: _animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
