import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageStudy2 extends StatefulWidget {
  @override
  _ImageStudy2State createState() => _ImageStudy2State();
}

class _ImageStudy2State extends State<ImageStudy2> {
  String imageUrl = "http://www.devio.org/img/avatar.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("图片缓存"),
        ),
        body: Center(
            child: CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(),
          imageUrl: imageUrl,
        )));
  }
}
