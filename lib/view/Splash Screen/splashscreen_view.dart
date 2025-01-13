import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instant_pay_u/services/global%20widget/main_logo_widget.dart';
import 'package:instant_pay_u/view/onboarding%20screen/onboardingscreen_view.dart';


class SplashscreenView extends StatefulWidget {
  const SplashscreenView({super.key});

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OnboardingscreenView(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
                    height: 250,
                    width: 300,
                    child: Image.asset("assets/image/instantpaydemo.webp"))),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainLogoWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


