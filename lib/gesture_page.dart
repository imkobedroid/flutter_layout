import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printMsg = "";

  double moveX = 0, moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何检测用户手势以及处理点击事件?"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1, //撑满整个屏幕
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _toast("点击"),
                    onPanCancel: () => _toast("点击取消"),
                    onLongPress: () => _toast("长按"),
                    onDoubleTap: () => _toast("双击"),
                    onTapUp: (e) => _toast("松开"),
                    onTapDown: (e) => _toast("按下"),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text(
                        '点我',
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ),
                  ),
                  Text(printMsg),

                ],
              ),
              Positioned(
                  left: moveX,
                  top: moveY,
                  child: GestureDetector(
                    onPanUpdate: (e) => _doMove(e),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(36)),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _toast(String s) {
    setState(() {
      printMsg = '手势是:$s';
    });
  }

  _doMove(DragUpdateDetails details) {
    setState(() {
      moveX += details.delta.dx;
      moveY += details.delta.dy;
    });
  }
}
