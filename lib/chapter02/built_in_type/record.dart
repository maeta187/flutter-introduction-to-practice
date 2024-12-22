// ignore_for_file: unused_element

export 'record.dart';

// Record型

/// Recode型は複数の値を集約した不変の匿名型を表す
/// 他の言語のタプル型に似ている
final _record1 = (300, 'cake');

/// Record型は`(型1, 型2)`を使用して定義する
/// 宣言した型と同じ要素でないとエラーが発生する(位置指定フィールド)
final (int, String) _record2 = (300, 'cake');

/// Record型は`{key: value, key: value}`を使用して定義することも可能(名前付きフィールド)
/// 型定義を行う場合は`{型 key}`を使用する
final ({int price, String name}) _record3 = (price: 300, name: 'cake');

/// 型定義時に位置指定フィールドへ名前を付けることも可能
/// これは`{型 key}`を使用するのとは違い、値には名前を付けることができない
/// 異なる名前を変数を比較しても値が同じであれば`true`を返す
final (int x, String y) _record4 = (300, 'cake');
final (int price, String name) _record5 = (300, 'cake');

/// 位置指定フィールドと名前付きフィールドを組み合わせることも可能
/// 名前付きフィールドは名前によって値を識別するため、位置指定フィールドの順番が変わってもエラーが発生しない
/// ただし、位置指定フィールドは順番を守らないとエラーが発生する
final (int count, String text, {int price, String name}) _record6 =
    (price: 300, name: 'cake', 99, 'foo');

void printRecord() {
  print(_record1);
  // Record型は不変のため、値の変更ができない
  // _record1[0] = 400;
  // _record1[1] = 'apple';
  // 値が同じなので`true`を返す
  print(_record2 == _record4);

  /// 名前付きフィールドは同名ゲッタで値を取得できる
  print(_record6.name);
  print(_record6.price);

  /// 位置指定フィールドは`$`を使用して値を取得できる
  print(_record6.$1);
  print(_record6.$2);
}
