import 'package:flutter/material.dart';
import 'package:instant_pay_u/view/Splash%20Screen/splashscreen_view.dart';

void main() {
  runApp(MyMainProj());
}

class MyMainProj extends StatelessWidget {
  const MyMainProj({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashscreenView(),
    );
  }
}
