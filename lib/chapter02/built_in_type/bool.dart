export 'bool.dart';

// bool型

/// 真偽値はbool型を使用する
final _flag1 = true;
final _flag2 = false;
final String? _value1 = null;
final _value2 = '';

/// JavaScriptのように2重否定演算子を使用もできるが、Dartでは推奨されない
final _flag3 = _value1 != null;

/// .isNotEmptyで空文字かどうかを判定するただし、nullの場合はエラーが発生する
final _flag4 = _value2.isNotEmpty;

void printBool() {
  print(_flag1);
  print(_flag2);
  print(_flag3);
  print(_flag4);
}
