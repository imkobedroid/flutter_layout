import 'package:flutter/material.dart';

//获取flutter纬度的生命周期
//widgetBindingObserver：是一个widget绑定观察器，通过他可以监听应用的生命周期

class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    //现要给app的生命周期添加一个监听器
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flutter应用的生命周期'), leading: BackButton()),
      body: Text(
        "flutter应用的生命周期",
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );
  }

  //app的生命周期发生变化的时候会回调这个方法
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("state = $state");
    if (state == AppLifecycleState.paused) {
      print("app进入后台");
    } else if (state == AppLifecycleState.resumed) {
      print("app进入前台");
    } else if (state == AppLifecycleState.inactive) {
      //不常用：应用处于非活动状态，并且未接受到用户输入，比如来了个电话
    } else if (state == AppLifecycleState.resumed) {
      //不常用，应用被挂起的时候调用，ios不会触发
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
