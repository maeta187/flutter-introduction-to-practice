import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';
import 'dart:developer' as developer;

export 'asset.dart';

// 環境変数から値を参照
const endpoint = String.fromEnvironment('apiEndpoint');
const logLevel = int.fromEnvironment('logLevel');
const enableDebugMenu = bool.fromEnvironment('enableDebugMenu');

class Asset extends StatelessWidget {
  const Asset({super.key});
  @override
  Widget build(BuildContext context) {
    developer.log('endpoint: $endpoint');
    developer.log('logLevel: $logLevel');
    developer.log('enableDebugMenu: $enableDebugMenu');
    return Scaffold(
        body: Center(
      // child: Image.asset('assets/circle.png'),
      // flutter_genで生成したAssetsクラスを使用する
      // child: Assets.circle.image(),
      child: Assets.check.svg(
        width: 72,
        height: 72,
      ),
    ));
  }
}
