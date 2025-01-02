export 'pattern.dart';

final _record = ('cake', 300);
final _record1 = (patternName2: 'cake', patternPrice2: 300);

final dynamic _list = [1, 2, 3];

void matchDataType() {
  /// コレクション型の一致判定ではリテラルに`const`を使用する
  switch (_list) {
    case const [1, 2, 3]:
      print('list');
      break;
    case const {0, 1, 2}:
      print('set');
      break;
    case const {'key': 0}:
      print('map');
      break;
    default:
      print('Not matched!');
  }
}

class _SomeClass {
  const _SomeClass(this.x);
  final int x;
}

final _someInstance = _SomeClass(10);

final sweets = [
  (name: 'cake', price: 300),
  (name: 'dango', price: 200),
];

final Map<int, String> _map = <int, String>{
  200: 'OK',
  301: 'Moved Permanently',
  404: 'Not Found',
  500: 'Internal Server Error'
};

void printPattern() {
  /// `Record`型は分割代入のように値を代入できる(パターン)
  /// 但し全ての構造が一致している必要がある
  final (patternName, patternPrice) = _record;

  /// 名前付きフィールドを使用する場合は、フィールド名を使用する
  final (:patternName2, :patternPrice2) = _record1;
  print('Name: $patternName, Price: $patternPrice');
  print('Name: $patternName2, Price: $patternPrice2');
  matchDataType();

  /// `List`型も分割代入のように値を代入できる(パターン)
  /// `Set`はパターンが使用できない
  final [patternA, patternB, ..., patternC] = [1, 2, 3, 4, 5];
  print('patternA: $patternA, patternB: $patternB, patternC: $patternC');

  /// 'Map'型は`{}`を使用し、キーと値のペアを保持する
  /// keyに一致する値を取得する
  /// `Map`全体と一致する必要はないが、`key`は一致しないtエラーが発生する
  final {
    200: _successful,
    404: _notFound
  } = {200: 'OK', 404: 'Not Found', 500: 'Internal Server Error'};

  print('Successful: $_successful, Not Found: $_notFound');

  /// Classもパターンマッチングで使用できる
  // _numberにxの値が代入される
  final _SomeClass(x: _number) = _someInstance;
  // Class内変数と同じ変数名を使用する場合
  final _SomeClass(:x) = _someInstance;
  print('Number: $_number');
  print('Number: $x');

  /// `for-in`でもパターンマッチングが使用できる
  /// `:`と名前付きフォールドを指定することで`for-of`のような動作が実現できる
  for (final (:name, :price) in sweets) {
    print('Name: $name, Price: $price');
  }

  /// `Map`型も`for-in`で`MapEntry`を使用してパターンマッチングが使用できる
  for (var MapEntry(key: key, value: value) in _map.entries) {
    print('Key: $key, Value: $value');
  }
}
