import 'dart:math';

import 'package:app/my_widgets/my_common_bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';


class AnimatedLogo extends AnimatedWidget {
  Animation colorTween;
  AnimatedLogo({Key? key, required Animation<double> animation, required this.colorTween,})
      : super(key: key, listenable: animation);

  //static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
         
          child: Icon(Icons.favorite, color: colorTween.value, size: _sizeTween.evaluate(animation),),
          ),
        ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}

class LogoApp extends StatefulWidget {
  const LogoApp({Key? key}) : super(key: key);

  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Animation _colorTween;

  @override
  void initState() {
    super.initState();
 
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
 
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
      _colorTween = ColorTween(begin: Colors.yellow, end: Colors.red).animate(controller);

      controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation, colorTween: _colorTween,);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}