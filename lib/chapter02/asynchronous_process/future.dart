export 'future.dart';

import 'dart:io';

// Future型
/// 非同期処理の結果を取り扱う
/// `readAsString`は非同期的にファイルの内容を読み込み、文字列として返す
/// 戻り値の型は`Future<String>`
/// `then`メソッドには処理が完了した時に呼び出されるコールバックを渡す
void _asynchronousFuture() {
  Future<String> content = File('file.txt').readAsString();
  content.then((String value) {
    print(value);
  });
}

/// `async-await`を使用して同期的なコードを記述できる
/// `await`は`async`関数内でのみ使用可能(トップレベルで使用不可)
/// `.readAsString`の処理が完了するまで待機する
/// 戻り地の型は`String`となる
/// `async`を使用した関数は暗黙的に`Future`クラスでラップされる
Future<void> _synchronousFuture() async {
  final String content = await File('file.txt').readAsString();
  print(content);
}

Future<String> _fetchUserName() {
  final str = Future.delayed(
    const Duration(seconds: 1),
    () => throw 'User nor found',
  );
  return str;
}

Future<void> printFuture() async {
  _asynchronousFuture();
  _synchronousFuture();

  /// `catchError`メソッドで例外が発生した時に呼び出されるコールバックを登録する
  _fetchUserName().then((name) {
    print('User name: $name');
  }).catchError((e) {
    print(e);
  });

  /// `try-catch`を使用して例外をキャッチする
  try {
    final name = await _fetchUserName();
    print('User name: $name');
  } catch (e) {
    print(e);
  }

  /// 例外発生時に返す代替えの値がある場合は`onError`メソッドを使用する
  final result = await _fetchUserName()
      .then((name) => 'User name: $name')
      .onError((error, stackTrace) {
    print(error);
    print(stackTrace);
    return 'User name: Unknown';
  });
  print(result);
}
