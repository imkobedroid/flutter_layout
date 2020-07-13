import 'package:flutter/material.dart';

class LessGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = new TextStyle(fontSize: 16, color: Colors.blue);

    return MaterialApp(
      title: 'StatelessWidget基础组建',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatelessWidget基础学习",
              style: TextStyle(color: Colors.white)),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text("i am text", style: textStyle),
              Icon(Icons.android, size: 50, color: Colors.blue),
              CloseButton(),
              BackButton(),
              Chip(avatar: Icon(Icons.people), label: Text("我是一个chip")),
              Divider(color: Colors.orange),
              Card(
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "i m card ",
                    style: textStyle,
                  ),
                ),
              ),
              AlertDialog(
                title: Text("提示"),
                content: Text("要下班了"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
