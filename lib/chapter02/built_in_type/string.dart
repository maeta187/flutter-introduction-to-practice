export 'string.dart';

// String型

/// シングルクォートかダブルクォートで囲む
final _str = 'Hello World!';

final _name = 'John';

/// 文字列内で変数を展開する場合は`$`を使用する
final _str1 = 'Hello, $_name!';

/// 関数や式を展開する場合は`${}`を使用する
final _str2 = 'Hello, ${_name.toUpperCase()}!';

final _greeting = 'Hello, ';

/// 複数の文字列は自動的に連結され、明示的に連結する場合は`+`を使用する
/// 改行されていても連結される
final _message = 'Hello,' 'John';
final _message1 = _greeting + _name;

void printString() {
  print(_str);
  print(_str1);
  print(_str2);
  print(_message);
  print(_message1);
}
