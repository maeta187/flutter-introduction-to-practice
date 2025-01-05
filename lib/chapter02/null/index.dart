// 初期値がnullになる
int? _null;

String? _str;

/// 関数内の変数はifの処理を抜けると型が保証される
/// フィールド変数はどこで値が変更されるかわからないため、型が保証されない
void printStringLength() {
  String? nullableString;
  if (nullableString == null) {
    return;
  }
  print(nullableString.length);
}

void main() {
  print(_null);
  print(_null.runtimeType);

  /// クエスチョンマークをつけるとnullの場合でもエラーにならない
  print(_str?.length);

  /// `??`を使用することで右辺がnullの場合は左辺が処理される(代入時にも使用可能)
  print(_null ?? 'foo');

  /// 対象の変数がnullの場合は代入される
  _str ??= 'bar';
  print(_str);
}
