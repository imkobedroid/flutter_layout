class Person {
  String name;
  String age;

  Person(this.name, this.age);

  @override
  String toString() {
    return "name:$name   age:$age";
  }
}

class Student extends Person {
  String _school;
  String city;
  String country;
  String name;


  String getCity(){
    return city;
  }

  Student(this._school, String name, String age,
      {this.city, this.country = "china"})
      : name = "$country.$city",
        super(name, age) {
    print("$name");
  }
}





class Kobe extends Person {
  String _name;
  String _info;
  String age;
  String country;
  String birth;
  String id;

  Kobe(String age, this._name, this.country, _info,
      {this.birth, this.id = "1"}) //这里初始化后 参数列表就不能初始化
      : _info = "$_info is $birth",
        super(_name, age) {
    print("my age is $age");
    this._info = _info;
  }

  //命名构造方法  (方法打点调用，可以生成多个构造方法)返回的就是kobe这个类
  Kobe.cover(Kobe kobe) : super(kobe.name, kobe.age) {
    print("命名构造方法");
  }

  //命名构造方法  (方法打点调用，可以生成多个构造方法)  返回的就是kobe这个类
  Kobe.create(String name, String age) : super(name, age);

//  返回的就是kobe这个类
  factory Kobe.stu(Kobe kobe) {
    return Kobe(kobe.age, kobe.name, kobe.country, kobe._info,
        id: kobe.id, birth: kobe.birth);
  }

//  返回的就是kobe这个类
  factory Kobe.stuInfo(String age, String name, String country, String _info) {
    return Kobe(age, name, country, _info);
  }

  //get方法
  String get name => _name;

  //set方法
  set name(String name) {
    this._name = name;
  }

  //静态方法
  static soPrint(String str) {
    print(str);
  }
}

//工厂构造方法
class Logger {
  static Logger _cache;

  factory Logger() {
    if (_cache == null) {
      _cache = Logger._instance();
    }
    return _cache;
  }

  Logger._instance();
}

///抽象类
abstract class Study {
  void study();
}

class StudyFlutter extends Study {
  @override
  void study() {
    print("abstract flutter");
  }
}



//使用mixins
class Test extends Person with Study{

  Test(String name, String age) : super(name, age);

  @override
  void study() {
  }

}