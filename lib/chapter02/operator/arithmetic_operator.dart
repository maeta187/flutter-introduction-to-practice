export 'arithmetic_operator.dart';

late int _a;
late int _b;
late int _c;
late int _d;
late int _e;
late int _f;
late int _g;
late int _h;

void printArithmeticOperator() {
  print(2 + 3);
  print(2 - 3);
  print(2 * 3);
  print(2 / 3);
  print(2 % 3);

  /// `++_a`はインクリメント後の値を代入
  _a = 0;
  _b = ++_a;

  /// `_c++`はインクリメント前の値を代入
  _c = 0;
  _d = _c++;

  /// `--_e`はデクリメント後の値を代入
  _e = 0;
  _f = --_e;

  /// `_g--`はデクリメント前の値を代入
  _g = 0;
  _h = _g--;

  print('$_a, $_b');
  print('$_c, $_d');
  print('$_e, $_f');
  print('$_g, $_h');
}
