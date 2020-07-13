import 'package:flutter/material.dart';
import 'package:flutter_app/opp_learn.dart';

//常用数据类型
class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _stringType();
    _numType();
    _listType();
    _booleanType();
    _mapType();
    _tip();
    _oopLearn();
    return Container(
      child: Text('常用数据类型，请看输出'),
    );
  }

  void _numType() {
    num num1 = -1.0;
    num num2 = -2.0;

    int int1 = 1;
    double double1 = 1.1;

    print("num1:$num1 num2:$num2 int1:$int1 double1:$double1");
    print(num1.abs());
    print(num2.toInt());
    print(num2.toDouble());
  }

  void _stringType() {
    String str1 = "kobe", str2 = "dong";
    print("$str1   $str2");
  }

  void _booleanType() {
    bool b1 = true, b2 = false;
    print(b1);
  }

  void _listType() {
    List list = [1, 2, 3, 4, "kobe"];
    print(list);
    List<int> list1 = [];
//    list1=list;  //这里会报错，因为动态数据类型不能赋值给静态数据类型

    List list2 = [];
    list2.add("kobe");
    list2.addAll(list);
    print(list2);

    List list4 = List.generate(3, (index) => index * 2);
    print(list4);

    //集合的遍历
    for (int a = 0; a < list.length; a++) {
      print(list[a]);
    }

    for (var o in list) {
      print(o);
    }

    list.forEach((val) {
      print(val);
    });
  }

  _mapType() {
    Map map = {'kobe': 1, "dong": 2};

    Map map1 = {};
    map["kobe"] = 40;
    print(map1["kobe"]);

    //map遍历
    map.forEach((key, value) {
      print('key:$key   value:$value');
    });

    Map map3 = map.map((k, v) {
      return MapEntry(v, k);
    });
    map3.forEach((key, value) {
      print('key:$key   value:$value');
    });

    for (var key in map.keys) {
      print("$key: ${map[key]}");
    }
  }

  //科普小知识,   dynamic var object三者之间的区别
  void _tip() {
    //动态数据类型，编译器自己判断是什么类型，可以给变量定义任何类型
    dynamic x = "kobe";
    print(x.runtimeType); //编译器推测是什么类型
    print(x);
    x = 123;
    print(x.runtimeType); //编译器推测是什么类型
    print(x);

    //var不关心是什么类型，系统自己推测， 与dynamic不同的是一旦被定义 就不能被改变类型
    var a = "kobe";
    print(a.runtimeType);
    print(a);

    a = 'dong';
    print(a.runtimeType);
    print(a);

    //object是dart类型的基类  定义的时候认定为对象处理的，与前面两个不同的是静态类型检查会出错 ，因为数据类型是确切的，所以不能调用除开自身提供的其他以外的方法
    Object o1 = "kobe";
    print(o1.runtimeType);
    print(o1);
  }

  void _oopLearn() {

    Kobe dong=Kobe("19", "dong", "china", "it");
    Kobe kobe=Kobe.cover(dong);
    Kobe kobe1=Kobe.stu(dong);
    Kobe kobe2=Kobe.create("dong", "20");
    Kobe kobe3=Kobe.stuInfo("20", "kobe", "china", "_info");
  }
}
