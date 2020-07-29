import 'package:flutter/material.dart';

List<String> cityNames = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '杭州',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '洛阳',
  '厦门',
  '青岛',
  '拉萨'
];

class RefreshPage extends StatefulWidget {
  @override
  _RefreshPageState createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  final title = '高级功能列表下拉刷新与上拉加载更多功能实现';

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: RefreshIndicator(
          child: ListView(
            controller: _scrollController,
            children: _buildList(),
          ),
          onRefresh: _handleRefresh),
    );
  }

  List<Widget> _buildList() {
    return cityNames.map((city) {
      return _itemBuild(city);
    }).toList();
  }

  Widget _itemBuild(String city) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Text(city),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames = cityNames.reversed.toList();
    });
    return null;
  }

  _loadData() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      List<String> list = List<String>.from(cityNames);
      list.addAll(cityNames);
      cityNames = list;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
