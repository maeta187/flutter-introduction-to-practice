export 'implicit_interface.dart';

class _Animal {
  String greet() => 'Hello';
}

/// `implements`で暗黙的なインターフェースを実装する
/// `extends`と異なりクラスで定義されているメソッドやプロパティを実装する必要がある
/// スーパークラスからメソッドやプロパティを継承することはできない
/// 複数のクラスをイインターフェースとして利用できる
class _ImplementRideDog implements _Animal {
  @override
  String greet() => 'Bow-wow';
}

void printImplicitInterface() {
  final _Animal animal = _ImplementRideDog();
  print(animal.greet());
}
