import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyFutureBuilder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyFutureBuilder> {
  String showResult = "";

  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder = Utf8Decoder();
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
    return new CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("http"),
        ),
        body: FutureBuilder<CommonModel>(
            future: fetchPost(),
            builder:
                (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text("Input a Url to start");
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return Text(" ");
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}",
                        style: TextStyle(fontSize: 20));
                  } else {
                    return new Column(children: <Widget>[
                      Text('icon:${snapshot.data.icon}'),
                      Text('statusBarColor:${snapshot.data.statusBarColor}'),
                      Text('title:${snapshot.data.title}'),
                      Text('url:${snapshot.data.url}')
                    ]);
                  }
              }
            }),
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
