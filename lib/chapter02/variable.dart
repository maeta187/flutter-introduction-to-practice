// Int型で変数を宣言
int age = 0;

// 型を指定していないが型推論される
var varAge = 0;

// 定数を宣言
final int finalAge = 0;

// 型を指定していないが型推論される
final _age = 0;

/// `const`も定数を宣言する
/// コンパイル時に定数として扱われる
/// 静的なクラス変数を除いたクラスでは使用できない
/// `final`で宣言されらクラスフィールドは変更可能だが、`const`で宣言されたクラスフィールドは変更不可能
const int constAge = 0;

final flag = DateTime.now().hour.isEven;

/// `late`を使用して変数の遅延初期化を行う
/// 使用すると変数にアクセスするまで初期化されない
/// `final`を使用した場合でも、初期化であれば代入が可能
/// ただし、初期化されていない変数にアクセスするとエラーが発生する
late int foo;

void main() {
  // if文は関数やメソッドの中で使用する
  if (flag) {
    foo = 1;
  } else {
    foo = 2;
  }
  print(flag);
  print(foo);
}
