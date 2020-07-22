import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  @override
  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLogo(
      animation: animation,
    );
  }
}

class AnimationLogo extends AnimatedWidget {
  AnimationLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 100),
      height: animation.value,
      width: animation.value,
      child: FlutterLogo(),
    ));
  }
}
