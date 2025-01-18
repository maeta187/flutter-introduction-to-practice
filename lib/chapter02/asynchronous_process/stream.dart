export 'stream.dart';

import 'dart:io';
import 'dart:async';

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
  // throw 'Error';
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

Future<void> _executeStreamReturnType() async {
  _streamReturnType();

  /// Streamの終了時に処理を実行するにはlistenメソッドの`onDone`にコールバックを渡す
  _streamReturnType().listen((data) {
    print(data);
  }, onDone: () {
    print('Done');
  });

  /// `async-await`と`for`を使用するとStream処理が終わるとfor文から抜ける
  // await for (final data in _streamReturnType()) {
  //   print(data);
  // }
  // print('Done');

  /// Streamの例外を処理するには`listen`メソッドの`onError`にコールバックを渡す
  /// `listen`メソッドのだ第4引数に`cancelOnError`を`true`にすると、例外が発生した時に購読がキャンセルされる
  _streamReturnType().listen((data) {
    print(data);
  }).onError((error, stackTrace) {
    print(error);
    print(stackTrace);
  });

  /// `async-await`と`for`を使用する場合は`try-catch`を使用して例外をキャッチする
  try {
    await for (final data in _streamReturnType()) {
      print(data);
    }
  } catch (e) {
    print(e);
  }
}

// StreamController
/// StreamControllerは簡単にStreamを生成するためのクラス
/// `_Counter`クラスは内部に`StreamController`を持ち、`increment`メソッドが呼ばれると`StreamController`に値を送信する
/// `StreamController`への値の送信は`add`メソッドを使用する
/// `StreamController`では外部からイベント送信ができるため、より柔軟なStreamを扱うことができる
/// 例外を送信する`addError`メソッドや、購読されているかを判定する`hasListener`メソッドも提供されている
/// `StreamController`は購読されなくても`add`メソッドで値を送信することができ、その値はバッファリングされ購読された時に一斉に通知される
/// そのため用途によってはメモリを消費する可能性があるので注意が必要
class _Counter {
  int _count = 0;
  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void increment() {
    _count++;
    _controller.sink.add(_count + 1);
  }
}

Stream<String> _broadcastReturnType() async* {
  await Future.delayed(const Duration(milliseconds: 500));
  yield 'Dart';
  await Future.delayed(const Duration(milliseconds: 500));
  yield 'Kotlin';
  await Future.delayed(const Duration(milliseconds: 500));
  yield 'Swift';
  await Future.delayed(const Duration(milliseconds: 500));
  yield 'TypeScript';
}

// ブロードキャスト
/// 1つのStreamに対して複数回購読すると例外が発生する
/// 複数の購読者へイベント通知するには`asBroadcastStream`を使用する
/// ブロードキャストタイプのStreamは最初に購読されたタイミングでものStreamの購読を開始する
/// そのため①で待機している間は`_broadcastReturnType`関数の本体は実行されません
/// ②で購読を開始すると、`_broadcastReturnType`関数の本体が実行され、`yield`で値が通知される
/// ③で2つ目の購読がスタートすると。そのタイミングからイベント通知され、それまでの値は通知されない
Future<void> _broadcast() async {
  final broadcastStream = _broadcastReturnType().asBroadcastStream();

  // ①
  await Future.delayed(const Duration(milliseconds: 1100));

  // ②
  broadcastStream.listen((data) {
    print('listener 1: $data');
  });

  await Future.delayed(const Duration(milliseconds: 1100));

  // ③
  broadcastStream.listen((data) {
    print('listener 2: $data');
  });
}

Future<void> _streamController() async {
  final counter = _Counter();
  counter.increment();
  counter.increment();
  counter.stream.listen((count) {
    print('count: $count');
  });

  counter.increment();
}

// Streamを変更する
Stream<int> _numberStream() {
  return Stream.fromIterable(List.generate(10, (index) => index));
}

/// Streamの値を変換する`map`
/// Streamの値をフィルタリングする`where`
/// Streamの値の最大数を制限する`take`
void _executeNumberStream() {
  _numberStream()
      .where((i) => i % 2 == 0)
      .map((i) => i * 2)
      .take(3)
      .listen((i) {
    print(i);
  });
}

Future<void> printStream() async {
  _asynchronousStream();
  _synchronousStream();
  _cancelSubscription();
  _pauseSubscription();
  _executeStreamReturnType();
  _streamController();
  _broadcast();
  _executeNumberStream();
}
