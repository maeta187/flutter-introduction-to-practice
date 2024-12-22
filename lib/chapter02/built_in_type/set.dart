// ignore_for_file: unused_element

export 'set.dart';

// Set型

/// Set型は`{}`を使用し、リストと異なり重複を許さない
final _fruits1 = {'Apple', 'Orange', 'Grape'};

/// Set型は`Set<型>`を使用して宣言もしくは`<型>{}`を使用して定義する
final Set<String> _fruits2 = {'Apple', 'Orange', 'Grape'};
final _fruits3 = <String>{'Apple', 'Orange', 'Grape'};

void addToSet() {
  _fruits1.add('Banana');
  // 重複する要素を追加してもエラーが発生しないが、追加されない
  _fruits1.add('Apple');
  // list型と同様に異なる型の要素を追加するとエラーが発生する
  // _fruits.addAll(1);
}

void printSet() {
  print(_fruits1);
  addToSet();
  print(_fruits1);
}
