// ignore_for_file: unused_element

export 'list.dart';

// List型

/// List型は`[]`を使用し、要素はカンマで区切る
final _list = [1, 2, 3];

final _intList1 = [1, 2, 3];

/// List型は`List<型>`を使用して宣言もしくは`<型>[]`を使用して定義する
final List<int> _intList2 = [1, 2, 3];
final _intList3 = <int>[1, 2, 3];

/// 型定義で`dynamic`を使用すると型が混在したリストを作成できる
/// ただし、型が混在すると型の安全性が失われる
final List<dynamic> _mixedList1 = [1, 'a', true];

/// 型定義を行わない場合は`List<Object>`として推論される
final _mixedList2 = [1, 'a', true];

/// List型は可変長リストと固定長リストに分かれる
/// 可変長リストは要素の追加や削除が可能
final _baseList = [1, 2, 3];

/// 固定長リストは要素の追加や削除が不可能
final _fixedLengthList = List.unmodifiable(_baseList);

void addToList() {
  _intList1.add(4);
  // 型が異なる要素を追加するとエラーが発生する
  // _intList.add('a');
  // _mixedListの初期値に含まれていない型が追加できる
  _mixedList1.add(null);
  // 固定長リストに要素を追加するとコード上はエラーが発生しないが、実行時にエラーが発生する
  // _fixedLengthList.add(1);
}

void printList() {
  print(_list);
  addToList();
  print(_intList1);
  print(_mixedList1);
  print(_fixedLengthList);
}
