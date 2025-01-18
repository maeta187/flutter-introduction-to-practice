import 'package:flutter/material.dart';

// 状態を持たないウィジェット
/// `https://dartpad.dev`で動作確認
/// StatelessWidgetなので、`_count`をインクリメントするような処理を加えても画面に反映されない
class StatelessCounter extends StatelessWidget {
  const StatelessCounter({super.key});

  final int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 100,
      height: 100,
      child: Center(
        child: Text(
          '$_count',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}

// 状態を持つウィジェット
/// `https://dartpad.dev`で動作確認
/// `StatefulWidget`は`build`メソッドを持っていない
/// 代わりに`createState`メソッドをオーバーライドして、`State`オブジェクトを返す
/// `build`メソッドは`State`クラスで実装する
class StatefulCounter extends StatefulWidget {
  const StatefulCounter({super.key});

  @override
  State<StatefulCounter> createState() => _CounterState();
}

// `State`クラス
/// `State`クラスは状態変化したことをフレームワークに知らせる`setState`というメソッドを持っている
/// このメソッドが呼ばれると、`build`メソッドが再度呼ばれる
class _CounterState extends State<StatefulCounter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _count++;
        });
      },
      child: Container(
        color: Colors.white,
        width: 100,
        height: 100,
        child: Center(
          child: Text(
            '$_count',
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
