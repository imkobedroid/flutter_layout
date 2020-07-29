import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HttpApp> {
  String showResult = "";

  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final result = json.decode(response.body);
    return new CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("http"),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  fetchPost().then((CommonModel model) {
                    showResult =
                        '请求结果：hideAppBar：${model.hideAppBar}icon：${model.icon}';
                  });
                });
              },
              child: Text(
                "点我",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(showResult)
          ],
        ),
      ),
    );
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
        icon: json["icon"],
        title: json["title"],
        url: json["url"],
        statusBarColor: json["statusBarColor"],
        hideAppBar: json["hideAppBar"]);
  }
}
