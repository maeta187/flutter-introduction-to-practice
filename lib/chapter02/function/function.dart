export 'function.dart';

/// `[]`を使用すると省略可能な引数を指定することができる
/// 通常引数と併用するときは末尾に配置する
/// `=`を使用することでデフォルト値を設定することができる
void printColor(String red, String green, [String? alpha = 'blue']) {
  print(red);
  print(green);
  print(alpha);
}

/// 名前付き引数を指定することも可能
/// デフォルトで省略可能なので`required`を指定することで必須にすることができる
/// 通常引数と併用するときは末尾に配置する
/// 呼び出し時に引数名の順番を変更することができる
void objectPrintColor(
    {required String red, required String green, String alpha = 'blue'}) {
  print(red);
  print(green);
  print(alpha);
}

/// アロー関数を使用することも可能
/// 但し、複数行の処理は記述できない
int _doubleValue(int x) => x * 2;

/// 関数を変数に代入することも可能
/// 型定義は`返り値の型` ＋　`Function(引数)`で行う
final int Function(int) _f = _doubleValue;

/// 無名関数を変数に代入することも可能
/// 推奨された書き方ではない
final int Function(int) _f2 = (int x) => x * 2;

/// クロージャの例
/// クロージャ（Closure）とは、プログラム内で関数が宣言された時点の変数やスコープを保持して、関数の実行時にもそのスコープにアクセスできる仕組み
/// xが引数、iがクロージャ内で保持される変数
Function multiple(int i) {
  return (x) {
    print('x: $x, i: $i');
    return x * i;
  };
}

final _f3 = multiple(3);
final _f4 = multiple(7);

void printFunction() {
  printColor('red', 'green');
  printColor('red', 'green', 'alpha');
  objectPrintColor(red: 'red', green: 'green');
  objectPrintColor(red: 'red', green: 'green', alpha: 'alpha');
  print(_doubleValue(10));
  print(_f(20));
  print(_f2(30));
  print(_f3(2));
  print(_f4(6));
}
