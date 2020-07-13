import 'package:flutter/material.dart';

class LifecyclePage extends StatefulWidget {
  //新创建一个StatefulWidget时候第一个调用的是createState方法  而且必须重写
  @override
  _LifecyclePageState createState() => _LifecyclePageState();
}

class _LifecyclePageState extends State<LifecyclePage> {
  int _count = 0;

  //这是创建widget时期调用的除构造方法以外的第一个方法
  //类似于Android中的onCreate方法
  //一般在这个方法里面做一些初始化的方法，例如channel的初始化以及一些监听器的初始化方法
  @override
  void initState() {
    print('----initState---');
    super.initState();
  }

  //更新时期的方法
  //所依赖的State对象改变的时候会调用
  //在第一个构建一个widget组建的时候调用initState方法后立即调用此方法
  //
  @override
  void didChangeDependencies() {
    print('----didChangeDependencies---');
    super.didChangeDependencies();
  }

  //这是一个必须实现的方法,这里实现你要呈现的内容
  //他在didChangeDependencies后立即调用
  //另外在setState后也会立即调用此方法

  @override
  Widget build(BuildContext context) {
    print('----build---');
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter的页面生命周期'),
//        leading: GestureDetector(
//          onTap: () {
//            Navigator.pop(context);
//          },
//          child: Icon(Icons.arrow_back),
//        ),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text(
                "点我",
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
            ),
            Text(_count.toString())
          ],
        ),
      ),
    );
  }

  //该方法不是一个常用的方法，当父组件需要重新绘制的时候调用
  //该方法携带一个oldWidget参数可以与原来的widget组件进行对比，进行一些逻辑操作
  //if(oldWidget.xxx != widget.xxx){...}

  @override
  void didUpdateWidget(LifecyclePage oldWidget) {
//    if(widget.key!=oldWidget.key){
//      print('---key变了---');
//    }

    print('---didUpdateWidget---');
    super.didUpdateWidget(oldWidget);
  }

  //销毁的时候调用的方法   在组件被移除的时候调用，在dispose之前调用
  @override
  void deactivate() {
    print('---deactivate---');
    super.deactivate();
  }

  //常用方法， 在组件被销毁的时候调用
  @override
  void dispose() {
    print('---dispose---');
    super.dispose();
  }
}
