export 'isolate.dart';

import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// アイソレート
/// アイソレートはスレッドやプロセルのような仕組み
/// - 専用のビープメモリを持つ
/// - 専用の単一のスレッドを持ち、イベントループを実行する
/// - アイソレート間でメモリの共有はない
/// 全てのDartプログラムはアイソレートの中で実行される

// Flutterアプリとアイソレート
/// アプリを作る上でアイソレートを意識することはほとんどない
/// アプリでよく実装される時間のかかる処理として、HTTP通信やファイルのI/Oがある
/// これらはOSなどDartコート外で実行されるため、その間Dartコードのアイソレートは他のイベントを処理可能
/// 完了するとDartが再開されるためアプリがフリーズすることはない
void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

// 引数が素数かどうかを判定する関数
bool isPrime(int value) {
  if (value == 1) {
    return false;
  }
  for (var i = 2; i < value; i++) {
    developer.log('Checking $i');
    if (value % i == 0) {
      return false;
    }
  }
  return true;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            ElevatedButton(
              onPressed: () async {
                const number = 67280421310721;
                final result = await compute((number) {
                  return isPrime(number);
                }, number);
                developer.log('$number is prime: $result');
              },
              child: const Text('Check Prime'),
            )
          ],
        ),
      ),
    );
  }
}
