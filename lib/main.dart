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
  Animation<double> animation2;

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

    animation2 = Tween<double>(begin: 0, end: 150).animate(controller);
    animation2.addStatusListener((status) {
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
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GrowTransition(
            child: LogoWidget(),
            animation: animation,
          ),
        ),
        Expanded(
          flex: 1,
          child: GrowTransition(
            child: LogoWidget(),
            animation: animation2,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const GrowTransition({Key key, this.child, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
