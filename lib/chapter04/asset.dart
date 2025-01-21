import 'package:flutter/material.dart';

export 'asset.dart';

class Asset extends StatelessWidget {
  const Asset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset('assets/circle.png'),
    ));
  }
}
