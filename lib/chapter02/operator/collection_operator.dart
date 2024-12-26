export 'collection_operator.dart';

// コレクションオペレータ
// DartではList、Set、Mapのリテラルのみ使用可能

// Spread演算子

final _list1 = [1, 2, 3];

/// `...`を使用してリストを結合
final _list2 = [..._list1, 4, 5];

var _list3 = [4, 5, 6];

final _flag = true;

/// コレクション内にif文が使用可能
/// elseやelse ifも使用可能
final _list4 = [
  ..._list1,
  if (_flag) 4 else 5,
];

/// コレクション内にfor文が使用可能
final _list5 = [0, for (var i in _list1) i * 2];

void printCollectionOperator() {
  // 他言語と同様イミュータブルなリストを作成も可能
  _list3 = [...[], ..._list1];
  print(_list2);
  print(_list3);
  print(_list4);
  print(_list5);
}
