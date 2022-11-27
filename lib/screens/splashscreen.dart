import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ta/screens/dashboard.dart';
import 'package:ta/screens/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'character/animasi.gif',
      ),
      nextScreen: HomePage(),
      splashTransition: SplashTransition.decoratedBoxTransition,
      backgroundColor: Colors.lightBlue,
      duration: 2000,
    );
  }
}
