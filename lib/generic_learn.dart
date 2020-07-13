//泛型方法的学习
import 'opp_learn.dart';

class TestGeneric {
  void start() {
    Cache<String> _cache = Cache();
    _cache.setItem("cache1", "kobe");
    String str = _cache.getItem("cache1");
    print(str);
  }
}

class Cache<T> {
  static final Map<String, Object> _map = Map();

  void setItem(String key, T t) {
    _map[key] = t;
  }

  T getItem(String key) {
    return _map[key];
  }
}

//泛型方式2
class Member<T extends Person> {
  T  _person;

  Member(this._person);

  String start() {
    return _person.name;
  }
}
