import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  List<File> _image = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试相册选择"),
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _getImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _itemClick();
        },
        tooltip: "图片选择",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  void _itemClick() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => Container(
              height: 160,
              child: Column(
                children: <Widget>[_item("拍照", true), _item("从相册选择", false)],
              ),
            ));
  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        title: Text(title),
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
      ),
      onTap: () {
        _getImage(isTakePhoto);
      },
    );
  }

  void _getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    ImagePicker _picker = new ImagePicker();
    var pickedFile = await _picker.getImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile.path));
    });
  }

  _getImages() {
    return _image.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              file,
              width: 120,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _image.remove(file);
                });
              },
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }).toList();
  }
}
