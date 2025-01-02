export 'pattern_aids.dart';

// パターン補助まとめ

final List<Object> _list = [0, 'one'];
final int? _code = 0;

void checkCode() {
  switch (_code) {
    /// `?`を使用することでnullチェックを行う
    /// `when`と組み合わせて条件を追加することも可能
    case final i? when i == 200:
      print('OK');
      break;

    /// nullアサーション
    /// nullの場合、エラーとなる
    case final i! when i >= 0:
      print('foo');
      break;
    // case 404:
    //   print('Not Found');
    //   break;
    default:
      print('Unknown code');
  }
}

void printPatternAids() {
  /// `ss` を使用することで型を強制することができる
  final [number as int, str as String] = _list;
  print('Number: $number, String: $str');
  checkCode();
}
