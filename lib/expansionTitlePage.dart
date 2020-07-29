import 'package:flutter/material.dart';

const CITY_NAMES = {
  '北京': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区', '海淀区', '顺义区'],
  '上海': ['黄浦区', '徐汇区', '长宁区', '静安区', '普陀区', '闸北区', '虹口区'],
  '广州': ['越秀', '海珠', '荔湾', '天河', '白云', '黄埔', '南沙', '番禺'],
  '深圳': ['南山', '福田', '罗湖', '盐田', '龙岗', '宝安', '龙华'],
  '杭州': ['上城区', '下城区', '江干区', '拱墅区', '西湖区', '滨江区'],
  '苏州': ['姑苏区', '吴中区', '相城区', '高新区', '虎丘区', '工业园区', '吴江区']
};

class ExpansionTest extends StatefulWidget {
  @override
  _ExpansionTestState createState() => _ExpansionTestState();
}

class _ExpansionTestState extends State<ExpansionTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表的收缩与伸展"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical, //设置水平方向还是垂直方向
        children: _buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    CITY_NAMES.keys.forEach((key) {
      widgets.add(_item(key, CITY_NAMES[key]));
    });
    return widgets;
  }

  Widget _item(String city, List<String> values) {
    return ExpansionTile(
      title: Text(
        city,
        style: TextStyle(fontSize: 16, color: Colors.black54),
      ),
      children: values.map((value) {
        return _buildSub(value);
      }).toList(),
    );
  }

  Widget _buildSub(String value) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(value),
      ),
    );
  }
}
