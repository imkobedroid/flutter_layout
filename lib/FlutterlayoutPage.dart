import 'package:flutter/material.dart';

class FlutterlayoutPage extends StatefulWidget {
  @override
  _FlutterlayoutPageState createState() => _FlutterlayoutPageState();
}

class _FlutterlayoutPageState extends State<FlutterlayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = new TextStyle(fontSize: 16, color: Colors.blue);

    return MaterialApp(
      title: '如何进行flutter布局',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Text("如何进行flutter布局", style: TextStyle(color: Colors.white)),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            )),
        floatingActionButton: FloatingActionButton(
          child: Text("点我"),
          onPressed: () {},
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                title: Text("首页")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.blue,
                ),
                title: Text("列表"))
          ],
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                      'http://www.devio.org/img/avatar.png'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRect(
                                  child: Opacity(
                                    opacity: 0.6, //透明度60%
                                    child: Image.network(
                                      "http://www.devio.org/img/avatar.png",
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text("i am text", style: textStyle),
                          Icon(Icons.android, size: 50, color: Colors.blue),
                          CloseButton(),
                          BackButton(),
                          Chip(
                              avatar: Icon(Icons.people),
                              label: Text("我是一个chip")),
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
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.all(10),
                            child: PhysicalModel(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              clipBehavior: Clip.antiAlias, //抗锯齿
                              child: PageView(
                                children: <Widget>[
                                  _item("第一个页面", Colors.blue),
                                  _item("第二个页面", Colors.red),
                                  _item("第三个页面", Colors.green)
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Colors.greenAccent),
                                  child: Text("宽度撑满"),
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: <Widget>[
                              Image.network(
                                  'http://www.devio.org/img/avatar.png'),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                child: Image.network(
                                    'http://www.devio.org/img/avatar.png'),
                                width: 40,
                                height: 40,
                              )
                            ],
                          ),
                          Wrap(
                            spacing: 8, //水平间距
                            runSpacing: 6, //垂直间距
                            children: <Widget>[
                              _chip("Kobe"),
                              _chip("dong"),
                              _chip("hello"),
                              _chip("flutter"),
                              _chip("flutter"),
                              _chip("flutter"),
                              _chip("flutter"),
                              _chip("flutter")
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handlerRefresh,
              )
            : Column(
                children: <Widget>[
                  Text("列表"),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text("拉伸填满高度"),
                  ))
                ],
              ),
      ),
    );
  }

  Future<Null> _handlerRefresh() async {
    await Future.delayed(Duration(microseconds: 2000));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title),
    );
  }

  _chip(String s) {
    return Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.greenAccent.shade700,
          child: Text(s.substring(0, 1)),
        ),
        label: Text(s));
  }
}
