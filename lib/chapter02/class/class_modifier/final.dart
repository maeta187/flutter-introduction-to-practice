export 'final.dart';

// final
/// インスタンス化 : ○
/// extends : ×
/// implements : ×
/// `final`修飾子を使用して宣言されたクラスは自身が宣言されたライブラリ以外で全てのサブタイプを禁止する
final class FinalAnimal {
  String greet() => 'Hello';
}
