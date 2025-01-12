export 'sealed.dart';

// sealed
/// `sealed`修飾子を使用するとサブタイプをEnumのように扱うことができる
/// また、`sealed`修飾子を使用して宣言されたクラスは自身が宣言されたライブラリ以外で全てのサブタイプを禁止する
/// `final`と似ていいるが、クラス自身が暗黙的に`abstract`となる
sealed class SealedShape {
  abstract int corner;
}

// インスタンス化できない
// Shape shape = Shape();

class SealedRectangle extends SealedShape {
  @override
  int corner = 0;
}

class SealedTriangle extends SealedShape {
  @override
  int corner = 3;
}

class SealedCircle extends SealedShape {
  @override
  int corner = 1;
}

SealedShape getSealedShape(String name) {
  switch (name) {
    case 'rectangle':
      return SealedRectangle();
    case 'triangle':
      return SealedTriangle();
    case 'circle':
      return SealedCircle();
    default:
      throw Exception('Unknown shape');
  }
}
