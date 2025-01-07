export 'class.dart';
class _Point1 {
  // コンストラクタ
  /// `:`の後に初期化リストを記述する
  _Point1(int xPosition, yPosition)
      : x = xPosition,
        y = yPosition;

  // フィールド
  int x;
  int y;
}

class _Point2 {
  /// `this`を使用してコンストラクタの引数を直接初期値として設定する
  _Point2(this.x, this.y);

  int x;
  int y;
}

class _Point3 {
  /// 初期化リストでパラメータのアサーションが可能
  /// `false`になるとエラーとなる。但し、デバックモードでのみ有効
  /// 本番環境には影響しない
  /// `--enable-asserts `でデバックモードを有効にする
  _Point3(this.x, this.y)
      : assert(x >= 0),
        assert(y >= 0);

  int x;
  int y;
}

class _User {
  _User(this.id, this._password);

  final int id;
  String _password;

  // ハッシュ化関数
  String _hash(String input) {
    final bytes = utf8.encode(input); // UTF-8エンコード
    final digest = sha256.convert(bytes); // SHA-256でハッシュ化
    print(digest);
    return digest.toString(); // ハッシュ値を文字列として返す
  }

  // getter
  String get getPassword => '******';

// setter
  set setPassword(String value) {
    _password = _hash(value);
  }
}

void printClass() {
  final point1 = _Point1(10, 20);
  final point2 = _Point2(30, 40);
  final point3 = _Point3(-10, -20);
  final user = _User(1, 'password');
  // setterを使用してパスワードをハッシュ化
  user.setPassword = 'password';

  print('Point1: (${point1.x}, ${point1.y})');
  print('Point2: (${point2.x}, ${point2.y})');
  print('Point3: (${point3.x}, ${point3.y})');
  print('User: ${user.id}, ${user.getPassword}');
}
