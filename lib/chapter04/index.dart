import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// テキストフィールドを表示する
/// 日本語化対応をしないとコンテキストメニューが英語になる
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(),
            // 日本語化対応していないと月、日、年の順番になる
            Text(
              DateFormat.yMEd().format(DateTime.now()),
            )
          ],
        ),
      ),
    );
  }
}
