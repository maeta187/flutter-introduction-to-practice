export 'abstract.dart';

// abstract
/// インスタンス化 : ×
/// extends : ○
/// implements : ○
/// `abstract`修飾子を使用して宣言されたクラスは本体のない関数を宣言できる
abstract class _AbstractAnimal {
  String greet();
}

class _AbstractDog extends _AbstractAnimal {
  @override
  String greet() => 'Bow-wow';
}

void printAbstract() {
  // final animal = _Animal(); // エラー
  final dog = _AbstractDog();
  print(dog.greet());
}
