export 'mixin.dart';

/// クラスとの違い
/// 1. インスタンス化できない
/// 2. `extends`で他のクラスから継承できない
/// 3. コンストラクタを使用できない｀
mixin _Horse {
  void run() {
    print('Run');
  }
}

mixin _Bird {
  void fly() {
    print('Fly');
  }
}

///`with`を使用して複数のmixinを継承できる
/// クラスのようにメソッドやフィールドを宣言できる
class _Pegasus with _Horse, _Bird {}

final _pegasus = _Pegasus();

class _Animal {
  String greet() => 'Hello';
}

class _Human {
  String greet() => 'Hi';
}

/// `on`を使用してmixinを制限できる
/// `mixin class`では`on`は使用できない
mixin _Dog on _Animal {
  void bark() {
    print(greet());
    print('Bow-wow');
  }
}

mixin _Cat on _Animal {
  void meow() {
    print(greet());
    print('Meow');
  }
}

class _Pet extends _Animal with _Dog, _Cat {}

// _Dog, _Catは制限されているのでエラーとなる
// class _Foo extends _Human with _Dog, _Cat {}

final _pet = _Pet();

void printMixin() {
  _pegasus.run();
  _pegasus.fly();
  _pet.bark();
  _pet.meow();
}
