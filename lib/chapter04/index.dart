import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

// テキストフィールドを表示する
/// 日本語化対応をしないとコンテキストメニューが英語になる
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // デフォルトロケールを固定しているが、複数言語対応には向かない
    // Intl.defaultLocale = 'ja';
    /// Localizationsクラスからロケール情報を取得して設定する
    /// MaterialAppウィジェットのsupportedLocalesで渡したロケールの中から最適なものを選択する
    Intl.defaultLocale = Localizations.localeOf(context).toString();
    final l10n = L10n.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(),
            // 日本語化対応していないと月、日、年の順番になる
            Text(
              DateFormat.yMEd().format(DateTime.now()),
            ),
            // ローカライズクラスから取得
            Text(
              l10n?.helloWorld ?? 'foo',
            ),
            // ローカライズクラスから取得
            Text(
              l10n?.numOfSearchResult(10) ?? 'bar',
            ),
          ],
        ),
      ),
    );
  }
}
