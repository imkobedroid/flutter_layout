import 'package:flutter/material.dart';
import 'package:flutter_app/photo_app_page.dart';
import 'package:flutter_app/statefull_group_page.dart';

import 'FlutterlayoutPage.dart';
import 'TestPhoto.dart';
import 'app_lifecycle.dart';
import 'flutter_widget_lifecycle.dart';
import 'gesture_page.dart';
import 'less_group_page.dart';

void main() => runApp(MyApp());
//void main() => runApp(GesturePage());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroup(),
        'ful': (BuildContext context) => StatefulGroup(),
        'layout': (BuildContext context) => FlutterlayoutPage(),
        'GesturePage': (BuildContext context) => GesturePage(),
        'LifecyclePage': (BuildContext context) => LifecyclePage(),
        'AppLifecycle': (BuildContext context) => AppLifecycle(),
        'TestPhoto': (BuildContext context) => TestPhoto(),
        'PhotoApp': (BuildContext context) => PhotoApp(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("路由跳转"),
        ),
        body: Center(
            child: Column(children: <Widget>[
          SwitchListTile(
              title: Text('${byName ? '' : '不'}通过路由跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item("StatelessWidget基础组建  less", LessGroup(), "less"),
          _item("StatefulWidget基础组建  ful", StatefulGroup(), "ful"),
          _item("StatelessWidget基础组建  layout", FlutterlayoutPage(), "layout"),
          _item("如何检测用户手势以及处理点击事件?  GesturePage", GesturePage(), "GesturePage"),
          _item("flutter的页面生命周期  LifecyclePage", LifecyclePage(),
              "LifecyclePage"),
          _item("flutter的应用生命周期  AppLifecycle", AppLifecycle(), "AppLifecycle"),
          _item("拍照app的测试  TestPhoto", TestPhoto(), "TestPhoto"),
          _item("拍照开发", PhotoApp(), "PhotoApp"),
        ])));
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName); //需要在类中注册页面名字进行跳转
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => page)); //不用注册页面进行跳转
          }
        },
        child: Text(title),
      ),
    );
  }
}
