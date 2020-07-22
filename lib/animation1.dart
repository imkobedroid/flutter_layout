import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((status) {
        setState(() {
          animationStatus = status;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              controller.reset();
              controller.forward();
            },
            child: Text(
              "Start",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Text(
            "State" + animationStatus.toString(),
            style: TextStyle(fontSize: 16),
            textDirection: TextDirection.ltr,
          ),
          Text(
            "Value" + animationValue.toString(),
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: animation.value,
            width: animation.value,
            child: FlutterLogo(),
          )
        ],
      ),
    );
  }
}
