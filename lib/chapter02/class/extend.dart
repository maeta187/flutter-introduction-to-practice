export 'extend.dart';

class _Animal {
  String greet() => 'Hello';

  String? dummyMethod() => null;
}

/// `extends`で継承
/// スーパークラスのプロパティやメソッドを利用できる
/// 必要に応じてスーパークラスのメソッドをオーバーライドすることも可能
/// １つのクラスしか継承できない
class _Dog extends _Animal {}

class _SuperDog extends _Animal {
  /// `super`で親クラスのメソッドを呼び出す
  /// 静的ディスパッチ
  /// `super`は親クラスのメソットを直接実行するのでサブクラスのオーバーライドの影響を受けない
  String sayHello() => super.greet();
}

class _OverRideDog extends _Animal {
  /// `@override`でメソッドのオーバーライドが行える
  /// オーバーライドにはいくつか条件がある
  /// 1. 戻り値の型がスーパークラスのメソッドと同じ、またはサブタイプである
  /// 2. 引数の型がスーパークラスのメソッドの引数の型と同じ、またはスーパークラスである
  /// 3. 位置パラーメータの数が同じである
  /// 4. ジェネリックメソッドを非ジェネリックメソッドにオーバーライドすることはできない、逆も同様
  @override
  String greet() => 'Bow-wow';

  /// null許容型のメソットを非null許容型にオーバーライドすることはできる
  /// 但し、他のデータ型のオーバーライドはできない
  @override
  String dummyMethod() => 'dummy';
}

class _ConstantAnimal {
  _ConstantAnimal(this.name);

  final String name;
}

class _ConstantDog extends _ConstantAnimal {
  /// `super`を使用して親クラスのコンストラクタを呼び出す`
  // _ConstantDog(String name) : super(name);
  _ConstantDog(super.name);
}

void printExtend() {
  final dog = _Dog();
  final superDog = _SuperDog();
  final overRideDog = _OverRideDog();
  final constantDog = _ConstantDog('Dog');

  /// インスタンスからメソッドの呼び出しは動的ディスパッチ
  /// インスタンスの型によって実行されるメソッドが変わる
  /// Class内でオーバーライドされている場合はオーバーライドされたメソッドが実行される
  print(dog.greet());
  print(superDog.sayHello());
  print(overRideDog.greet());
  print(overRideDog.dummyMethod());
  print(constantDog.name);
}
