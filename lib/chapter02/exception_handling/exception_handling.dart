// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

export 'exception_handling.dart';

// 例外処理

// MyExceptionクラスの定義
class MyException implements Exception {
  final String message; // 例外メッセージを保持するフィールド

  // コンストラクタ
  MyException(this.message);

  @override
  String toString() => 'MyException: $message'; // 例外情報をカスタマイズした文字列で表示
}

/// 他言語同様、try-catch-finallyで例外処理を行う
/// Flutterでは例外を捕捉する機能を持っているので例外がスローされてもアプリが止まることはない(意図的に止めることも可能)
/// `Error`型は間違った関数の使い方や、無効な引数が渡された場合などに使用する。呼び出し元で補足する必要がない場合は、`Error`型を使用する
/// `Exception`型は捕捉されることを目的にしたクラスで、エラーに関する情報を持たせるべきとされている
void exceptionHandlingFunction() {
  try {
    throw MyException('This is my exception!');
  } catch (e) {
    /// `e`の型は`throw`でスローされたクラスの型になる
    print(e.runtimeType);
    print('Caught an exception: $e');
  } finally {
    print('Finally block executed!');
  }
}

/// `on`を使用することで。特定の例外のみをキャッチすることができる
/// `catch`の第1引数には例外オブジェクト。第2引数にはスタックトレースを取得することができる(第2引数は省略可能)
/// `rethrow`を使用するとされに上位の例外処理に例外を投げることができる
/// 上位の例外処理では子で発生した例外オブジェクトとスタックトレースを取得することができる
void exceptionHandlingOnFunction() {
  try {
    // throw Exception('This is an exception!');
    throw MyException('This is my exception!');
  } on MyException catch (e, st) {
    print('Caught an exception: $e');
    print('Stack trace: $st');
    rethrow;
  } on Exception catch (e, st) {
    print('Caught an exception: $e');
    print('Stack trace: $st');
  } finally {
    print('Finally block executed!');
  }
}

Object nonNullObject() {
  // 非nullなオブジェクトを生成して返す
  return {};
}

final Object? _variable = nonNullObject();

void printExceptionHandling() {
  // exceptionHandlingFunction();
  try {
    exceptionHandlingOnFunction();
  } catch (e) {
    print('printExceptionHandling:Caught an exception: $e');
  }

  /// 開発中に思わぬバグが潜んでないかチェックするために`assert`を使用する
  /// `assert`はデバックビルト時に実行され、エラーとなった場合はプログラムの実行を停止する
  assert(_variable != null);
  assert(_variable != null, 'Variable is null!');

  /// このような実装方法もある
  assert(() {
    print('Debug build');
    return true;
  }());
}

/// Flutterフレームワーク自身がトリガーするコールバックで発生した例外は、`FlutterError.onError`でキャッチすることができる
/// レンダリング処理や、ウィジェットの構築処理で発生した例外をキャッチすることができる
// void main() {
//   FlutterError.onError = (details) {
//     print('FlutterError.onError: $details');
//   };
//   runApp(const MyApp())
// }

/// `FlutterError.onError`以外で発生した例外は`PlatformDispatcher`でハンドリングする
/// ボタンのタップイベントハンドラなど
// void main() {
//   PlatformDispatcher.instance.onError = (error, stack) {
//     print(error);
//     print(stack);
//     return true;
//   };
//   runApp(const MyApp())
// }
