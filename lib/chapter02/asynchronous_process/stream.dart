export 'stream.dart';

import 'dart:io';

// Stream型
/// 非同期的に連続した値を扱う
/// `openRead`メソッドはファイルを鵜読み込み、一定サイズごとにデータを返す
/// `Stream`は`listen`メソッドで購読し、データが通知された時に呼び出されるコールバックを登録する
void _asynchronousStream() {
  final file = File('file.txt');
  final Stream<List<int>> stream = file.openRead();
  stream.listen((data) {
    print('data: ${data.length} bytes');
  });
}

/// `async-await`と`for`を使用して同期的なコード
void _synchronousStream() async {
  final file = File('file.txt');
  final Stream<List<int>> stream = file.openRead();
  await for (final data in stream) {
    print('data: ${data.length} bytes');
  }
}

/// `cancel`を呼び出すと、以降のイベントが通知されなくなる
/// キャンセルすることでStreamでリソース解放処理が発生する場合がある
/// 解放処理の完了や例外をけんちするために`cancel`の戻り値の型は`Future`となる
/// 例えばファイルを`openRead`で開いた後に削除するようなケースで利用する
void _cancelSubscription() {
  final file = File('file.txt');
  final subscription = file.openRead().listen((data) {
    print('data: ${data.length} bytes');
  });
  Future<void> result = subscription.cancel();
}

/// 購読の一時停止は`pause`メソッド、再開は`resume`メソッドを使用する
void _pauseSubscription() async {
  final file = File('file.txt');
  final subscription = file.openRead().listen((data) {
    print('data: ${data.length} bytes');
  });

  await Future<void>.delayed(const Duration(seconds: 1));
  // 一時停止
  subscription.pause();
  await Future<void>.delayed(const Duration(seconds: 3));
  // 再開
  subscription.resume();
}

/// Stream型を返す関数を実装する時は`async*`を使用する
/// 関数を呼び出されるとStreamを生成し、Streamが購読されると関数本体が実行される
/// `yield`に続いて値を記述すると、その値が戻り値のStreamとして通知される
/// 購読のキャンセルされた際は、次の`yield`文が実行されると関数の中断が行われる
Stream<String> _streamReturnType() async* {
  await Future.delayed(const Duration(seconds: 1));
  yield 'Dart';
  await Future.delayed(const Duration(seconds: 1));
  yield 'Kotlin';
  await Future.delayed(const Duration(seconds: 1));
  yield 'Swift';
  await Future.delayed(const Duration(seconds: 1));
  yield 'TypeScript';
}

/// Streamは購読をキャンセルしない限り終了しない特性を持ったものもある
/// `Stream.periodic`はコンストラクタから得られるStreamは一定間隔で繰り返し通知するStreamを生成する
/// このような処理を`async-await`と`for`を使用して実行すると、後続の処理が実行されないケースがある
Future<void> _nonCancelSubscription() async {
  await for (final count in Stream<int>.periodic(
    const Duration(seconds: 1),
    (int count) => count,
  )) {
    print(count);
  }
}

Future<void> printStream() async {
  _asynchronousStream();
  _synchronousStream();
  _cancelSubscription();
  _pauseSubscription();
  _streamReturnType();

  /// Streamの終了時に処理を実行するにはlistenメソッドの`onDone`にコールバックを渡す
  _streamReturnType().listen((data) {
    print(data);
  }, onDone: () {
    print('Done');
  });

  /// `async-await`と`for`を使用するとStream処理が終わるとfor文から抜ける
  await for (final data in _streamReturnType()) {
    print(data);
  }
  print('Done');
  // _infiniteLoop();
}
