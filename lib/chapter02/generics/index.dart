class Foo<T> {
  T _value;
  Foo(this._value);

  T getValue() {
    return _value;
  }
}

final intFoo = Foo<int>(10);
final stringFoo = Foo<String>('Foo');

T? firstOrNull<T>(List<T> list) {
  if (list.isEmpty) {
    return null;
  }

  /// `.first`プロパティはリストの最初の要素を返す
  /// `list[0]`も使用できる
  return list.first;
  // return list[0];
}

final intList = [1, 2, 3];
final stringList = ['a', 'b', 'c'];

void main() {
  print(intFoo.getValue());
  print(stringFoo.getValue());
  print(firstOrNull(intList));
  print(firstOrNull(stringList));
}
