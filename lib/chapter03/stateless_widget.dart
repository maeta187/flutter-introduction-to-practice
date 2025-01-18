import 'package:flutter/material.dart';

// 状態を持たないウィジェット
/// `https://dartpad.dev`で動作確認
/// コンストラクタの第1引数の`key`はフレームワークがウィジェットのライフサイクルを判断するためのオブジェクト
class AnimalView extends StatelessWidget {
  const AnimalView({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 100,
      height: 100,
      child: Center(
        child: Text(
          text,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
