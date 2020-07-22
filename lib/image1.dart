import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageStudy1 extends StatefulWidget {
  @override
  _ImageStudy1State createState() => _ImageStudy1State();
}

class _ImageStudy1State extends State<ImageStudy1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("图片从透明变为显示完成"),
        ),
        body: Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'http://www.devio.org/img/avatar.png',
          ),
        ));
  }
}
