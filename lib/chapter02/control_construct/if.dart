export 'if.dart';

// if

final _num = 1;
final String? _string = 'foo';

final (String?, int?) _res = ('OK', 200);

void printIf() {
  if (_num > 0) {
    print('num is positive');
  } else if (_num < 0) {
    print('num is negative');
  } else {
    print('num is zero');
  }

  /// 他言語と同様`if`、`else`は使用できる
  /// 但し、`if(_string)`のような条件式は使用できない
  /// 代わりに`if(_string != null)`を使用するが中の処理は`_string`が`null`でないことを保証しない
  if (_string != null) {
    print(_string?.toUpperCase());
  }

  /// if-case文を使用することで対象の値の型を指定して条件分岐を行うことができる
  /// 処理内では型が保証される
  if (_res case (String message, int statusCode)) {
    print('$message: $statusCode');
  }

  /// `when`キーワードを使用して条件を追加することも可能
  if (_res case (String message, int statusCode) when statusCode == 200) {
    print('$message: $statusCode');
  }
}
