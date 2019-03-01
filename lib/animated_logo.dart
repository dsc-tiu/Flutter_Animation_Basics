import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  //TODO: 5.1:Giving Size and Opacity Tween
  final _sizeTween = Tween<double>(begin: 0.0,end: 300.0);
  final _opacityTween = Tween<double>(begin: 0.0,end: 1.0);
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    //TODO: 5.2:Making Opacity Widget
    return Center(
      //TODO: 2.1: Making Animated logo Class and giving Flutter Logo
      child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: FlutterLogo(),
          ),
      )
      );
  }
}