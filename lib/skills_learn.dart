void main() {
  List list;
  print(list?.length); //善用?.的方式安全的调用

//设置默认值（双问号设置默认值）

  print(list?.length ?? 0);

  //简化代码
  List list1 = [];
  list1.add(0);
  list1.add(null);
  list1.add('');

  if (list1[0] == 0 || list1[0] == null || list1[0] == '') {
    print("list[0]  is ok");
  }

//  简化后

  if ([0, null, ''].contains(list1[0])) {
    print("list[0]  is ok");
  }
}
