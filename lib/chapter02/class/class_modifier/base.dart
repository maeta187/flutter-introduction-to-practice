export 'base.dart';

// base
/// インスタンス化 : ○
/// extends : ○
/// implements : ×
/// `base`修飾子を使用して宣言されたクラスは自身が宣言されたライブラリ以外では`implements`を使った実装ができない

base class BaseAnimal {
  String greet() => 'Hello';
}

// ライブラリ内なのでエラーにならない
base class _BaseDog implements BaseAnimal {
  @override
  String greet() => 'Bow-wow';
}
