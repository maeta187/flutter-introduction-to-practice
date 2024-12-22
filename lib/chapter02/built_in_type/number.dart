export 'number.dart';

// 数値型

// 整数型
/// 整数はint型を使用する
/// bitサイズはプラットフォームに依存するが昨今のプラットフォームでは64bitが一般的
final _x = 1;
// 16進数リテラル
final _hex = 0xFF;

// 浮動小数型

/// 64bit浮動小数型としてdouble型を使用する
final _y = 1.1;
// 指数リテラル
final _exponent = 1e5;
final _exponents = 1.42e5;

void printNumber() {
  print(_x);
  print(_hex);
  // .runtimeTypeで型を取得
  print(_hex.runtimeType);
  print(_y);
  print(_exponent);
  print(_exponents);
  print(_exponents.runtimeType);
}
