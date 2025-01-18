export 'zone.dart';

import 'dart:async';

// Zone
/// Dartには`Zone`と言う非同期処理のコンテキストを管理する仕組みがある
/// その機能の１つに非同期処理でほそくされたなかった例外のハンドリングがある
/// `Zone`にはエラーハンドリングの他にも`print`関数の動作を変更する機能や、非同期コールバックの登録をほそくする機能がある
Future<String> _fetchUserName() =>
    Future.delayed(const Duration(seconds: 1), () => throw 'User not found');

void printZone() {
  // Zoneを使わない処理
  /// 例外がスローすると、`FUture`への例外発生時のコールバックが登録されていないため、実行するとプログラムが強制終了する
  _fetchUserName().then((data) {
    print(data);
  });

  // Zoneを使った処理
  /// `runZonedGuarded`は第1引数で受け取った処理を自身の`Zone`で実行する
  /// 第2引数には自身の`Zone`で発生した例外をハンドリングするコールバックを渡す
  /// 実行すると強制終了することなく例外がハンドリングされる
  /// Flutterのエラーハンドリングは`Zone`ではなく`PlatformDispatcher`を使用するのが一般的
  runZonedGuarded(() {
    _fetchUserName().then((data) {
      print(data);
    });
  }, (error, stackTrace) {
    print(error);
    print(stackTrace);
  });
}
