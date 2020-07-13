import 'package:flutter/material.dart';

class StatefulGroup extends StatefulWidget {
  @override
  _StatefulGroupState createState() => _StatefulGroupState();
}

class _StatefulGroupState extends State<StatefulGroup> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = new TextStyle(fontSize: 16, color: Colors.blue);

    return MaterialApp(
      title: 'StatefulWidget基础组建',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Text("StatefulWidget基础学习",
                style: TextStyle(color: Colors.white)),
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
                            child: PageView(
                              children: <Widget>[
                                _item("第一个页面", Colors.blue),
                                _item("第二个页面", Colors.red),
                                _item("第三个页面", Colors.green)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handlerRefresh,
              )
            : Text("我是一个列表页面"),
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
}
