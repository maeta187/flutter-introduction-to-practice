export 'loop.dart';

final List<int> _list = [1, 2, 3];

/// 'while' は条件が`true`の場合に処理を繰り返す
/// `do-while` は条件が`false`でも最初の1回は処理を実行する
void whileExample() {
  int count = 0;
  do {
    // 最初の1回は条件を無視して処理を実行する
    print('Count is $count');
    count++;
  } while (count < 5);
  print('While loop finished!');
}

void printLoop() {
  for (var i = 0; i < 3; i++) {
    print(i);
  }

  // for-in
  for (var i in _list) {
    print(i);
  }

  // forEach
  /// `forEach`は使用できるが、柔軟性が低いことから`for`文の使用が推奨される
  _list.forEach(print);
  whileExample();

  // `continue`と`break`の使用
  for (var i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      continue;
    }

    if (i > 6) {
      break;
    }

    print(i);
  }
}
