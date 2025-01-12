export 'class.dart';
import 'dart:convert'; // utf8で文字列をエンコード
import 'package:crypto/crypto.dart'; // ハッシュ化用

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

// constantコンストラクタ
class _ConstantClass {
  /// クラスインスタンスをコンパイル時に定数化する
  /// コンストラクタに`const`を付与する
  /// インスタンス変数は全て再代入不可となる
  const _ConstantClass(this.x, this.y);

  final int x;
  final int y;
}

void printConstantClass() {
  /// constantコンストラクタは常にコンパイル時に定数を生成するとは限らない
  /// constantコンストラクタの前に`const`を付与する、または`const`変数に代入した場合に、常に同じインスタンスを生成する
  /// 無駄なインスタンス生成を避けることでパフォーマンスを向上させる
  final constantClass1 = const _ConstantClass(10, 20);
  const constantClass2 = _ConstantClass(10, 20);
  final constantClass3 = _ConstantClass(10, 20);
  print(constantClass1 == constantClass2); // true: 同じインスタンス
  print(constantClass1 == constantClass3); // false: 異なるインスタンス
}

// 名前付きコンストラクタ
class _NamedConstructor {
  const _NamedConstructor(this.firstName, this.lastName);

  /// 'クラス名.識別子'で名前付きコンストラクタを定義する
  const _NamedConstructor.noName()
      : firstName = 'John',
        lastName = 'Doe';

  /// 'this'自クラスの別のコンストラクタを呼び出す
  const _NamedConstructor.anonymous() : this('foo', 'bar');

  final String firstName;
  final String lastName;
}

void printNamedConstructor() {
  final namedConstructor1 = _NamedConstructor('Alice', 'Smith');
  final namedConstructor2 = _NamedConstructor.noName();
  final namedConstructor3 = _NamedConstructor.anonymous();
  print(
      'NamedConstructor1: ${namedConstructor1.firstName} ${namedConstructor1.lastName}');
  print(
      'NamedConstructor2: ${namedConstructor2.firstName} ${namedConstructor2.lastName}');
  print(
      'NamedConstructor3: ${namedConstructor3.firstName} ${namedConstructor3.lastName}');
}

// factoryコンストラクタ
/// 必ずしも新しいインスタンスを生成する必要はない場合や初期化リストに記述できない場合に使用する
/// 'factory'キーワードを使用してコンストラクトを実装する場合`return`を使用してインスタンスを返す必要がある
class UserData {
  static final Map<int, UserData> _cache = {};

  UserData();

  factory UserData.fromCache(int userId) {
    print(_cache);
    final cache = _cache[userId];
    if (cache != null) {
      // キャッシュがある場合はキャッシュを返す
      return cache;
    }

    // キャッシュがない場合は新しいインスタンスを生成してキャッシュに追加
    final newInstance = UserData();
    _cache[userId] = newInstance;
    return newInstance;
  }
}

void printFactoryConstructor() {
  final userData1 = UserData.fromCache(1);
  final userData2 = UserData.fromCache(2);
  final userData3 = UserData.fromCache(1);
  print(userData1 == userData2); // false: 異なるインスタンス
  print(userData1 == userData3); // true: 同じインスタンス
}
