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

    animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    animation
      ..addStatusListener((status) {
        // Chamado sempre o status da animacao tiver mudado.
        if (status == AnimationStatus.completed) {
          // Valor da animacao chegou ao final.
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // Valor da animacao voltou ao valor inicial.
          controller.forward();
        }
      })
      ..addListener(() {
        print(">>> animation.value: ${animation.value}");
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GrowAndOpacityTransition(
        child: LogoWidget(),
        animation: animation,
      ),
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

class GrowAndOpacityTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final sizeTween = Tween<double>(begin: 0, end: 300);
  final opacityTween = Tween<double>(begin: 0.1, end: 1);

  GrowAndOpacityTransition({Key key, this.child, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: opacityTween.evaluate(animation).clamp(0.0, 1.0),
            child: Container(
              height: sizeTween.evaluate(animation),
              width: sizeTween.evaluate(animation),
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}
