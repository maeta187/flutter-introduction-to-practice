export 'interface.dart';

// interface
/// インスタンス化 : ○
/// extends : ×
/// implements : ○
/// `interface`修飾子を使用して宣言されたクラスは自身が宣言されたライブラリ以外では`extends`を使った継承ができない
/// `abstract`と組み合わせて純粋な実装を持たないインターフェースを宣言できる
interface class InterfaceAnimal {
  String greet() => 'Hello';
}

// ライブラリ内なのでエラーにならない
class _Cat extends InterfaceAnimal {
  @override
  String greet() => 'Meow';
}
