import 'package:flutter/material.dart';
import 'package:app11_animacoes_complexas/ui/login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "11 - Animações complexas",
      home: LoginScreen(),
    );
  }
}
