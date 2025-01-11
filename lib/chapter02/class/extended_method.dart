export 'extended_method.dart';

// 拡張メソッド
/// `extension`を使用して既存のクラスへメソッドやgetter、setterを追加できる
/// プライベートにすることで他のファイルやライブラリからアクセスできないようにすることも可能
extension _SwapList<T> on List<T> {
  /// 拡張メソッド内でプライベートメソッドにすると拡張メソッドのみで使用できる
  bool _noNeedToSwap(List<T> list) {
    return list.isEmpty;
  }

  void swap(int index1, int index2) {
    if (_noNeedToSwap(this)) {
      return;
    }
    final temp = this[index1];
    this[index1] = this[index2];
    this[index2] = temp;
  }
}

/// 名前のない拡張メソッドは同一ファイル内でのみ使用できる
/// 拡張元に型定義が必要
/// ジェネリクスも使用可能
extension<T> on List<T> {
  void foo() {
    print('foo');
  }
}

final list = [1, 2, 3];

void printExtendedMethod() {
  // 拡張メソッドの呼び出し
  list.swap(0, 2);
  print(list); // [3, 2, 1]
  list.foo();
}
