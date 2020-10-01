import 'package:flutter/material.dart';
import 'dart:async';
import 'logo_app.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Container(child: LogoApp(),))));
    animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: FadeTransition(
              opacity: animation,
              child: Center(
                child: Text("Flutter Animation",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )
              ))),
    );
  }
}
