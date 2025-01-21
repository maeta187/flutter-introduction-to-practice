import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import './chapter04/index.dart';
import './chapter04/asset.dart';

// void main() {
//   runApp(const MainApp());
// }

void main() {
  runApp(
    const MaterialApp(
      /// 表示文字列の翻訳情報などを持っている`delegate`を渡す
      /*
      localizationsDelegates: [
        // テキストの方向(左から右、右から左)を扱う
        GlobalWidgetsLocalizations.delegate,
        // マテリアルデザインに準拠したウィジェットで扱う翻訳情報
        GlobalMaterialLocalizations.delegate,
        // IOSスタイルウィジェットで扱う翻訳情報
        GlobalCupertinoLocalizations.delegate,
      ],
      */
      localizationsDelegates: L10n.localizationsDelegates,
      // サポートするロケールを指定する
      /*
      supportedLocales: [
        Locale('ja', 'JP'),
      ],
      */
      supportedLocales: L10n.supportedLocales,
      // home: HomeScreen(),
      home: Asset(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
