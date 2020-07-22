import 'package:flutter/material.dart';

class HeroApp extends StatelessWidget {
  final String photo;
  final VoidCallback callback;
  final double width;

  HeroApp({Key key, this.photo, this.callback, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
          tag: photo,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: callback,
              child: Image.network(
                photo,
                fit: BoxFit.contain,
              ),
            ),
          )),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  final String image = "http://www.devio.org/img/avatar.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("简单的hero动画"),
      ),
      body: Center(
        child: HeroApp(
          photo: image,
          width: 300,
          callback: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: Text("第二个页面"),
                          ),
                          body: Container(
                            color: Colors.lightBlue,
                            padding: EdgeInsets.all(16),
                            alignment: Alignment.topLeft,
                            child: HeroApp(
                              photo: image,
                              width: 100,
                              callback: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        )));
          },
        ),
      ),
    );
  }
}
