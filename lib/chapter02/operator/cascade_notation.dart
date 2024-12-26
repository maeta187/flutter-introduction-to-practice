export 'cascade_notation.dart';

final sb = StringBuffer()..write('foo');

class _UserData {
  String? name;
  String? email;
  String? password;

  void greet() {
    print('Hello, $name');
  }

  String? getName() {
    return name;
  }
}

final _normalUser = _UserData();

// カスケード記法
/// `..`を使用することで、同じオブジェクトに対して複数のメソッドを呼び出しやプロパティを設定できる
/// 但し、返り値を返すメソッドを実行しても、返り値は無視され引き続きインスんタンスやオブジェクトが返される
final _user = _UserData()
  ..name = 'John'
  ..email = ''
  ..password = ''
  ..greet()
  // 返り値は無視される
  ..getName();

// カスケード記法を使用した場合でも。インスタンスから実行する
final _userName = _user.getName();

void printCascadeNotation() {
  print(sb);
  // 通常の書き方
  _normalUser.name = 'John';
  print(_user.name);
  print(_userName);
}
