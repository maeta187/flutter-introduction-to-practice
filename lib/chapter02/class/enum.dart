export 'enum.dart';

// Enum
/// `enum`を使用して列挙型を定義できる
/// フィールド。メソッド、constantコンストラクタを持ったEnumも宣言できる
/// いくつか条件がある
/// 1. 1つ以上のインスタンス全てが冒頭で宣言されていなくてはならない
/// 2. インスタンス変数は`final`でなくてはならない(mixinで追加されるものも同様)
/// 3. コンストラクタはconstantコンストラクタまたは、factoryコンストラクタが宣言可能
/// 4. 他のクラスを継承できない
/// 5. index、hashCode `==`演算子をオーバーライドできない
/// 6. `values`と言うメンバを宣言できない
enum _Shape {
  circle(corner: 0),
  triangle(corner: 3),
  square(corner: 4);

  final int corner;

  const _Shape({required this.corner});

  factory _Shape.ellipse() => circle;
}

void printEnum() {
  // circleを取得
  final ellipse = _Shape.ellipse();
  final circle = _Shape.circle;
  final triangle = _Shape.triangle;
  final square = _Shape.square;
  print(ellipse.corner);

  /// `Enum名.フィールド名`で値の参照もできるが、`Enum名.index`でインデックスも取得できる
  print('circle value: $circle, index: ${circle.index}');
  print('triangle value: $triangle, index: ${triangle.index}');
  print('square value: $square, index: ${square.index}');

  /// `Enum名.values`で全ての値を取得できる
  /// for分で繰り返し処理も可能
  _Shape.values.forEach((v) {
    print(v.name);
  });
}
